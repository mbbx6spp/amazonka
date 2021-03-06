{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-orphans        #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Test.AWS.Gen.APIGatewayManagement
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Test.AWS.Gen.APIGatewayManagement where

import Data.Proxy
import Test.AWS.Fixture
import Test.AWS.Prelude
import Test.Tasty
import Network.AWS.APIGatewayManagement
import Test.AWS.APIGatewayManagement.Internal

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ requestPostToConnection $
--             postToConnection
--
--           ]

--     , testGroup "response"
--         [ responsePostToConnection $
--             postToConnectionResponse
--
--           ]
--     ]

-- Requests

requestPostToConnection :: PostToConnection -> TestTree
requestPostToConnection = req
    "PostToConnection"
    "fixture/PostToConnection.yaml"

-- Responses

responsePostToConnection :: PostToConnectionResponse -> TestTree
responsePostToConnection = res
    "PostToConnectionResponse"
    "fixture/PostToConnectionResponse.proto"
    apiGatewayManagement
    (Proxy :: Proxy PostToConnection)
