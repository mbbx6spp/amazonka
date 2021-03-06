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
-- Module      : Network.AWS.DynamoDB.BatchWriteItem
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- The @BatchWriteItem@ operation puts or deletes multiple items in one or more tables. A single call to @BatchWriteItem@ can write up to 16 MB of data, which can comprise as many as 25 put or delete requests. Individual items to be written can be as large as 400 KB.
--
--
-- The individual @PutItem@ and @DeleteItem@ operations specified in @BatchWriteItem@ are atomic; however @BatchWriteItem@ as a whole is not. If any requested operations fail because the table's provisioned throughput is exceeded or an internal processing failure occurs, the failed operations are returned in the @UnprocessedItems@ response parameter. You can investigate and optionally resend the requests. Typically, you would call @BatchWriteItem@ in a loop. Each iteration would check for unprocessed items and submit a new @BatchWriteItem@ request with those unprocessed items until all items have been processed.
--
-- Note that if /none/ of the items can be processed due to insufficient provisioned throughput on all of the tables in the request, then @BatchWriteItem@ will return a @ProvisionedThroughputExceededException@ .
--
-- /Important:/ If DynamoDB returns any unprocessed items, you should retry the batch operation on those items. However, /we strongly recommend that you use an exponential backoff algorithm/ . If you retry the batch operation immediately, the underlying read or write requests can still fail due to throttling on the individual tables. If you delay the batch operation using exponential backoff, the individual requests in the batch are much more likely to succeed.
--
-- For more information, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#BatchOperations Batch Operations and Error Handling> in the /Amazon DynamoDB Developer Guide/ .
--
-- With @BatchWriteItem@ , you can efficiently write or delete large amounts of data, such as from Amazon Elastic MapReduce (EMR), or copy data from another database into DynamoDB. In order to improve performance with these large-scale operations, @BatchWriteItem@ does not behave in the same way as individual @PutItem@ and @DeleteItem@ calls would. For example, you cannot specify conditions on individual put and delete requests, and @BatchWriteItem@ does not return deleted items in the response.
--
-- If you use a programming language that supports concurrency, you can use threads to write items in parallel. Your application must include the necessary logic to manage the threads. With languages that don't support threading, you must update or delete the specified items one at a time. In both situations, @BatchWriteItem@ performs the specified put and delete operations in parallel, giving you the power of the thread pool approach without having to introduce complexity into your application.
--
-- Parallel processing reduces latency, but each specified put and delete request consumes the same number of write capacity units whether it is processed in parallel or not. Delete operations on nonexistent items consume one write capacity unit.
--
-- If one or more of the following is true, DynamoDB rejects the entire batch write operation:
--
--     * One or more tables specified in the @BatchWriteItem@ request does not exist.
--
--     * Primary key attributes specified on an item in the request do not match those in the corresponding table's primary key schema.
--
--     * You try to perform multiple operations on the same item in the same @BatchWriteItem@ request. For example, you cannot put and delete the same item in the same @BatchWriteItem@ request. 
--
--     * Your request contains at least two items with identical hash and range keys (which essentially is two put operations). 
--
--     * There are more than 25 requests in the batch.
--
--     * Any individual item in a batch exceeds 400 KB.
--
--     * The total request size exceeds 16 MB.
--
--
--
module Network.AWS.DynamoDB.BatchWriteItem
    (
    -- * Creating a Request
      batchWriteItem
    , BatchWriteItem
    -- * Request Lenses
    , bwiReturnConsumedCapacity
    , bwiReturnItemCollectionMetrics
    , bwiRequestItems

    -- * Destructuring the Response
    , batchWriteItemResponse
    , BatchWriteItemResponse
    -- * Response Lenses
    , bwirsItemCollectionMetrics
    , bwirsConsumedCapacity
    , bwirsUnprocessedItems
    , bwirsResponseStatus
    ) where

import Network.AWS.DynamoDB.Types
import Network.AWS.DynamoDB.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Represents the input of a @BatchWriteItem@ operation.
--
--
--
-- /See:/ 'batchWriteItem' smart constructor.
data BatchWriteItem = BatchWriteItem'
  { _bwiReturnConsumedCapacity :: !(Maybe ReturnConsumedCapacity)
  , _bwiReturnItemCollectionMetrics :: !(Maybe ReturnItemCollectionMetrics)
  , _bwiRequestItems :: !(Map Text (List1 WriteRequest))
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'BatchWriteItem' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'bwiReturnConsumedCapacity' - Undocumented member.
--
-- * 'bwiReturnItemCollectionMetrics' - Determines whether item collection metrics are returned. If set to @SIZE@ , the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to @NONE@ (the default), no statistics are returned.
--
-- * 'bwiRequestItems' - A map of one or more table names and, for each table, a list of operations to be performed (@DeleteRequest@ or @PutRequest@ ). Each element in the map consists of the following:     * @DeleteRequest@ - Perform a @DeleteItem@ operation on the specified item. The item to be deleted is identified by a @Key@ subelement:     * @Key@ - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value. For each primary key, you must provide /all/ of the key attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for /both/ the partition key and the sort key.     * @PutRequest@ - Perform a @PutItem@ operation on the specified item. The item to be put is identified by an @Item@ subelement:     * @Item@ - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a @ValidationException@ exception. If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.
batchWriteItem
    :: BatchWriteItem
batchWriteItem =
  BatchWriteItem'
    { _bwiReturnConsumedCapacity = Nothing
    , _bwiReturnItemCollectionMetrics = Nothing
    , _bwiRequestItems = mempty
    }


-- | Undocumented member.
bwiReturnConsumedCapacity :: Lens' BatchWriteItem (Maybe ReturnConsumedCapacity)
bwiReturnConsumedCapacity = lens _bwiReturnConsumedCapacity (\ s a -> s{_bwiReturnConsumedCapacity = a})

-- | Determines whether item collection metrics are returned. If set to @SIZE@ , the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to @NONE@ (the default), no statistics are returned.
bwiReturnItemCollectionMetrics :: Lens' BatchWriteItem (Maybe ReturnItemCollectionMetrics)
bwiReturnItemCollectionMetrics = lens _bwiReturnItemCollectionMetrics (\ s a -> s{_bwiReturnItemCollectionMetrics = a})

-- | A map of one or more table names and, for each table, a list of operations to be performed (@DeleteRequest@ or @PutRequest@ ). Each element in the map consists of the following:     * @DeleteRequest@ - Perform a @DeleteItem@ operation on the specified item. The item to be deleted is identified by a @Key@ subelement:     * @Key@ - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value. For each primary key, you must provide /all/ of the key attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for /both/ the partition key and the sort key.     * @PutRequest@ - Perform a @PutItem@ operation on the specified item. The item to be put is identified by an @Item@ subelement:     * @Item@ - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a @ValidationException@ exception. If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.
bwiRequestItems :: Lens' BatchWriteItem (HashMap Text (NonEmpty WriteRequest))
bwiRequestItems = lens _bwiRequestItems (\ s a -> s{_bwiRequestItems = a}) . _Map

instance AWSRequest BatchWriteItem where
        type Rs BatchWriteItem = BatchWriteItemResponse
        request = postJSON dynamoDB
        response
          = receiveJSON
              (\ s h x ->
                 BatchWriteItemResponse' <$>
                   (x .?> "ItemCollectionMetrics" .!@ mempty) <*>
                     (x .?> "ConsumedCapacity" .!@ mempty)
                     <*> (x .?> "UnprocessedItems" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance Hashable BatchWriteItem where

instance NFData BatchWriteItem where

instance ToHeaders BatchWriteItem where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DynamoDB_20120810.BatchWriteItem" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.0" :: ByteString)])

instance ToJSON BatchWriteItem where
        toJSON BatchWriteItem'{..}
          = object
              (catMaybes
                 [("ReturnConsumedCapacity" .=) <$>
                    _bwiReturnConsumedCapacity,
                  ("ReturnItemCollectionMetrics" .=) <$>
                    _bwiReturnItemCollectionMetrics,
                  Just ("RequestItems" .= _bwiRequestItems)])

instance ToPath BatchWriteItem where
        toPath = const "/"

instance ToQuery BatchWriteItem where
        toQuery = const mempty

-- | Represents the output of a @BatchWriteItem@ operation.
--
--
--
-- /See:/ 'batchWriteItemResponse' smart constructor.
data BatchWriteItemResponse = BatchWriteItemResponse'
  { _bwirsItemCollectionMetrics :: !(Maybe (Map Text [ItemCollectionMetrics]))
  , _bwirsConsumedCapacity :: !(Maybe [ConsumedCapacity])
  , _bwirsUnprocessedItems :: !(Maybe (Map Text (List1 WriteRequest)))
  , _bwirsResponseStatus :: !Int
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'BatchWriteItemResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'bwirsItemCollectionMetrics' - A list of tables that were processed by @BatchWriteItem@ and, for each table, information about any item collections that were affected by individual @DeleteItem@ or @PutItem@ operations. Each entry consists of the following subelements:     * @ItemCollectionKey@ - The partition key value of the item collection. This is the same as the partition key value of the item.     * @SizeEstimateRangeGB@ - An estimate of item collection size, expressed in GB. This is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on the table. Use this estimate to measure whether a local secondary index is approaching its size limit. The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.
--
-- * 'bwirsConsumedCapacity' - The capacity units consumed by the entire @BatchWriteItem@ operation. Each element consists of:     * @TableName@ - The table that consumed the provisioned throughput.     * @CapacityUnits@ - The total number of capacity units consumed.
--
-- * 'bwirsUnprocessedItems' - A map of tables and requests against those tables that were not processed. The @UnprocessedItems@ value is in the same form as @RequestItems@ , so you can provide this value directly to a subsequent @BatchGetItem@ operation. For more information, see @RequestItems@ in the Request Parameters section. Each @UnprocessedItems@ entry consists of a table name and, for that table, a list of operations to perform (@DeleteRequest@ or @PutRequest@ ).     * @DeleteRequest@ - Perform a @DeleteItem@ operation on the specified item. The item to be deleted is identified by a @Key@ subelement:     * @Key@ - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value.     * @PutRequest@ - Perform a @PutItem@ operation on the specified item. The item to be put is identified by an @Item@ subelement:     * @Item@ - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a @ValidationException@ exception. If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition. If there are no unprocessed items remaining, the response contains an empty @UnprocessedItems@ map.
--
-- * 'bwirsResponseStatus' - -- | The response status code.
batchWriteItemResponse
    :: Int -- ^ 'bwirsResponseStatus'
    -> BatchWriteItemResponse
batchWriteItemResponse pResponseStatus_ =
  BatchWriteItemResponse'
    { _bwirsItemCollectionMetrics = Nothing
    , _bwirsConsumedCapacity = Nothing
    , _bwirsUnprocessedItems = Nothing
    , _bwirsResponseStatus = pResponseStatus_
    }


-- | A list of tables that were processed by @BatchWriteItem@ and, for each table, information about any item collections that were affected by individual @DeleteItem@ or @PutItem@ operations. Each entry consists of the following subelements:     * @ItemCollectionKey@ - The partition key value of the item collection. This is the same as the partition key value of the item.     * @SizeEstimateRangeGB@ - An estimate of item collection size, expressed in GB. This is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on the table. Use this estimate to measure whether a local secondary index is approaching its size limit. The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.
bwirsItemCollectionMetrics :: Lens' BatchWriteItemResponse (HashMap Text [ItemCollectionMetrics])
bwirsItemCollectionMetrics = lens _bwirsItemCollectionMetrics (\ s a -> s{_bwirsItemCollectionMetrics = a}) . _Default . _Map

-- | The capacity units consumed by the entire @BatchWriteItem@ operation. Each element consists of:     * @TableName@ - The table that consumed the provisioned throughput.     * @CapacityUnits@ - The total number of capacity units consumed.
bwirsConsumedCapacity :: Lens' BatchWriteItemResponse [ConsumedCapacity]
bwirsConsumedCapacity = lens _bwirsConsumedCapacity (\ s a -> s{_bwirsConsumedCapacity = a}) . _Default . _Coerce

-- | A map of tables and requests against those tables that were not processed. The @UnprocessedItems@ value is in the same form as @RequestItems@ , so you can provide this value directly to a subsequent @BatchGetItem@ operation. For more information, see @RequestItems@ in the Request Parameters section. Each @UnprocessedItems@ entry consists of a table name and, for that table, a list of operations to perform (@DeleteRequest@ or @PutRequest@ ).     * @DeleteRequest@ - Perform a @DeleteItem@ operation on the specified item. The item to be deleted is identified by a @Key@ subelement:     * @Key@ - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value.     * @PutRequest@ - Perform a @PutItem@ operation on the specified item. The item to be put is identified by an @Item@ subelement:     * @Item@ - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a @ValidationException@ exception. If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition. If there are no unprocessed items remaining, the response contains an empty @UnprocessedItems@ map.
bwirsUnprocessedItems :: Lens' BatchWriteItemResponse (HashMap Text (NonEmpty WriteRequest))
bwirsUnprocessedItems = lens _bwirsUnprocessedItems (\ s a -> s{_bwirsUnprocessedItems = a}) . _Default . _Map

-- | -- | The response status code.
bwirsResponseStatus :: Lens' BatchWriteItemResponse Int
bwirsResponseStatus = lens _bwirsResponseStatus (\ s a -> s{_bwirsResponseStatus = a})

instance NFData BatchWriteItemResponse where
