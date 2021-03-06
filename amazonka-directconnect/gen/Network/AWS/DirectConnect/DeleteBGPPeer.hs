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
-- Module      : Network.AWS.DirectConnect.DeleteBGPPeer
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified BGP peer on the specified virtual interface with the specified customer address and ASN.
--
--
-- You cannot delete the last BGP peer from a virtual interface.
--
module Network.AWS.DirectConnect.DeleteBGPPeer
    (
    -- * Creating a Request
      deleteBGPPeer
    , DeleteBGPPeer
    -- * Request Lenses
    , dbpCustomerAddress
    , dbpAsn
    , dbpBgpPeerId
    , dbpVirtualInterfaceId

    -- * Destructuring the Response
    , deleteBGPPeerResponse
    , DeleteBGPPeerResponse
    -- * Response Lenses
    , dbprsVirtualInterface
    , dbprsResponseStatus
    ) where

import Network.AWS.DirectConnect.Types
import Network.AWS.DirectConnect.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteBGPPeer' smart constructor.
data DeleteBGPPeer = DeleteBGPPeer'
  { _dbpCustomerAddress :: !(Maybe Text)
  , _dbpAsn :: !(Maybe Int)
  , _dbpBgpPeerId :: !(Maybe Text)
  , _dbpVirtualInterfaceId :: !(Maybe Text)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'DeleteBGPPeer' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dbpCustomerAddress' - The IP address assigned to the customer interface.
--
-- * 'dbpAsn' - The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.
--
-- * 'dbpBgpPeerId' - The ID of the BGP peer.
--
-- * 'dbpVirtualInterfaceId' - The ID of the virtual interface.
deleteBGPPeer
    :: DeleteBGPPeer
deleteBGPPeer =
  DeleteBGPPeer'
    { _dbpCustomerAddress = Nothing
    , _dbpAsn = Nothing
    , _dbpBgpPeerId = Nothing
    , _dbpVirtualInterfaceId = Nothing
    }


-- | The IP address assigned to the customer interface.
dbpCustomerAddress :: Lens' DeleteBGPPeer (Maybe Text)
dbpCustomerAddress = lens _dbpCustomerAddress (\ s a -> s{_dbpCustomerAddress = a})

-- | The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.
dbpAsn :: Lens' DeleteBGPPeer (Maybe Int)
dbpAsn = lens _dbpAsn (\ s a -> s{_dbpAsn = a})

-- | The ID of the BGP peer.
dbpBgpPeerId :: Lens' DeleteBGPPeer (Maybe Text)
dbpBgpPeerId = lens _dbpBgpPeerId (\ s a -> s{_dbpBgpPeerId = a})

-- | The ID of the virtual interface.
dbpVirtualInterfaceId :: Lens' DeleteBGPPeer (Maybe Text)
dbpVirtualInterfaceId = lens _dbpVirtualInterfaceId (\ s a -> s{_dbpVirtualInterfaceId = a})

instance AWSRequest DeleteBGPPeer where
        type Rs DeleteBGPPeer = DeleteBGPPeerResponse
        request = postJSON directConnect
        response
          = receiveJSON
              (\ s h x ->
                 DeleteBGPPeerResponse' <$>
                   (x .?> "virtualInterface") <*> (pure (fromEnum s)))

instance Hashable DeleteBGPPeer where

instance NFData DeleteBGPPeer where

instance ToHeaders DeleteBGPPeer where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OvertureService.DeleteBGPPeer" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteBGPPeer where
        toJSON DeleteBGPPeer'{..}
          = object
              (catMaybes
                 [("customerAddress" .=) <$> _dbpCustomerAddress,
                  ("asn" .=) <$> _dbpAsn,
                  ("bgpPeerId" .=) <$> _dbpBgpPeerId,
                  ("virtualInterfaceId" .=) <$>
                    _dbpVirtualInterfaceId])

instance ToPath DeleteBGPPeer where
        toPath = const "/"

instance ToQuery DeleteBGPPeer where
        toQuery = const mempty

-- | /See:/ 'deleteBGPPeerResponse' smart constructor.
data DeleteBGPPeerResponse = DeleteBGPPeerResponse'
  { _dbprsVirtualInterface :: !(Maybe VirtualInterface)
  , _dbprsResponseStatus :: !Int
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'DeleteBGPPeerResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dbprsVirtualInterface' - The virtual interface.
--
-- * 'dbprsResponseStatus' - -- | The response status code.
deleteBGPPeerResponse
    :: Int -- ^ 'dbprsResponseStatus'
    -> DeleteBGPPeerResponse
deleteBGPPeerResponse pResponseStatus_ =
  DeleteBGPPeerResponse'
    {_dbprsVirtualInterface = Nothing, _dbprsResponseStatus = pResponseStatus_}


-- | The virtual interface.
dbprsVirtualInterface :: Lens' DeleteBGPPeerResponse (Maybe VirtualInterface)
dbprsVirtualInterface = lens _dbprsVirtualInterface (\ s a -> s{_dbprsVirtualInterface = a})

-- | -- | The response status code.
dbprsResponseStatus :: Lens' DeleteBGPPeerResponse Int
dbprsResponseStatus = lens _dbprsResponseStatus (\ s a -> s{_dbprsResponseStatus = a})

instance NFData DeleteBGPPeerResponse where
