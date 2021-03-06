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
-- Module      : Network.AWS.CloudFront.UpdateDistribution
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates the configuration for a web distribution. 
--
--
-- /Important:/ When you update a distribution, there are more required fields than when you create a distribution. When you update your distribution by using this API action, follow the steps here to get the current configuration and then make your updates, to make sure that you include all of the required fields. To view a summary, see <http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html Required Fields for Create Distribution and Update Distribution> in the /Amazon CloudFront Developer Guide/ .
--
-- The update process includes getting the current distribution configuration, updating the XML document that is returned to make your changes, and then submitting an @UpdateDistribution@ request to make the updates.
--
-- For information about updating a distribution using the CloudFront console instead, see <http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html Creating a Distribution> in the /Amazon CloudFront Developer Guide/ .
--
-- __To update a web distribution using the CloudFront API__ 
--
--     * Submit a 'GetDistributionConfig' request to get the current configuration and an @Etag@ header for the distribution.
--
--     * Update the XML document that was returned in the response to your @GetDistributionConfig@ request to include your changes. 
--
-- /Important:/ When you edit the XML file, be aware of the following:
--
--     * You must strip out the ETag parameter that is returned.
--
--     * Additional fields are required when you update a distribution. There may be fields included in the XML file for features that you haven't configured for your distribution. This is expected and required to successfully update the distribution.
--
--     * You can't change the value of @CallerReference@ . If you try to change this value, CloudFront returns an @IllegalUpdate@ error. 
--
--     * The new configuration replaces the existing configuration; the values that you specify in an @UpdateDistribution@ request are not merged into your existing configuration. When you add, delete, or replace values in an element that allows multiple values (for example, @CNAME@ ), you must specify all of the values that you want to appear in the updated distribution. In addition, you must update the corresponding @Quantity@ element.
--
--
--
--     * Submit an @UpdateDistribution@ request to update the configuration for your distribution:
--
--     * In the request body, include the XML document that you updated in Step 2. The request body must include an XML document with a @DistributionConfig@ element.
--
--     * Set the value of the HTTP @If-Match@ header to the value of the @ETag@ header that CloudFront returned when you submitted the @GetDistributionConfig@ request in Step 1.
--
--
--
--     * Review the response to the @UpdateDistribution@ request to confirm that the configuration was successfully updated.
--
--     * Optional: Submit a 'GetDistribution' request to confirm that your changes have propagated. When propagation is complete, the value of @Status@ is @Deployed@ .
--
--
--
module Network.AWS.CloudFront.UpdateDistribution
    (
    -- * Creating a Request
      updateDistribution
    , UpdateDistribution
    -- * Request Lenses
    , udIfMatch
    , udDistributionConfig
    , udId

    -- * Destructuring the Response
    , updateDistributionResponse
    , UpdateDistributionResponse
    -- * Response Lenses
    , udrsETag
    , udrsDistribution
    , udrsResponseStatus
    ) where

import Network.AWS.CloudFront.Types
import Network.AWS.CloudFront.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | The request to update a distribution.
--
--
--
-- /See:/ 'updateDistribution' smart constructor.
data UpdateDistribution = UpdateDistribution'
  { _udIfMatch :: !(Maybe Text)
  , _udDistributionConfig :: !DistributionConfig
  , _udId :: !Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'UpdateDistribution' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'udIfMatch' - The value of the @ETag@ header that you received when retrieving the distribution's configuration. For example: @E2QWRUHAPOMQZL@ .
--
-- * 'udDistributionConfig' - The distribution's configuration information.
--
-- * 'udId' - The distribution's id.
updateDistribution
    :: DistributionConfig -- ^ 'udDistributionConfig'
    -> Text -- ^ 'udId'
    -> UpdateDistribution
updateDistribution pDistributionConfig_ pId_ =
  UpdateDistribution'
    { _udIfMatch = Nothing
    , _udDistributionConfig = pDistributionConfig_
    , _udId = pId_
    }


-- | The value of the @ETag@ header that you received when retrieving the distribution's configuration. For example: @E2QWRUHAPOMQZL@ .
udIfMatch :: Lens' UpdateDistribution (Maybe Text)
udIfMatch = lens _udIfMatch (\ s a -> s{_udIfMatch = a})

-- | The distribution's configuration information.
udDistributionConfig :: Lens' UpdateDistribution DistributionConfig
udDistributionConfig = lens _udDistributionConfig (\ s a -> s{_udDistributionConfig = a})

-- | The distribution's id.
udId :: Lens' UpdateDistribution Text
udId = lens _udId (\ s a -> s{_udId = a})

instance AWSRequest UpdateDistribution where
        type Rs UpdateDistribution =
             UpdateDistributionResponse
        request = putXML cloudFront
        response
          = receiveXML
              (\ s h x ->
                 UpdateDistributionResponse' <$>
                   (h .#? "ETag") <*> (parseXML x) <*>
                     (pure (fromEnum s)))

instance Hashable UpdateDistribution where

instance NFData UpdateDistribution where

instance ToElement UpdateDistribution where
        toElement
          = mkElement
              "{http://cloudfront.amazonaws.com/doc/2018-11-05/}DistributionConfig"
              .
              _udDistributionConfig

instance ToHeaders UpdateDistribution where
        toHeaders UpdateDistribution'{..}
          = mconcat ["If-Match" =# _udIfMatch]

instance ToPath UpdateDistribution where
        toPath UpdateDistribution'{..}
          = mconcat
              ["/2018-11-05/distribution/", toBS _udId, "/config"]

instance ToQuery UpdateDistribution where
        toQuery = const mempty

-- | The returned result of the corresponding request.
--
--
--
-- /See:/ 'updateDistributionResponse' smart constructor.
data UpdateDistributionResponse = UpdateDistributionResponse'
  { _udrsETag :: !(Maybe Text)
  , _udrsDistribution :: !(Maybe Distribution)
  , _udrsResponseStatus :: !Int
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'UpdateDistributionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'udrsETag' - The current version of the configuration. For example: @E2QWRUHAPOMQZL@ .
--
-- * 'udrsDistribution' - The distribution's information.
--
-- * 'udrsResponseStatus' - -- | The response status code.
updateDistributionResponse
    :: Int -- ^ 'udrsResponseStatus'
    -> UpdateDistributionResponse
updateDistributionResponse pResponseStatus_ =
  UpdateDistributionResponse'
    { _udrsETag = Nothing
    , _udrsDistribution = Nothing
    , _udrsResponseStatus = pResponseStatus_
    }


-- | The current version of the configuration. For example: @E2QWRUHAPOMQZL@ .
udrsETag :: Lens' UpdateDistributionResponse (Maybe Text)
udrsETag = lens _udrsETag (\ s a -> s{_udrsETag = a})

-- | The distribution's information.
udrsDistribution :: Lens' UpdateDistributionResponse (Maybe Distribution)
udrsDistribution = lens _udrsDistribution (\ s a -> s{_udrsDistribution = a})

-- | -- | The response status code.
udrsResponseStatus :: Lens' UpdateDistributionResponse Int
udrsResponseStatus = lens _udrsResponseStatus (\ s a -> s{_udrsResponseStatus = a})

instance NFData UpdateDistributionResponse where
