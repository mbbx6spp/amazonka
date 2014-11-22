{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

-- Module      : Network.AWS.Data.Internal.Body
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.Data.Internal.Body where

import           Control.Lens
import           Control.Applicative
import           Control.Monad.IO.Class
import           Control.Monad.Morph
import           Control.Monad.Trans.Resource
import           Crypto.Hash
import qualified Crypto.Hash.Conduit            as Conduit
import           Data.Aeson
import           Data.ByteString                (ByteString)
import qualified Data.ByteString                as BS
import qualified Data.ByteString.Lazy           as LBS
import qualified Data.ByteString.Lazy.Char8     as LBS8
import           Data.Conduit
import qualified Data.Conduit.Binary            as Conduit
import           Data.IORef
import           Data.Int
import           Data.Monoid
import           Data.String
import qualified Data.Text                      as Text
import           Network.AWS.Data.Internal.Text
import           Network.HTTP.Client
import           System.IO

data RsBody = RsBody (ResumableSource (ResourceT IO) ByteString)

makePrisms ''RsBody

connectBody :: MonadResource m => RsBody -> Sink ByteString m a -> m a
connectBody (RsBody src) sink = hoist liftResourceT src $$+- sink

instance ToText RsBody where
    toText = const "RsBody <body>"

instance Show RsBody where
    show = Text.unpack . toText

data RqBody = RqBody
    { _bdyHash :: Digest SHA256
    , _bdyBody :: RequestBody
    }

makeLenses ''RqBody

instance ToText RqBody where
    toText (RqBody h _) = "RqBody " <> toText h <> " <body>"

instance Show RqBody where
    show = Text.unpack . toText

instance IsString RqBody where
    fromString = toBody . LBS8.pack

class ToBody a where
    toBody :: a -> RqBody
    toBody = const (RqBody (hash "") (RequestBodyLBS mempty))

instance ToBody RqBody where
    toBody = id

instance ToBody LBS.ByteString where
    toBody lbs = RqBody (hashlazy lbs) (RequestBodyLBS lbs)

instance ToBody ByteString where
    toBody = toBody . LBS.fromStrict

instance ToBody Value where
    toBody = toBody . encode

sourceBody :: Digest SHA256 -> Int64 -> Source IO ByteString -> RqBody
sourceBody h n = RqBody h . RequestBodyStream n . sourcePopper

sourceHandle :: Digest SHA256 -> Int64 -> Handle -> RqBody
sourceHandle h n = sourceBody h n . Conduit.sourceHandle

sourceFile :: Digest SHA256 -> Int64 -> FilePath -> RqBody
sourceFile h n = sourceBody h n . hoist runResourceT . Conduit.sourceFile

sourceFileIO :: MonadIO m => FilePath -> m RqBody
sourceFileIO f = liftIO $ sourceFile
    <$> runResourceT (Conduit.sourceFile f $$ Conduit.sinkHash)
    <*> (fromIntegral <$> withBinaryFile f ReadMode hFileSize)
    <*> pure f

sourcePopper :: Source IO ByteString -> GivesPopper ()
sourcePopper src f = do
    (rsrc0, ()) <- src $$+ return ()
    irsrc <- newIORef rsrc0
    let popper :: IO ByteString
        popper = do
            rsrc <- readIORef irsrc
            (rsrc', mres) <- rsrc $$++ await
            writeIORef irsrc rsrc'
            case mres of
                Nothing -> return mempty
                Just bs
                    | BS.null bs -> popper
                    | otherwise  -> return bs
    f popper