{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.PutUserPolicy
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Adds (or updates) a policy document associated with the specified user. For
-- information about policies, refer to Overview of Policies in the Using IAM
-- guide. For information about limits on the number of policies you can
-- associate with a user, see Limitations on IAM Entities in the Using IAM
-- guide. Because policy documents can be large, you should use POST rather
-- than GET when calling PutUserPolicy. For information about setting up
-- signatures and authorization through the API, go to Signing AWS API
-- Requests in the AWS General Reference. For general information about using
-- the Query API with IAM, go to Making Query Requests in the Using IAM guide.
-- https://iam.amazonaws.com/ ?Action=PutUserPolicy &UserName=Bob
-- &PolicyName=AllAccessPolicy
-- &PolicyDocument={"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":"*","Resource":"*"}]}
-- &AUTHPARAMS 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.PutUserPolicy
    (
    -- * Request
      PutUserPolicy
    -- ** Request constructor
    , mkPutUserPolicy
    -- ** Request lenses
    , pupUserName
    , pupPolicyName
    , pupPolicyDocument

    -- * Response
    , PutUserPolicyResponse
    -- ** Response constructor
    , mkPutUserPolicyResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.IAM.V2010_05_08.Types
import Network.AWS.Prelude

data PutUserPolicy = PutUserPolicy
    { _pupUserName :: Text
    , _pupPolicyName :: Text
    , _pupPolicyDocument :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'PutUserPolicy' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @UserName ::@ @Text@
--
-- * @PolicyName ::@ @Text@
--
-- * @PolicyDocument ::@ @Text@
--
mkPutUserPolicy :: Text -- ^ 'pupUserName'
                -> Text -- ^ 'pupPolicyName'
                -> Text -- ^ 'pupPolicyDocument'
                -> PutUserPolicy
mkPutUserPolicy p1 p2 p3 = PutUserPolicy
    { _pupUserName = p1
    , _pupPolicyName = p2
    , _pupPolicyDocument = p3
    }

-- | Name of the user to associate the policy with.
pupUserName :: Lens' PutUserPolicy Text
pupUserName = lens _pupUserName (\s a -> s { _pupUserName = a })

-- | Name of the policy document.
pupPolicyName :: Lens' PutUserPolicy Text
pupPolicyName = lens _pupPolicyName (\s a -> s { _pupPolicyName = a })

-- | The policy document.
pupPolicyDocument :: Lens' PutUserPolicy Text
pupPolicyDocument =
    lens _pupPolicyDocument (\s a -> s { _pupPolicyDocument = a })

instance ToQuery PutUserPolicy where
    toQuery = genericQuery def

data PutUserPolicyResponse = PutUserPolicyResponse
    deriving (Eq, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'PutUserPolicyResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
mkPutUserPolicyResponse :: PutUserPolicyResponse
mkPutUserPolicyResponse = PutUserPolicyResponse

instance AWSRequest PutUserPolicy where
    type Sv PutUserPolicy = IAM
    type Rs PutUserPolicy = PutUserPolicyResponse

    request = post "PutUserPolicy"
    response _ = nullaryResponse PutUserPolicyResponse
