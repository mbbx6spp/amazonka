{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.V2014_05_31.ListStreamingDistributions
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | List streaming distributions.
module Network.AWS.CloudFront.V2014_05_31.ListStreamingDistributions
    (
    -- * Request
      ListStreamingDistributions
    -- ** Request constructor
    , mkListStreamingDistributions
    -- ** Request lenses
    , lsdMarker
    , lsdMaxItems

    -- * Response
    , ListStreamingDistributionsResponse
    -- ** Response constructor
    , mkListStreamingDistributionsResponse
    -- ** Response lenses
    , lsdrStreamingDistributionList
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.CloudFront.V2014_05_31.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

-- | The request to list your streaming distributions.
data ListStreamingDistributions = ListStreamingDistributions
    { _lsdMarker :: Maybe Text
    , _lsdMaxItems :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListStreamingDistributions' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Marker ::@ @Maybe Text@
--
-- * @MaxItems ::@ @Maybe Text@
--
mkListStreamingDistributions :: ListStreamingDistributions
mkListStreamingDistributions = ListStreamingDistributions
    { _lsdMarker = Nothing
    , _lsdMaxItems = Nothing
    }

-- | Use this when paginating results to indicate where to begin in your list of
-- streaming distributions. The results include distributions in the list that
-- occur after the marker. To get the next page of results, set the Marker to
-- the value of the NextMarker from the current page's response (which is also
-- the ID of the last distribution on that page).
lsdMarker :: Lens' ListStreamingDistributions (Maybe Text)
lsdMarker = lens _lsdMarker (\s a -> s { _lsdMarker = a })

-- | The maximum number of streaming distributions you want in the response
-- body.
lsdMaxItems :: Lens' ListStreamingDistributions (Maybe Text)
lsdMaxItems = lens _lsdMaxItems (\s a -> s { _lsdMaxItems = a })

instance ToPath ListStreamingDistributions

instance ToQuery ListStreamingDistributions

instance ToHeaders ListStreamingDistributions

instance ToXML ListStreamingDistributions where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ListStreamingDistributionsRequest"

-- | The returned result of the corresponding request.
newtype ListStreamingDistributionsResponse = ListStreamingDistributionsResponse
    { _lsdrStreamingDistributionList :: StreamingDistributionList
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListStreamingDistributionsResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @StreamingDistributionList ::@ @StreamingDistributionList@
--
mkListStreamingDistributionsResponse :: StreamingDistributionList -- ^ 'lsdrStreamingDistributionList'
                                     -> ListStreamingDistributionsResponse
mkListStreamingDistributionsResponse p1 = ListStreamingDistributionsResponse
    { _lsdrStreamingDistributionList = p1
    }

-- | The StreamingDistributionList type.
lsdrStreamingDistributionList :: Lens' ListStreamingDistributionsResponse StreamingDistributionList
lsdrStreamingDistributionList =
    lens _lsdrStreamingDistributionList
         (\s a -> s { _lsdrStreamingDistributionList = a })

instance FromXML ListStreamingDistributionsResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ListStreamingDistributions where
    type Sv ListStreamingDistributions = CloudFront
    type Rs ListStreamingDistributions = ListStreamingDistributionsResponse

    request = get
    response _ = xmlResponse

instance AWSPager ListStreamingDistributions where
    next rq rs
        | not (rs ^. lsdrStreamingDistributionList . sdlIsTruncated) = Nothing
        | otherwise = Just $
            rq & lsdMarker .~ rs ^. lsdrStreamingDistributionList . sdlNextMarker
