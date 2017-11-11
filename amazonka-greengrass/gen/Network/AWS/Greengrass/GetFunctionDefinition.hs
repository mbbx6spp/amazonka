{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Greengrass.GetFunctionDefinition
-- Copyright   : (c) 2013-2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves information about a Lambda function definition, such as its creation time and latest version.
module Network.AWS.Greengrass.GetFunctionDefinition
    (
    -- * Creating a Request
      getFunctionDefinition
    , GetFunctionDefinition
    -- * Request Lenses
    , gfdFunctionDefinitionId

    -- * Destructuring the Response
    , getFunctionDefinitionResponse
    , GetFunctionDefinitionResponse
    -- * Response Lenses
    , gfdrsLatestVersionARN
    , gfdrsARN
    , gfdrsName
    , gfdrsCreationTimestamp
    , gfdrsId
    , gfdrsLatestVersion
    , gfdrsLastUpdatedTimestamp
    , gfdrsResponseStatus
    ) where

import Network.AWS.Greengrass.Types
import Network.AWS.Greengrass.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getFunctionDefinition' smart constructor.
newtype GetFunctionDefinition = GetFunctionDefinition'
  { _gfdFunctionDefinitionId :: Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'GetFunctionDefinition' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gfdFunctionDefinitionId' - the unique Id of the lambda definition
getFunctionDefinition
    :: Text -- ^ 'gfdFunctionDefinitionId'
    -> GetFunctionDefinition
getFunctionDefinition pFunctionDefinitionId_ =
  GetFunctionDefinition' {_gfdFunctionDefinitionId = pFunctionDefinitionId_}


-- | the unique Id of the lambda definition
gfdFunctionDefinitionId :: Lens' GetFunctionDefinition Text
gfdFunctionDefinitionId = lens _gfdFunctionDefinitionId (\ s a -> s{_gfdFunctionDefinitionId = a});

instance AWSRequest GetFunctionDefinition where
        type Rs GetFunctionDefinition =
             GetFunctionDefinitionResponse
        request = get greengrass
        response
          = receiveJSON
              (\ s h x ->
                 GetFunctionDefinitionResponse' <$>
                   (x .?> "LatestVersionArn") <*> (x .?> "Arn") <*>
                     (x .?> "Name")
                     <*> (x .?> "CreationTimestamp")
                     <*> (x .?> "Id")
                     <*> (x .?> "LatestVersion")
                     <*> (x .?> "LastUpdatedTimestamp")
                     <*> (pure (fromEnum s)))

instance Hashable GetFunctionDefinition where

instance NFData GetFunctionDefinition where

instance ToHeaders GetFunctionDefinition where
        toHeaders
          = const
              (mconcat
                 ["Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToPath GetFunctionDefinition where
        toPath GetFunctionDefinition'{..}
          = mconcat
              ["/greengrass/definition/functions/",
               toBS _gfdFunctionDefinitionId]

instance ToQuery GetFunctionDefinition where
        toQuery = const mempty

-- | /See:/ 'getFunctionDefinitionResponse' smart constructor.
data GetFunctionDefinitionResponse = GetFunctionDefinitionResponse'
  { _gfdrsLatestVersionARN     :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsARN                  :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsName                 :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsCreationTimestamp    :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsId                   :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsLatestVersion        :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsLastUpdatedTimestamp :: {-# NOUNPACK #-}!(Maybe Text)
  , _gfdrsResponseStatus       :: {-# NOUNPACK #-}!Int
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'GetFunctionDefinitionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gfdrsLatestVersionARN' - Latest version arn of the definition.
--
-- * 'gfdrsARN' - Arn of the definition.
--
-- * 'gfdrsName' - Name of the definition.
--
-- * 'gfdrsCreationTimestamp' - Timestamp of when the definition was created.
--
-- * 'gfdrsId' - Id of the definition.
--
-- * 'gfdrsLatestVersion' - Last version of the definition.
--
-- * 'gfdrsLastUpdatedTimestamp' - Last updated timestamp of the definition.
--
-- * 'gfdrsResponseStatus' - -- | The response status code.
getFunctionDefinitionResponse
    :: Int -- ^ 'gfdrsResponseStatus'
    -> GetFunctionDefinitionResponse
getFunctionDefinitionResponse pResponseStatus_ =
  GetFunctionDefinitionResponse'
  { _gfdrsLatestVersionARN = Nothing
  , _gfdrsARN = Nothing
  , _gfdrsName = Nothing
  , _gfdrsCreationTimestamp = Nothing
  , _gfdrsId = Nothing
  , _gfdrsLatestVersion = Nothing
  , _gfdrsLastUpdatedTimestamp = Nothing
  , _gfdrsResponseStatus = pResponseStatus_
  }


-- | Latest version arn of the definition.
gfdrsLatestVersionARN :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsLatestVersionARN = lens _gfdrsLatestVersionARN (\ s a -> s{_gfdrsLatestVersionARN = a});

-- | Arn of the definition.
gfdrsARN :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsARN = lens _gfdrsARN (\ s a -> s{_gfdrsARN = a});

-- | Name of the definition.
gfdrsName :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsName = lens _gfdrsName (\ s a -> s{_gfdrsName = a});

-- | Timestamp of when the definition was created.
gfdrsCreationTimestamp :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsCreationTimestamp = lens _gfdrsCreationTimestamp (\ s a -> s{_gfdrsCreationTimestamp = a});

-- | Id of the definition.
gfdrsId :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsId = lens _gfdrsId (\ s a -> s{_gfdrsId = a});

-- | Last version of the definition.
gfdrsLatestVersion :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsLatestVersion = lens _gfdrsLatestVersion (\ s a -> s{_gfdrsLatestVersion = a});

-- | Last updated timestamp of the definition.
gfdrsLastUpdatedTimestamp :: Lens' GetFunctionDefinitionResponse (Maybe Text)
gfdrsLastUpdatedTimestamp = lens _gfdrsLastUpdatedTimestamp (\ s a -> s{_gfdrsLastUpdatedTimestamp = a});

-- | -- | The response status code.
gfdrsResponseStatus :: Lens' GetFunctionDefinitionResponse Int
gfdrsResponseStatus = lens _gfdrsResponseStatus (\ s a -> s{_gfdrsResponseStatus = a});

instance NFData GetFunctionDefinitionResponse where