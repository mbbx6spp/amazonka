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
-- Module      : Network.AWS.DMS.ModifyEndpoint
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Modifies the specified endpoint.
--
--
module Network.AWS.DMS.ModifyEndpoint
    (
    -- * Creating a Request
      modifyEndpoint
    , ModifyEndpoint
    -- * Request Lenses
    , meDmsTransferSettings
    , meServerName
    , meCertificateARN
    , meServiceAccessRoleARN
    , meExtraConnectionAttributes
    , meEndpointType
    , meElasticsearchSettings
    , meUsername
    , meExternalTableDefinition
    , meEngineName
    , meMongoDBSettings
    , meSSLMode
    , mePassword
    , meDatabaseName
    , meS3Settings
    , meKinesisSettings
    , meEndpointIdentifier
    , meDynamoDBSettings
    , mePort
    , meEndpointARN

    -- * Destructuring the Response
    , modifyEndpointResponse
    , ModifyEndpointResponse
    -- * Response Lenses
    , mersEndpoint
    , mersResponseStatus
    ) where

import Network.AWS.DMS.Types
import Network.AWS.DMS.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | 
--
--
--
-- /See:/ 'modifyEndpoint' smart constructor.
data ModifyEndpoint = ModifyEndpoint'
  { _meDmsTransferSettings :: !(Maybe DmsTransferSettings)
  , _meServerName :: !(Maybe Text)
  , _meCertificateARN :: !(Maybe Text)
  , _meServiceAccessRoleARN :: !(Maybe Text)
  , _meExtraConnectionAttributes :: !(Maybe Text)
  , _meEndpointType :: !(Maybe ReplicationEndpointTypeValue)
  , _meElasticsearchSettings :: !(Maybe ElasticsearchSettings)
  , _meUsername :: !(Maybe Text)
  , _meExternalTableDefinition :: !(Maybe Text)
  , _meEngineName :: !(Maybe Text)
  , _meMongoDBSettings :: !(Maybe MongoDBSettings)
  , _meSSLMode :: !(Maybe DmsSSLModeValue)
  , _mePassword :: !(Maybe (Sensitive Text))
  , _meDatabaseName :: !(Maybe Text)
  , _meS3Settings :: !(Maybe S3Settings)
  , _meKinesisSettings :: !(Maybe KinesisSettings)
  , _meEndpointIdentifier :: !(Maybe Text)
  , _meDynamoDBSettings :: !(Maybe DynamoDBSettings)
  , _mePort :: !(Maybe Int)
  , _meEndpointARN :: !Text
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'ModifyEndpoint' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'meDmsTransferSettings' - The settings in JSON format for the DMS transfer type of source endpoint.  Attributes include the following:     * serviceAccessRoleArn - The IAM role that has permission to access the Amazon S3 bucket.     * BucketName - The name of the S3 bucket to use.     * compressionType - An optional parameter to use GZIP to compress the target files. Set to NONE (the default) or do not use to leave the files uncompressed. Shorthand syntax: ServiceAccessRoleArn=string ,BucketName=string,CompressionType=string JSON syntax: { "ServiceAccessRoleArn": "string", "BucketName": "string", "CompressionType": "none"|"gzip" } 
--
-- * 'meServerName' - The name of the server where the endpoint database resides.
--
-- * 'meCertificateARN' - The Amazon Resource Name (ARN) of the certificate used for SSL connection.
--
-- * 'meServiceAccessRoleARN' - The Amazon Resource Name (ARN) for the service access role you want to use to modify the endpoint. 
--
-- * 'meExtraConnectionAttributes' - Additional attributes associated with the connection. To reset this parameter, pass the empty string ("") as an argument.
--
-- * 'meEndpointType' - The type of endpoint.
--
-- * 'meElasticsearchSettings' - Settings in JSON format for the target Elasticsearch endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS> in the /AWS Database Migration User Guide./ 
--
-- * 'meUsername' - The user name to be used to login to the endpoint database.
--
-- * 'meExternalTableDefinition' - The external table definition.
--
-- * 'meEngineName' - The type of engine for the endpoint. Valid values, depending on the EndPointType, include mysql, oracle, postgres, mariadb, aurora, aurora-postgresql, redshift, s3, db2, azuredb, sybase, sybase, dynamodb, mongodb, and sqlserver.
--
-- * 'meMongoDBSettings' - Settings in JSON format for the source MongoDB endpoint. For more information about the available settings, see the configuration properties section in <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html Using MongoDB as a Target for AWS Database Migration Service> in the /AWS Database Migration Service User Guide./ 
--
-- * 'meSSLMode' - The SSL mode to be used. SSL mode can be one of four values: none, require, verify-ca, verify-full.  The default value is none.
--
-- * 'mePassword' - The password to be used to login to the endpoint database.
--
-- * 'meDatabaseName' - The name of the endpoint database.
--
-- * 'meS3Settings' - Settings in JSON format for the target Amazon S3 endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS> in the /AWS Database Migration Service User Guide./ 
--
-- * 'meKinesisSettings' - Settings in JSON format for the target Amazon Kinesis Data Streams endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping  Using Object Mapping to Migrate Data to a Kinesis Data Stream> in the /AWS Database Migration User Guide./ 
--
-- * 'meEndpointIdentifier' - The database endpoint identifier. Identifiers must begin with a letter; must contain only ASCII letters, digits, and hyphens; and must not end with a hyphen or contain two consecutive hyphens.
--
-- * 'meDynamoDBSettings' - Settings in JSON format for the target Amazon DynamoDB endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html Using Object Mapping to Migrate Data to DynamoDB> in the /AWS Database Migration Service User Guide./ 
--
-- * 'mePort' - The port used by the endpoint database.
--
-- * 'meEndpointARN' - The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
modifyEndpoint
    :: Text -- ^ 'meEndpointARN'
    -> ModifyEndpoint
modifyEndpoint pEndpointARN_ =
  ModifyEndpoint'
    { _meDmsTransferSettings = Nothing
    , _meServerName = Nothing
    , _meCertificateARN = Nothing
    , _meServiceAccessRoleARN = Nothing
    , _meExtraConnectionAttributes = Nothing
    , _meEndpointType = Nothing
    , _meElasticsearchSettings = Nothing
    , _meUsername = Nothing
    , _meExternalTableDefinition = Nothing
    , _meEngineName = Nothing
    , _meMongoDBSettings = Nothing
    , _meSSLMode = Nothing
    , _mePassword = Nothing
    , _meDatabaseName = Nothing
    , _meS3Settings = Nothing
    , _meKinesisSettings = Nothing
    , _meEndpointIdentifier = Nothing
    , _meDynamoDBSettings = Nothing
    , _mePort = Nothing
    , _meEndpointARN = pEndpointARN_
    }


-- | The settings in JSON format for the DMS transfer type of source endpoint.  Attributes include the following:     * serviceAccessRoleArn - The IAM role that has permission to access the Amazon S3 bucket.     * BucketName - The name of the S3 bucket to use.     * compressionType - An optional parameter to use GZIP to compress the target files. Set to NONE (the default) or do not use to leave the files uncompressed. Shorthand syntax: ServiceAccessRoleArn=string ,BucketName=string,CompressionType=string JSON syntax: { "ServiceAccessRoleArn": "string", "BucketName": "string", "CompressionType": "none"|"gzip" } 
meDmsTransferSettings :: Lens' ModifyEndpoint (Maybe DmsTransferSettings)
meDmsTransferSettings = lens _meDmsTransferSettings (\ s a -> s{_meDmsTransferSettings = a})

-- | The name of the server where the endpoint database resides.
meServerName :: Lens' ModifyEndpoint (Maybe Text)
meServerName = lens _meServerName (\ s a -> s{_meServerName = a})

-- | The Amazon Resource Name (ARN) of the certificate used for SSL connection.
meCertificateARN :: Lens' ModifyEndpoint (Maybe Text)
meCertificateARN = lens _meCertificateARN (\ s a -> s{_meCertificateARN = a})

-- | The Amazon Resource Name (ARN) for the service access role you want to use to modify the endpoint. 
meServiceAccessRoleARN :: Lens' ModifyEndpoint (Maybe Text)
meServiceAccessRoleARN = lens _meServiceAccessRoleARN (\ s a -> s{_meServiceAccessRoleARN = a})

-- | Additional attributes associated with the connection. To reset this parameter, pass the empty string ("") as an argument.
meExtraConnectionAttributes :: Lens' ModifyEndpoint (Maybe Text)
meExtraConnectionAttributes = lens _meExtraConnectionAttributes (\ s a -> s{_meExtraConnectionAttributes = a})

-- | The type of endpoint.
meEndpointType :: Lens' ModifyEndpoint (Maybe ReplicationEndpointTypeValue)
meEndpointType = lens _meEndpointType (\ s a -> s{_meEndpointType = a})

-- | Settings in JSON format for the target Elasticsearch endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS> in the /AWS Database Migration User Guide./ 
meElasticsearchSettings :: Lens' ModifyEndpoint (Maybe ElasticsearchSettings)
meElasticsearchSettings = lens _meElasticsearchSettings (\ s a -> s{_meElasticsearchSettings = a})

-- | The user name to be used to login to the endpoint database.
meUsername :: Lens' ModifyEndpoint (Maybe Text)
meUsername = lens _meUsername (\ s a -> s{_meUsername = a})

-- | The external table definition.
meExternalTableDefinition :: Lens' ModifyEndpoint (Maybe Text)
meExternalTableDefinition = lens _meExternalTableDefinition (\ s a -> s{_meExternalTableDefinition = a})

-- | The type of engine for the endpoint. Valid values, depending on the EndPointType, include mysql, oracle, postgres, mariadb, aurora, aurora-postgresql, redshift, s3, db2, azuredb, sybase, sybase, dynamodb, mongodb, and sqlserver.
meEngineName :: Lens' ModifyEndpoint (Maybe Text)
meEngineName = lens _meEngineName (\ s a -> s{_meEngineName = a})

-- | Settings in JSON format for the source MongoDB endpoint. For more information about the available settings, see the configuration properties section in <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html Using MongoDB as a Target for AWS Database Migration Service> in the /AWS Database Migration Service User Guide./ 
meMongoDBSettings :: Lens' ModifyEndpoint (Maybe MongoDBSettings)
meMongoDBSettings = lens _meMongoDBSettings (\ s a -> s{_meMongoDBSettings = a})

-- | The SSL mode to be used. SSL mode can be one of four values: none, require, verify-ca, verify-full.  The default value is none.
meSSLMode :: Lens' ModifyEndpoint (Maybe DmsSSLModeValue)
meSSLMode = lens _meSSLMode (\ s a -> s{_meSSLMode = a})

-- | The password to be used to login to the endpoint database.
mePassword :: Lens' ModifyEndpoint (Maybe Text)
mePassword = lens _mePassword (\ s a -> s{_mePassword = a}) . mapping _Sensitive

-- | The name of the endpoint database.
meDatabaseName :: Lens' ModifyEndpoint (Maybe Text)
meDatabaseName = lens _meDatabaseName (\ s a -> s{_meDatabaseName = a})

-- | Settings in JSON format for the target Amazon S3 endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS> in the /AWS Database Migration Service User Guide./ 
meS3Settings :: Lens' ModifyEndpoint (Maybe S3Settings)
meS3Settings = lens _meS3Settings (\ s a -> s{_meS3Settings = a})

-- | Settings in JSON format for the target Amazon Kinesis Data Streams endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping  Using Object Mapping to Migrate Data to a Kinesis Data Stream> in the /AWS Database Migration User Guide./ 
meKinesisSettings :: Lens' ModifyEndpoint (Maybe KinesisSettings)
meKinesisSettings = lens _meKinesisSettings (\ s a -> s{_meKinesisSettings = a})

-- | The database endpoint identifier. Identifiers must begin with a letter; must contain only ASCII letters, digits, and hyphens; and must not end with a hyphen or contain two consecutive hyphens.
meEndpointIdentifier :: Lens' ModifyEndpoint (Maybe Text)
meEndpointIdentifier = lens _meEndpointIdentifier (\ s a -> s{_meEndpointIdentifier = a})

-- | Settings in JSON format for the target Amazon DynamoDB endpoint. For more information about the available settings, see <http://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html Using Object Mapping to Migrate Data to DynamoDB> in the /AWS Database Migration Service User Guide./ 
meDynamoDBSettings :: Lens' ModifyEndpoint (Maybe DynamoDBSettings)
meDynamoDBSettings = lens _meDynamoDBSettings (\ s a -> s{_meDynamoDBSettings = a})

-- | The port used by the endpoint database.
mePort :: Lens' ModifyEndpoint (Maybe Int)
mePort = lens _mePort (\ s a -> s{_mePort = a})

-- | The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.
meEndpointARN :: Lens' ModifyEndpoint Text
meEndpointARN = lens _meEndpointARN (\ s a -> s{_meEndpointARN = a})

instance AWSRequest ModifyEndpoint where
        type Rs ModifyEndpoint = ModifyEndpointResponse
        request = postJSON dms
        response
          = receiveJSON
              (\ s h x ->
                 ModifyEndpointResponse' <$>
                   (x .?> "Endpoint") <*> (pure (fromEnum s)))

instance Hashable ModifyEndpoint where

instance NFData ModifyEndpoint where

instance ToHeaders ModifyEndpoint where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonDMSv20160101.ModifyEndpoint" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ModifyEndpoint where
        toJSON ModifyEndpoint'{..}
          = object
              (catMaybes
                 [("DmsTransferSettings" .=) <$>
                    _meDmsTransferSettings,
                  ("ServerName" .=) <$> _meServerName,
                  ("CertificateArn" .=) <$> _meCertificateARN,
                  ("ServiceAccessRoleArn" .=) <$>
                    _meServiceAccessRoleARN,
                  ("ExtraConnectionAttributes" .=) <$>
                    _meExtraConnectionAttributes,
                  ("EndpointType" .=) <$> _meEndpointType,
                  ("ElasticsearchSettings" .=) <$>
                    _meElasticsearchSettings,
                  ("Username" .=) <$> _meUsername,
                  ("ExternalTableDefinition" .=) <$>
                    _meExternalTableDefinition,
                  ("EngineName" .=) <$> _meEngineName,
                  ("MongoDbSettings" .=) <$> _meMongoDBSettings,
                  ("SslMode" .=) <$> _meSSLMode,
                  ("Password" .=) <$> _mePassword,
                  ("DatabaseName" .=) <$> _meDatabaseName,
                  ("S3Settings" .=) <$> _meS3Settings,
                  ("KinesisSettings" .=) <$> _meKinesisSettings,
                  ("EndpointIdentifier" .=) <$> _meEndpointIdentifier,
                  ("DynamoDbSettings" .=) <$> _meDynamoDBSettings,
                  ("Port" .=) <$> _mePort,
                  Just ("EndpointArn" .= _meEndpointARN)])

instance ToPath ModifyEndpoint where
        toPath = const "/"

instance ToQuery ModifyEndpoint where
        toQuery = const mempty

-- | 
--
--
--
-- /See:/ 'modifyEndpointResponse' smart constructor.
data ModifyEndpointResponse = ModifyEndpointResponse'
  { _mersEndpoint :: !(Maybe Endpoint)
  , _mersResponseStatus :: !Int
  } deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'ModifyEndpointResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mersEndpoint' - The modified endpoint.
--
-- * 'mersResponseStatus' - -- | The response status code.
modifyEndpointResponse
    :: Int -- ^ 'mersResponseStatus'
    -> ModifyEndpointResponse
modifyEndpointResponse pResponseStatus_ =
  ModifyEndpointResponse'
    {_mersEndpoint = Nothing, _mersResponseStatus = pResponseStatus_}


-- | The modified endpoint.
mersEndpoint :: Lens' ModifyEndpointResponse (Maybe Endpoint)
mersEndpoint = lens _mersEndpoint (\ s a -> s{_mersEndpoint = a})

-- | -- | The response status code.
mersResponseStatus :: Lens' ModifyEndpointResponse Int
mersResponseStatus = lens _mersResponseStatus (\ s a -> s{_mersResponseStatus = a})

instance NFData ModifyEndpointResponse where
