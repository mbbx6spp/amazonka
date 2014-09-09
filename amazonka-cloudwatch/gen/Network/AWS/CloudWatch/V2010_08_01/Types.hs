{-# LANGUAGE DeriveDataTypeable          #-}
{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudWatch.V2010_08_01.Types
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Amazon CloudWatch is a monitoring service for AWS cloud resources and the
-- applications you run on AWS. You can use Amazon CloudWatch to collect and
-- track metrics, collect and monitor log files, and set alarms. Amazon
-- CloudWatch can monitor AWS resources such as Amazon EC2 instances, Amazon
-- DynamoDB tables, and Amazon RDS DB instances, as well as custom metrics
-- generated by your applications and services, and any log files your
-- applications generate. You can use Amazon CloudWatch to gain system-wide
-- visibility into resource utilization, application performance, and
-- operational health. You can use these insights to react and keep your
-- application running smoothly.
module Network.AWS.CloudWatch.V2010_08_01.Types
    (
    -- * Service
      CloudWatch
    -- ** XML
    , xmlOptions

    -- * ComparisonOperator
    , ComparisonOperator (..)

    -- * HistoryItemType
    , HistoryItemType (..)

    -- * StandardUnit
    , StandardUnit (..)

    -- * StateValue
    , StateValue (..)

    -- * Statistic
    , Statistic (..)

    -- * AlarmHistoryItem
    , AlarmHistoryItem
    , mkAlarmHistoryItem
    , ahiAlarmName
    , ahiTimestamp
    , ahiHistoryItemType
    , ahiHistorySummary
    , ahiHistoryData

    -- * Datapoint
    , Datapoint
    , mkDatapoint
    , drTimestamp
    , drSampleCount
    , drAverage
    , drSum
    , drMinimum
    , drMaximum
    , drUnit

    -- * Dimension
    , Dimension
    , mkDimension
    , dName
    , dValue

    -- * DimensionFilter
    , DimensionFilter
    , mkDimensionFilter
    , dfName
    , dfValue

    -- * Metric
    , Metric
    , mkMetric
    , mNamespace
    , mMetricName
    , mDimensions

    -- * MetricAlarm
    , MetricAlarm
    , mkMetricAlarm
    , maAlarmName
    , maAlarmArn
    , maAlarmDescription
    , maAlarmConfigurationUpdatedTimestamp
    , maActionsEnabled
    , maOKActions
    , maAlarmActions
    , maInsufficientDataActions
    , maStateValue
    , maStateReason
    , maStateReasonData
    , maStateUpdatedTimestamp
    , maMetricName
    , maNamespace
    , maStatistic
    , maDimensions
    , maPeriod
    , maUnit
    , maEvaluationPeriods
    , maThreshold
    , maComparisonOperator

    -- * MetricDatum
    , MetricDatum
    , mkMetricDatum
    , mdMetricName
    , mdDimensions
    , mdTimestamp
    , mdValue
    , mdStatisticValues
    , mdUnit

    -- * StatisticSet
    , StatisticSet
    , mkStatisticSet
    , ssSampleCount
    , ssSum
    , ssMinimum
    , ssMaximum
    ) where

import Network.AWS.Prelude
import Network.AWS.Signing.V4

-- | Supported version (@2010-08-01@) of the
-- @Amazon CloudWatch@ service.
data CloudWatch deriving (Typeable)

instance AWSService CloudWatch where
    type Sg CloudWatch = V4
    data Er CloudWatch
        = CloudWatchClient HttpException
        | CloudWatchSerializer String
        | CloudWatchService String
        | InternalServiceFault
            { _isfMessage :: Maybe Text
            }
        | InvalidFormatFault
            { _iffMessage :: Maybe Text
            }
        | InvalidNextToken
            { _intMessage :: Maybe Text
            }
        | InvalidParameterCombinationException
            { _ipceMessage :: Maybe Text
            }
        | InvalidParameterValueException
            { _ipveMessage :: Maybe Text
            }
        | LimitExceededFault
            { _lefMessage :: Maybe Text
            }
        | MissingRequiredParameterException
            { _mrpeMessage :: Maybe Text
            }
        | ResourceNotFound
            { _rnfMessage :: Maybe Text
            }

    service = Service'
        { _svcEndpoint = Regional
        , _svcPrefix   = "monitoring"
        , _svcVersion  = "2010-08-01"
        , _svcTarget   = Nothing
        }

deriving instance Show    (Er CloudWatch)
deriving instance Generic (Er CloudWatch)

instance AWSError (Er CloudWatch) where
    awsError = const "CloudWatchError"

instance AWSServiceError (Er CloudWatch) where
    serviceError    = CloudWatchService
    clientError     = CloudWatchClient
    serializerError = CloudWatchSerializer

instance Exception (Er CloudWatch)

xmlOptions :: Tagged a XMLOptions
xmlOptions = Tagged def
    { xmlNamespace = Just "http://monitoring.amazonaws.com/doc/2010-08-01/"
    }

data ComparisonOperator
    = ComparisonOperatorGreaterThanOrEqualToThreshold -- ^ GreaterThanOrEqualToThreshold
    | ComparisonOperatorGreaterThanThreshold -- ^ GreaterThanThreshold
    | ComparisonOperatorLessThanOrEqualToThreshold -- ^ LessThanOrEqualToThreshold
    | ComparisonOperatorLessThanThreshold -- ^ LessThanThreshold
      deriving (Eq, Show, Generic)

instance Hashable ComparisonOperator

instance FromText ComparisonOperator where
    parser = match "GreaterThanOrEqualToThreshold" ComparisonOperatorGreaterThanOrEqualToThreshold
         <|> match "GreaterThanThreshold" ComparisonOperatorGreaterThanThreshold
         <|> match "LessThanOrEqualToThreshold" ComparisonOperatorLessThanOrEqualToThreshold
         <|> match "LessThanThreshold" ComparisonOperatorLessThanThreshold

instance ToText ComparisonOperator where
    toText ComparisonOperatorGreaterThanOrEqualToThreshold = "GreaterThanOrEqualToThreshold"
    toText ComparisonOperatorGreaterThanThreshold = "GreaterThanThreshold"
    toText ComparisonOperatorLessThanOrEqualToThreshold = "LessThanOrEqualToThreshold"
    toText ComparisonOperatorLessThanThreshold = "LessThanThreshold"

instance ToByteString ComparisonOperator

instance FromXML ComparisonOperator where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ComparisonOperator"

instance ToQuery ComparisonOperator where
    toQuery = genericQuery def

data HistoryItemType
    = HistoryItemTypeAction -- ^ Action
    | HistoryItemTypeConfigurationUpdate -- ^ ConfigurationUpdate
    | HistoryItemTypeStateUpdate -- ^ StateUpdate
      deriving (Eq, Show, Generic)

instance Hashable HistoryItemType

instance FromText HistoryItemType where
    parser = match "Action" HistoryItemTypeAction
         <|> match "ConfigurationUpdate" HistoryItemTypeConfigurationUpdate
         <|> match "StateUpdate" HistoryItemTypeStateUpdate

instance ToText HistoryItemType where
    toText HistoryItemTypeAction = "Action"
    toText HistoryItemTypeConfigurationUpdate = "ConfigurationUpdate"
    toText HistoryItemTypeStateUpdate = "StateUpdate"

instance ToByteString HistoryItemType

instance FromXML HistoryItemType where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HistoryItemType"

instance ToQuery HistoryItemType where
    toQuery = genericQuery def

data StandardUnit
    = StandardUnitBits -- ^ Bits
    | StandardUnitBitsSecond -- ^ Bits/Second
    | StandardUnitBytes -- ^ Bytes
    | StandardUnitBytesSecond -- ^ Bytes/Second
    | StandardUnitCount -- ^ Count
    | StandardUnitCountSecond -- ^ Count/Second
    | StandardUnitGigabits -- ^ Gigabits
    | StandardUnitGigabitsSecond -- ^ Gigabits/Second
    | StandardUnitGigabytes -- ^ Gigabytes
    | StandardUnitGigabytesSecond -- ^ Gigabytes/Second
    | StandardUnitKilobits -- ^ Kilobits
    | StandardUnitKilobitsSecond -- ^ Kilobits/Second
    | StandardUnitKilobytes -- ^ Kilobytes
    | StandardUnitKilobytesSecond -- ^ Kilobytes/Second
    | StandardUnitMegabits -- ^ Megabits
    | StandardUnitMegabitsSecond -- ^ Megabits/Second
    | StandardUnitMegabytes -- ^ Megabytes
    | StandardUnitMegabytesSecond -- ^ Megabytes/Second
    | StandardUnitMicroseconds -- ^ Microseconds
    | StandardUnitMilliseconds -- ^ Milliseconds
    | StandardUnitNone -- ^ None
    | StandardUnitPercent -- ^ Percent
    | StandardUnitSeconds -- ^ Seconds
    | StandardUnitTerabits -- ^ Terabits
    | StandardUnitTerabitsSecond -- ^ Terabits/Second
    | StandardUnitTerabytes -- ^ Terabytes
    | StandardUnitTerabytesSecond -- ^ Terabytes/Second
      deriving (Eq, Show, Generic)

instance Hashable StandardUnit

instance FromText StandardUnit where
    parser = match "Bits" StandardUnitBits
         <|> match "Bits/Second" StandardUnitBitsSecond
         <|> match "Bytes" StandardUnitBytes
         <|> match "Bytes/Second" StandardUnitBytesSecond
         <|> match "Count" StandardUnitCount
         <|> match "Count/Second" StandardUnitCountSecond
         <|> match "Gigabits" StandardUnitGigabits
         <|> match "Gigabits/Second" StandardUnitGigabitsSecond
         <|> match "Gigabytes" StandardUnitGigabytes
         <|> match "Gigabytes/Second" StandardUnitGigabytesSecond
         <|> match "Kilobits" StandardUnitKilobits
         <|> match "Kilobits/Second" StandardUnitKilobitsSecond
         <|> match "Kilobytes" StandardUnitKilobytes
         <|> match "Kilobytes/Second" StandardUnitKilobytesSecond
         <|> match "Megabits" StandardUnitMegabits
         <|> match "Megabits/Second" StandardUnitMegabitsSecond
         <|> match "Megabytes" StandardUnitMegabytes
         <|> match "Megabytes/Second" StandardUnitMegabytesSecond
         <|> match "Microseconds" StandardUnitMicroseconds
         <|> match "Milliseconds" StandardUnitMilliseconds
         <|> match "None" StandardUnitNone
         <|> match "Percent" StandardUnitPercent
         <|> match "Seconds" StandardUnitSeconds
         <|> match "Terabits" StandardUnitTerabits
         <|> match "Terabits/Second" StandardUnitTerabitsSecond
         <|> match "Terabytes" StandardUnitTerabytes
         <|> match "Terabytes/Second" StandardUnitTerabytesSecond

instance ToText StandardUnit where
    toText StandardUnitBits = "Bits"
    toText StandardUnitBitsSecond = "Bits/Second"
    toText StandardUnitBytes = "Bytes"
    toText StandardUnitBytesSecond = "Bytes/Second"
    toText StandardUnitCount = "Count"
    toText StandardUnitCountSecond = "Count/Second"
    toText StandardUnitGigabits = "Gigabits"
    toText StandardUnitGigabitsSecond = "Gigabits/Second"
    toText StandardUnitGigabytes = "Gigabytes"
    toText StandardUnitGigabytesSecond = "Gigabytes/Second"
    toText StandardUnitKilobits = "Kilobits"
    toText StandardUnitKilobitsSecond = "Kilobits/Second"
    toText StandardUnitKilobytes = "Kilobytes"
    toText StandardUnitKilobytesSecond = "Kilobytes/Second"
    toText StandardUnitMegabits = "Megabits"
    toText StandardUnitMegabitsSecond = "Megabits/Second"
    toText StandardUnitMegabytes = "Megabytes"
    toText StandardUnitMegabytesSecond = "Megabytes/Second"
    toText StandardUnitMicroseconds = "Microseconds"
    toText StandardUnitMilliseconds = "Milliseconds"
    toText StandardUnitNone = "None"
    toText StandardUnitPercent = "Percent"
    toText StandardUnitSeconds = "Seconds"
    toText StandardUnitTerabits = "Terabits"
    toText StandardUnitTerabitsSecond = "Terabits/Second"
    toText StandardUnitTerabytes = "Terabytes"
    toText StandardUnitTerabytesSecond = "Terabytes/Second"

instance ToByteString StandardUnit

instance FromXML StandardUnit where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StandardUnit"

instance ToQuery StandardUnit where
    toQuery = genericQuery def

data StateValue
    = StateValueAlarm -- ^ ALARM
    | StateValueInsufficientData -- ^ INSUFFICIENT_DATA
    | StateValueOk -- ^ OK
      deriving (Eq, Show, Generic)

instance Hashable StateValue

instance FromText StateValue where
    parser = match "ALARM" StateValueAlarm
         <|> match "INSUFFICIENT_DATA" StateValueInsufficientData
         <|> match "OK" StateValueOk

instance ToText StateValue where
    toText StateValueAlarm = "ALARM"
    toText StateValueInsufficientData = "INSUFFICIENT_DATA"
    toText StateValueOk = "OK"

instance ToByteString StateValue

instance FromXML StateValue where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StateValue"

instance ToQuery StateValue where
    toQuery = genericQuery def

data Statistic
    = StatisticAverage -- ^ Average
    | StatisticMaximum -- ^ Maximum
    | StatisticMinimum -- ^ Minimum
    | StatisticSampleCount -- ^ SampleCount
    | StatisticSum -- ^ Sum
      deriving (Eq, Show, Generic)

instance Hashable Statistic

instance FromText Statistic where
    parser = match "Average" StatisticAverage
         <|> match "Maximum" StatisticMaximum
         <|> match "Minimum" StatisticMinimum
         <|> match "SampleCount" StatisticSampleCount
         <|> match "Sum" StatisticSum

instance ToText Statistic where
    toText StatisticAverage = "Average"
    toText StatisticMaximum = "Maximum"
    toText StatisticMinimum = "Minimum"
    toText StatisticSampleCount = "SampleCount"
    toText StatisticSum = "Sum"

instance ToByteString Statistic

instance FromXML Statistic where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Statistic"

instance ToQuery Statistic where
    toQuery = genericQuery def

-- | The AlarmHistoryItem data type contains descriptive information about the
-- history of a specific alarm. If you call DescribeAlarmHistory, Amazon
-- CloudWatch returns this data type as part of the DescribeAlarmHistoryResult
-- data type.
data AlarmHistoryItem = AlarmHistoryItem
    { _ahiAlarmName :: Maybe Text
    , _ahiTimestamp :: Maybe ISO8601
    , _ahiHistoryItemType :: Maybe HistoryItemType
    , _ahiHistorySummary :: Maybe Text
    , _ahiHistoryData :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'AlarmHistoryItem' data type.
--
-- 'AlarmHistoryItem' is exclusively used in responses and this constructor
-- is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @AlarmName ::@ @Maybe Text@
--
-- * @Timestamp ::@ @Maybe ISO8601@
--
-- * @HistoryItemType ::@ @Maybe HistoryItemType@
--
-- * @HistorySummary ::@ @Maybe Text@
--
-- * @HistoryData ::@ @Maybe Text@
--
mkAlarmHistoryItem :: AlarmHistoryItem
mkAlarmHistoryItem = AlarmHistoryItem
    { _ahiAlarmName = Nothing
    , _ahiTimestamp = Nothing
    , _ahiHistoryItemType = Nothing
    , _ahiHistorySummary = Nothing
    , _ahiHistoryData = Nothing
    }

-- | The descriptive name for the alarm.
ahiAlarmName :: Lens' AlarmHistoryItem (Maybe Text)
ahiAlarmName = lens _ahiAlarmName (\s a -> s { _ahiAlarmName = a })

-- | The time stamp for the alarm history item.
ahiTimestamp :: Lens' AlarmHistoryItem (Maybe ISO8601)
ahiTimestamp = lens _ahiTimestamp (\s a -> s { _ahiTimestamp = a })

-- | The type of alarm history item.
ahiHistoryItemType :: Lens' AlarmHistoryItem (Maybe HistoryItemType)
ahiHistoryItemType =
    lens _ahiHistoryItemType (\s a -> s { _ahiHistoryItemType = a })

-- | A human-readable summary of the alarm history.
ahiHistorySummary :: Lens' AlarmHistoryItem (Maybe Text)
ahiHistorySummary =
    lens _ahiHistorySummary (\s a -> s { _ahiHistorySummary = a })

-- | Machine-readable data about the alarm in JSON format.
ahiHistoryData :: Lens' AlarmHistoryItem (Maybe Text)
ahiHistoryData = lens _ahiHistoryData (\s a -> s { _ahiHistoryData = a })

instance FromXML AlarmHistoryItem where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "AlarmHistoryItem"

-- | The Datapoint data type encapsulates the statistical data that Amazon
-- CloudWatch computes from metric data.
data Datapoint = Datapoint
    { _drTimestamp :: Maybe ISO8601
    , _drSampleCount :: Maybe Double
    , _drAverage :: Maybe Double
    , _drSum :: Maybe Double
    , _drMinimum :: Maybe Double
    , _drMaximum :: Maybe Double
    , _drUnit :: Maybe StandardUnit
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Datapoint' data type.
--
-- 'Datapoint' is exclusively used in responses and this constructor
-- is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Timestamp ::@ @Maybe ISO8601@
--
-- * @SampleCount ::@ @Maybe Double@
--
-- * @Average ::@ @Maybe Double@
--
-- * @Sum ::@ @Maybe Double@
--
-- * @Minimum ::@ @Maybe Double@
--
-- * @Maximum ::@ @Maybe Double@
--
-- * @Unit ::@ @Maybe StandardUnit@
--
mkDatapoint :: Datapoint
mkDatapoint = Datapoint
    { _drTimestamp = Nothing
    , _drSampleCount = Nothing
    , _drAverage = Nothing
    , _drSum = Nothing
    , _drMinimum = Nothing
    , _drMaximum = Nothing
    , _drUnit = Nothing
    }

-- | The time stamp used for the datapoint.
drTimestamp :: Lens' Datapoint (Maybe ISO8601)
drTimestamp = lens _drTimestamp (\s a -> s { _drTimestamp = a })

-- | The number of metric values that contributed to the aggregate value of this
-- datapoint.
drSampleCount :: Lens' Datapoint (Maybe Double)
drSampleCount = lens _drSampleCount (\s a -> s { _drSampleCount = a })

-- | The average of metric values that correspond to the datapoint.
drAverage :: Lens' Datapoint (Maybe Double)
drAverage = lens _drAverage (\s a -> s { _drAverage = a })

-- | The sum of metric values used for the datapoint.
drSum :: Lens' Datapoint (Maybe Double)
drSum = lens _drSum (\s a -> s { _drSum = a })

-- | The minimum metric value used for the datapoint.
drMinimum :: Lens' Datapoint (Maybe Double)
drMinimum = lens _drMinimum (\s a -> s { _drMinimum = a })

-- | The maximum of the metric value used for the datapoint.
drMaximum :: Lens' Datapoint (Maybe Double)
drMaximum = lens _drMaximum (\s a -> s { _drMaximum = a })

-- | The standard unit used for the datapoint.
drUnit :: Lens' Datapoint (Maybe StandardUnit)
drUnit = lens _drUnit (\s a -> s { _drUnit = a })

instance FromXML Datapoint where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Datapoint"

-- | The Dimension data type further expands on the identity of a metric using a
-- Name, Value pair.
data Dimension = Dimension
    { _dName :: Text
    , _dValue :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Dimension' data type to populate a request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Name ::@ @Text@
--
-- * @Value ::@ @Text@
--
mkDimension :: Text -- ^ 'dName'
            -> Text -- ^ 'dValue'
            -> Dimension
mkDimension p1 p2 = Dimension
    { _dName = p1
    , _dValue = p2
    }

-- | The name of the dimension.
dName :: Lens' Dimension Text
dName = lens _dName (\s a -> s { _dName = a })

-- | The value representing the dimension measurement.
dValue :: Lens' Dimension Text
dValue = lens _dValue (\s a -> s { _dValue = a })

instance FromXML Dimension where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Dimension"

instance ToQuery Dimension where
    toQuery = genericQuery def

-- | The DimensionFilter data type is used to filter ListMetrics results.
data DimensionFilter = DimensionFilter
    { _dfName :: Text
    , _dfValue :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'DimensionFilter' data type to populate a request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Name ::@ @Text@
--
-- * @Value ::@ @Maybe Text@
--
mkDimensionFilter :: Text -- ^ 'dfName'
                  -> DimensionFilter
mkDimensionFilter p1 = DimensionFilter
    { _dfName = p1
    , _dfValue = Nothing
    }

-- | The dimension name to be matched.
dfName :: Lens' DimensionFilter Text
dfName = lens _dfName (\s a -> s { _dfName = a })

-- | The value of the dimension to be matched. Specifying a Name without
-- specifying a Value returns all values associated with that Name.
dfValue :: Lens' DimensionFilter (Maybe Text)
dfValue = lens _dfValue (\s a -> s { _dfValue = a })

instance ToQuery DimensionFilter where
    toQuery = genericQuery def

-- | The Metric data type contains information about a specific metric. If you
-- call ListMetrics, Amazon CloudWatch returns information contained by this
-- data type.
data Metric = Metric
    { _mNamespace :: Maybe Text
    , _mMetricName :: Maybe Text
    , _mDimensions :: [Dimension]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'Metric' data type.
--
-- 'Metric' is exclusively used in responses and this constructor
-- is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Namespace ::@ @Maybe Text@
--
-- * @MetricName ::@ @Maybe Text@
--
-- * @Dimensions ::@ @[Dimension]@
--
mkMetric :: Metric
mkMetric = Metric
    { _mNamespace = Nothing
    , _mMetricName = Nothing
    , _mDimensions = mempty
    }

-- | The namespace of the metric.
mNamespace :: Lens' Metric (Maybe Text)
mNamespace = lens _mNamespace (\s a -> s { _mNamespace = a })

-- | The name of the metric.
mMetricName :: Lens' Metric (Maybe Text)
mMetricName = lens _mMetricName (\s a -> s { _mMetricName = a })

-- | A list of dimensions associated with the metric.
mDimensions :: Lens' Metric [Dimension]
mDimensions = lens _mDimensions (\s a -> s { _mDimensions = a })

instance FromXML Metric where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Metric"

-- | The MetricAlarm data type represents an alarm. You can use PutMetricAlarm
-- to create or update an alarm.
data MetricAlarm = MetricAlarm
    { _maAlarmName :: Maybe Text
    , _maAlarmArn :: Maybe Text
    , _maAlarmDescription :: Maybe Text
    , _maAlarmConfigurationUpdatedTimestamp :: Maybe ISO8601
    , _maActionsEnabled :: Maybe Bool
    , _maOKActions :: [Text]
    , _maAlarmActions :: [Text]
    , _maInsufficientDataActions :: [Text]
    , _maStateValue :: Maybe StateValue
    , _maStateReason :: Maybe Text
    , _maStateReasonData :: Maybe Text
    , _maStateUpdatedTimestamp :: Maybe ISO8601
    , _maMetricName :: Maybe Text
    , _maNamespace :: Maybe Text
    , _maStatistic :: Maybe Statistic
    , _maDimensions :: [Dimension]
    , _maPeriod :: Maybe Integer
    , _maUnit :: Maybe StandardUnit
    , _maEvaluationPeriods :: Maybe Integer
    , _maThreshold :: Maybe Double
    , _maComparisonOperator :: Maybe ComparisonOperator
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'MetricAlarm' data type.
--
-- 'MetricAlarm' is exclusively used in responses and this constructor
-- is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @AlarmName ::@ @Maybe Text@
--
-- * @AlarmArn ::@ @Maybe Text@
--
-- * @AlarmDescription ::@ @Maybe Text@
--
-- * @AlarmConfigurationUpdatedTimestamp ::@ @Maybe ISO8601@
--
-- * @ActionsEnabled ::@ @Maybe Bool@
--
-- * @OKActions ::@ @[Text]@
--
-- * @AlarmActions ::@ @[Text]@
--
-- * @InsufficientDataActions ::@ @[Text]@
--
-- * @StateValue ::@ @Maybe StateValue@
--
-- * @StateReason ::@ @Maybe Text@
--
-- * @StateReasonData ::@ @Maybe Text@
--
-- * @StateUpdatedTimestamp ::@ @Maybe ISO8601@
--
-- * @MetricName ::@ @Maybe Text@
--
-- * @Namespace ::@ @Maybe Text@
--
-- * @Statistic ::@ @Maybe Statistic@
--
-- * @Dimensions ::@ @[Dimension]@
--
-- * @Period ::@ @Maybe Integer@
--
-- * @Unit ::@ @Maybe StandardUnit@
--
-- * @EvaluationPeriods ::@ @Maybe Integer@
--
-- * @Threshold ::@ @Maybe Double@
--
-- * @ComparisonOperator ::@ @Maybe ComparisonOperator@
--
mkMetricAlarm :: MetricAlarm
mkMetricAlarm = MetricAlarm
    { _maAlarmName = Nothing
    , _maAlarmArn = Nothing
    , _maAlarmDescription = Nothing
    , _maAlarmConfigurationUpdatedTimestamp = Nothing
    , _maActionsEnabled = Nothing
    , _maOKActions = mempty
    , _maAlarmActions = mempty
    , _maInsufficientDataActions = mempty
    , _maStateValue = Nothing
    , _maStateReason = Nothing
    , _maStateReasonData = Nothing
    , _maStateUpdatedTimestamp = Nothing
    , _maMetricName = Nothing
    , _maNamespace = Nothing
    , _maStatistic = Nothing
    , _maDimensions = mempty
    , _maPeriod = Nothing
    , _maUnit = Nothing
    , _maEvaluationPeriods = Nothing
    , _maThreshold = Nothing
    , _maComparisonOperator = Nothing
    }

-- | The name of the alarm.
maAlarmName :: Lens' MetricAlarm (Maybe Text)
maAlarmName = lens _maAlarmName (\s a -> s { _maAlarmName = a })

-- | The Amazon Resource Name (ARN) of the alarm.
maAlarmArn :: Lens' MetricAlarm (Maybe Text)
maAlarmArn = lens _maAlarmArn (\s a -> s { _maAlarmArn = a })

-- | The description for the alarm.
maAlarmDescription :: Lens' MetricAlarm (Maybe Text)
maAlarmDescription =
    lens _maAlarmDescription (\s a -> s { _maAlarmDescription = a })

-- | The time stamp of the last update to the alarm configuration.
maAlarmConfigurationUpdatedTimestamp :: Lens' MetricAlarm (Maybe ISO8601)
maAlarmConfigurationUpdatedTimestamp =
    lens _maAlarmConfigurationUpdatedTimestamp
         (\s a -> s { _maAlarmConfigurationUpdatedTimestamp = a })

-- | Indicates whether actions should be executed during any changes to the
-- alarm's state.
maActionsEnabled :: Lens' MetricAlarm (Maybe Bool)
maActionsEnabled =
    lens _maActionsEnabled (\s a -> s { _maActionsEnabled = a })

-- | The list of actions to execute when this alarm transitions into an OK state
-- from any other state. Each action is specified as an Amazon Resource Number
-- (ARN). Currently the only actions supported are publishing to an Amazon SNS
-- topic and triggering an Auto Scaling policy.
maOKActions :: Lens' MetricAlarm [Text]
maOKActions = lens _maOKActions (\s a -> s { _maOKActions = a })

-- | The list of actions to execute when this alarm transitions into an ALARM
-- state from any other state. Each action is specified as an Amazon Resource
-- Number (ARN). Currently the only actions supported are publishing to an
-- Amazon SNS topic and triggering an Auto Scaling policy.
maAlarmActions :: Lens' MetricAlarm [Text]
maAlarmActions = lens _maAlarmActions (\s a -> s { _maAlarmActions = a })

-- | The list of actions to execute when this alarm transitions into an
-- INSUFFICIENT_DATA state from any other state. Each action is specified as
-- an Amazon Resource Number (ARN). Currently the only actions supported are
-- publishing to an Amazon SNS topic or triggering an Auto Scaling policy.
maInsufficientDataActions :: Lens' MetricAlarm [Text]
maInsufficientDataActions =
    lens _maInsufficientDataActions
         (\s a -> s { _maInsufficientDataActions = a })

-- | The state value for the alarm.
maStateValue :: Lens' MetricAlarm (Maybe StateValue)
maStateValue = lens _maStateValue (\s a -> s { _maStateValue = a })

-- | A human-readable explanation for the alarm's state.
maStateReason :: Lens' MetricAlarm (Maybe Text)
maStateReason = lens _maStateReason (\s a -> s { _maStateReason = a })

-- | An explanation for the alarm's state in machine-readable JSON format.
maStateReasonData :: Lens' MetricAlarm (Maybe Text)
maStateReasonData =
    lens _maStateReasonData (\s a -> s { _maStateReasonData = a })

-- | The time stamp of the last update to the alarm's state.
maStateUpdatedTimestamp :: Lens' MetricAlarm (Maybe ISO8601)
maStateUpdatedTimestamp =
    lens _maStateUpdatedTimestamp
         (\s a -> s { _maStateUpdatedTimestamp = a })

-- | The name of the alarm's metric.
maMetricName :: Lens' MetricAlarm (Maybe Text)
maMetricName = lens _maMetricName (\s a -> s { _maMetricName = a })

-- | The namespace of alarm's associated metric.
maNamespace :: Lens' MetricAlarm (Maybe Text)
maNamespace = lens _maNamespace (\s a -> s { _maNamespace = a })

-- | The statistic to apply to the alarm's associated metric.
maStatistic :: Lens' MetricAlarm (Maybe Statistic)
maStatistic = lens _maStatistic (\s a -> s { _maStatistic = a })

-- | The list of dimensions associated with the alarm's associated metric.
maDimensions :: Lens' MetricAlarm [Dimension]
maDimensions = lens _maDimensions (\s a -> s { _maDimensions = a })

-- | The period in seconds over which the statistic is applied.
maPeriod :: Lens' MetricAlarm (Maybe Integer)
maPeriod = lens _maPeriod (\s a -> s { _maPeriod = a })

-- | The unit of the alarm's associated metric.
maUnit :: Lens' MetricAlarm (Maybe StandardUnit)
maUnit = lens _maUnit (\s a -> s { _maUnit = a })

-- | The number of periods over which data is compared to the specified
-- threshold.
maEvaluationPeriods :: Lens' MetricAlarm (Maybe Integer)
maEvaluationPeriods =
    lens _maEvaluationPeriods (\s a -> s { _maEvaluationPeriods = a })

-- | The value against which the specified statistic is compared.
maThreshold :: Lens' MetricAlarm (Maybe Double)
maThreshold = lens _maThreshold (\s a -> s { _maThreshold = a })

-- | The arithmetic operation to use when comparing the specified Statistic and
-- Threshold. The specified Statistic value is used as the first operand.
maComparisonOperator :: Lens' MetricAlarm (Maybe ComparisonOperator)
maComparisonOperator =
    lens _maComparisonOperator (\s a -> s { _maComparisonOperator = a })

instance FromXML MetricAlarm where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "MetricAlarm"

-- | The MetricDatum data type encapsulates the information sent with
-- PutMetricData to either create a new metric or add new values to be
-- aggregated into an existing metric.
data MetricDatum = MetricDatum
    { _mdMetricName :: Text
    , _mdDimensions :: [Dimension]
    , _mdTimestamp :: Maybe ISO8601
    , _mdValue :: Maybe Double
    , _mdStatisticValues :: Maybe StatisticSet
    , _mdUnit :: Maybe StandardUnit
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'MetricDatum' data type to populate a request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @MetricName ::@ @Text@
--
-- * @Dimensions ::@ @[Dimension]@
--
-- * @Timestamp ::@ @Maybe ISO8601@
--
-- * @Value ::@ @Maybe Double@
--
-- * @StatisticValues ::@ @Maybe StatisticSet@
--
-- * @Unit ::@ @Maybe StandardUnit@
--
mkMetricDatum :: Text -- ^ 'mdMetricName'
              -> MetricDatum
mkMetricDatum p1 = MetricDatum
    { _mdMetricName = p1
    , _mdDimensions = mempty
    , _mdTimestamp = Nothing
    , _mdValue = Nothing
    , _mdStatisticValues = Nothing
    , _mdUnit = Nothing
    }

-- | The name of the metric.
mdMetricName :: Lens' MetricDatum Text
mdMetricName = lens _mdMetricName (\s a -> s { _mdMetricName = a })

-- | A list of dimensions associated with the metric.
mdDimensions :: Lens' MetricDatum [Dimension]
mdDimensions = lens _mdDimensions (\s a -> s { _mdDimensions = a })

-- | The time stamp used for the metric. If not specified, the default value is
-- set to the time the metric data was received.
mdTimestamp :: Lens' MetricDatum (Maybe ISO8601)
mdTimestamp = lens _mdTimestamp (\s a -> s { _mdTimestamp = a })

-- | The value for the metric. Although the Value parameter accepts numbers of
-- type Double, Amazon CloudWatch truncates values with very large exponents.
-- Values with base-10 exponents greater than 126 (1 x 10^126) are truncated.
-- Likewise, values with base-10 exponents less than -130 (1 x 10^-130) are
-- also truncated.
mdValue :: Lens' MetricDatum (Maybe Double)
mdValue = lens _mdValue (\s a -> s { _mdValue = a })

-- | A set of statistical values describing the metric.
mdStatisticValues :: Lens' MetricDatum (Maybe StatisticSet)
mdStatisticValues =
    lens _mdStatisticValues (\s a -> s { _mdStatisticValues = a })

-- | The unit of the metric.
mdUnit :: Lens' MetricDatum (Maybe StandardUnit)
mdUnit = lens _mdUnit (\s a -> s { _mdUnit = a })

instance ToQuery MetricDatum where
    toQuery = genericQuery def

-- | A set of statistical values describing the metric.
data StatisticSet = StatisticSet
    { _ssSampleCount :: Double
    , _ssSum :: Double
    , _ssMinimum :: Double
    , _ssMaximum :: Double
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required fields to construct
-- a valid 'StatisticSet' data type to populate a request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @SampleCount ::@ @Double@
--
-- * @Sum ::@ @Double@
--
-- * @Minimum ::@ @Double@
--
-- * @Maximum ::@ @Double@
--
mkStatisticSet :: Double -- ^ 'ssSampleCount'
               -> Double -- ^ 'ssSum'
               -> Double -- ^ 'ssMinimum'
               -> Double -- ^ 'ssMaximum'
               -> StatisticSet
mkStatisticSet p1 p2 p3 p4 = StatisticSet
    { _ssSampleCount = p1
    , _ssSum = p2
    , _ssMinimum = p3
    , _ssMaximum = p4
    }

-- | The number of samples used for the statistic set.
ssSampleCount :: Lens' StatisticSet Double
ssSampleCount = lens _ssSampleCount (\s a -> s { _ssSampleCount = a })

-- | The sum of values for the sample set.
ssSum :: Lens' StatisticSet Double
ssSum = lens _ssSum (\s a -> s { _ssSum = a })

-- | The minimum value of the sample set.
ssMinimum :: Lens' StatisticSet Double
ssMinimum = lens _ssMinimum (\s a -> s { _ssMinimum = a })

-- | The maximum value of the sample set.
ssMaximum :: Lens' StatisticSet Double
ssMaximum = lens _ssMaximum (\s a -> s { _ssMaximum = a })

instance FromXML StatisticSet where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StatisticSet"

instance ToQuery StatisticSet where
    toQuery = genericQuery def
