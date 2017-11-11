{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Main
-- Copyright   : (c) 2013-2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Main (main) where

import Test.Tasty
import Test.AWS.MarketplaceEntitlement
import Test.AWS.MarketplaceEntitlement.Internal

main :: IO ()
main = defaultMain $ testGroup "MarketplaceEntitlement"
    [ testGroup "tests"    tests
    , testGroup "fixtures" fixtures
    ]