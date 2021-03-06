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
-- Module      : Network.AWS.DocDB.ModifyDBCluster
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Modifies a setting for an Amazon DocumentDB DB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. 
--
--
module Network.AWS.DocDB.ModifyDBCluster
    (
    -- * Creating a Request
      modifyDBCluster
    , ModifyDBCluster
    -- * Request Lenses
    , mdcEngineVersion
    , mdcMasterUserPassword
    , mdcCloudwatchLogsExportConfiguration
    , mdcPreferredMaintenanceWindow
    , mdcPreferredBackupWindow
    , mdcBackupRetentionPeriod
    , mdcVPCSecurityGroupIds
    , mdcDBClusterParameterGroupName
    , mdcApplyImmediately
    , mdcNewDBClusterIdentifier
    , mdcPort
    , mdcDBClusterIdentifier

    -- * Destructuring the Response
    , modifyDBClusterResponse
    , ModifyDBClusterResponse
    -- * Response Lenses
    , mdcrsDBCluster
    , mdcrsResponseStatus
    ) where

import Network.AWS.DocDB.Types
import Network.AWS.DocDB.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Represents the input to 'ModifyDBCluster' .
--
--
--
-- /See:/ 'modifyDBCluster' smart constructor.
data ModifyDBCluster = ModifyDBCluster'
  { _mdcEngineVersion :: !(Maybe Text)
  , _mdcMasterUserPassword :: !(Maybe Text)
  , _mdcCloudwatchLogsExportConfiguration :: !(Maybe CloudwatchLogsExportConfiguration)
  , _mdcPreferredMaintenanceWindow :: !(Maybe Text)
  , _mdcPreferredBackupWindow :: !(Maybe Text)
  , _mdcBackupRetentionPeriod :: !(Maybe Int)
  , _mdcVPCSecurityGroupIds :: !(Maybe [Text])
  , _mdcDBClusterParameterGroupName :: !(Maybe Text)
  , _mdcApplyImmediately :: !(Maybe Bool)
  , _mdcNewDBClusterIdentifier :: !(Maybe Text)
  , _mdcPort :: !(Maybe Int)
  , _mdcDBClusterIdentifier :: !Text
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ModifyDBCluster' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mdcEngineVersion' - The version number of the database engine to which you want to upgrade. Changing this parameter results in an outage. The change is applied during the next maintenance window unless the @ApplyImmediately@ parameter is set to @true@ .
--
-- * 'mdcMasterUserPassword' - The new password for the master database user. This password can contain any printable ASCII character except "@/@ ", "@"@ ", or "@@@ ". Constraints: Must contain from 8 to 41 characters.
--
-- * 'mdcCloudwatchLogsExportConfiguration' - The configuration setting for the log types to be enabled for export to Amazon CloudWatch Logs for a specific DB instance or DB cluster. The @EnableLogTypes@ and @DisableLogTypes@ arrays determine which logs are exported (or not exported) to CloudWatch Logs.
--
-- * 'mdcPreferredMaintenanceWindow' - The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: @ddd:hh24:mi-ddd:hh24:mi@  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.
--
-- * 'mdcPreferredBackupWindow' - The daily time range during which automated backups are created if automated backups are enabled, using the @BackupRetentionPeriod@ parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region.  Constraints:     * Must be in the format @hh24:mi-hh24:mi@ .     * Must be in Universal Coordinated Time (UTC).     * Must not conflict with the preferred maintenance window.     * Must be at least 30 minutes.
--
-- * 'mdcBackupRetentionPeriod' - The number of days for which automated backups are retained. You must specify a minimum value of 1. Default: 1 Constraints:     * Must be a value from 1 to 35.
--
-- * 'mdcVPCSecurityGroupIds' - A list of virtual private cloud (VPC) security groups that the DB cluster will belong to.
--
-- * 'mdcDBClusterParameterGroupName' - The name of the DB cluster parameter group to use for the DB cluster.
--
-- * 'mdcApplyImmediately' - A value that specifies whether the changes in this request and any pending changes are asynchronously applied as soon as possible, regardless of the @PreferredMaintenanceWindow@ setting for the DB cluster. If this parameter is set to @false@ , changes to the DB cluster are applied during the next maintenance window. The @ApplyImmediately@ parameter affects only the @NewDBClusterIdentifier@ and @MasterUserPassword@ values. If you set this parameter value to @false@ , the changes to the @NewDBClusterIdentifier@ and @MasterUserPassword@ values are applied during the next maintenance window. All other changes are applied immediately, regardless of the value of the @ApplyImmediately@ parameter. Default: @false@ 
--
-- * 'mdcNewDBClusterIdentifier' - The new DB cluster identifier for the DB cluster when renaming a DB cluster. This value is stored as a lowercase string. Constraints:     * Must contain from 1 to 63 letters, numbers, or hyphens.     * The first character must be a letter.     * Cannot end with a hyphen or contain two consecutive hyphens. Example: @my-cluster2@ 
--
-- * 'mdcPort' - The port number on which the DB cluster accepts connections. Constraints: Must be a value from @1150@ to @65535@ .  Default: The same port as the original DB cluster.
--
-- * 'mdcDBClusterIdentifier' - The DB cluster identifier for the cluster that is being modified. This parameter is not case sensitive. Constraints:     * Must match the identifier of an existing @DBCluster@ .
modifyDBCluster
    :: Text -- ^ 'mdcDBClusterIdentifier'
    -> ModifyDBCluster
modifyDBCluster pDBClusterIdentifier_ =
  ModifyDBCluster'
    { _mdcEngineVersion = Nothing
    , _mdcMasterUserPassword = Nothing
    , _mdcCloudwatchLogsExportConfiguration = Nothing
    , _mdcPreferredMaintenanceWindow = Nothing
    , _mdcPreferredBackupWindow = Nothing
    , _mdcBackupRetentionPeriod = Nothing
    , _mdcVPCSecurityGroupIds = Nothing
    , _mdcDBClusterParameterGroupName = Nothing
    , _mdcApplyImmediately = Nothing
    , _mdcNewDBClusterIdentifier = Nothing
    , _mdcPort = Nothing
    , _mdcDBClusterIdentifier = pDBClusterIdentifier_
    }


-- | The version number of the database engine to which you want to upgrade. Changing this parameter results in an outage. The change is applied during the next maintenance window unless the @ApplyImmediately@ parameter is set to @true@ .
mdcEngineVersion :: Lens' ModifyDBCluster (Maybe Text)
mdcEngineVersion = lens _mdcEngineVersion (\ s a -> s{_mdcEngineVersion = a})

-- | The new password for the master database user. This password can contain any printable ASCII character except "@/@ ", "@"@ ", or "@@@ ". Constraints: Must contain from 8 to 41 characters.
mdcMasterUserPassword :: Lens' ModifyDBCluster (Maybe Text)
mdcMasterUserPassword = lens _mdcMasterUserPassword (\ s a -> s{_mdcMasterUserPassword = a})

-- | The configuration setting for the log types to be enabled for export to Amazon CloudWatch Logs for a specific DB instance or DB cluster. The @EnableLogTypes@ and @DisableLogTypes@ arrays determine which logs are exported (or not exported) to CloudWatch Logs.
mdcCloudwatchLogsExportConfiguration :: Lens' ModifyDBCluster (Maybe CloudwatchLogsExportConfiguration)
mdcCloudwatchLogsExportConfiguration = lens _mdcCloudwatchLogsExportConfiguration (\ s a -> s{_mdcCloudwatchLogsExportConfiguration = a})

-- | The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: @ddd:hh24:mi-ddd:hh24:mi@  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun Constraints: Minimum 30-minute window.
mdcPreferredMaintenanceWindow :: Lens' ModifyDBCluster (Maybe Text)
mdcPreferredMaintenanceWindow = lens _mdcPreferredMaintenanceWindow (\ s a -> s{_mdcPreferredMaintenanceWindow = a})

-- | The daily time range during which automated backups are created if automated backups are enabled, using the @BackupRetentionPeriod@ parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region.  Constraints:     * Must be in the format @hh24:mi-hh24:mi@ .     * Must be in Universal Coordinated Time (UTC).     * Must not conflict with the preferred maintenance window.     * Must be at least 30 minutes.
mdcPreferredBackupWindow :: Lens' ModifyDBCluster (Maybe Text)
mdcPreferredBackupWindow = lens _mdcPreferredBackupWindow (\ s a -> s{_mdcPreferredBackupWindow = a})

-- | The number of days for which automated backups are retained. You must specify a minimum value of 1. Default: 1 Constraints:     * Must be a value from 1 to 35.
mdcBackupRetentionPeriod :: Lens' ModifyDBCluster (Maybe Int)
mdcBackupRetentionPeriod = lens _mdcBackupRetentionPeriod (\ s a -> s{_mdcBackupRetentionPeriod = a})

-- | A list of virtual private cloud (VPC) security groups that the DB cluster will belong to.
mdcVPCSecurityGroupIds :: Lens' ModifyDBCluster [Text]
mdcVPCSecurityGroupIds = lens _mdcVPCSecurityGroupIds (\ s a -> s{_mdcVPCSecurityGroupIds = a}) . _Default . _Coerce

-- | The name of the DB cluster parameter group to use for the DB cluster.
mdcDBClusterParameterGroupName :: Lens' ModifyDBCluster (Maybe Text)
mdcDBClusterParameterGroupName = lens _mdcDBClusterParameterGroupName (\ s a -> s{_mdcDBClusterParameterGroupName = a})

-- | A value that specifies whether the changes in this request and any pending changes are asynchronously applied as soon as possible, regardless of the @PreferredMaintenanceWindow@ setting for the DB cluster. If this parameter is set to @false@ , changes to the DB cluster are applied during the next maintenance window. The @ApplyImmediately@ parameter affects only the @NewDBClusterIdentifier@ and @MasterUserPassword@ values. If you set this parameter value to @false@ , the changes to the @NewDBClusterIdentifier@ and @MasterUserPassword@ values are applied during the next maintenance window. All other changes are applied immediately, regardless of the value of the @ApplyImmediately@ parameter. Default: @false@ 
mdcApplyImmediately :: Lens' ModifyDBCluster (Maybe Bool)
mdcApplyImmediately = lens _mdcApplyImmediately (\ s a -> s{_mdcApplyImmediately = a})

-- | The new DB cluster identifier for the DB cluster when renaming a DB cluster. This value is stored as a lowercase string. Constraints:     * Must contain from 1 to 63 letters, numbers, or hyphens.     * The first character must be a letter.     * Cannot end with a hyphen or contain two consecutive hyphens. Example: @my-cluster2@ 
mdcNewDBClusterIdentifier :: Lens' ModifyDBCluster (Maybe Text)
mdcNewDBClusterIdentifier = lens _mdcNewDBClusterIdentifier (\ s a -> s{_mdcNewDBClusterIdentifier = a})

-- | The port number on which the DB cluster accepts connections. Constraints: Must be a value from @1150@ to @65535@ .  Default: The same port as the original DB cluster.
mdcPort :: Lens' ModifyDBCluster (Maybe Int)
mdcPort = lens _mdcPort (\ s a -> s{_mdcPort = a})

-- | The DB cluster identifier for the cluster that is being modified. This parameter is not case sensitive. Constraints:     * Must match the identifier of an existing @DBCluster@ .
mdcDBClusterIdentifier :: Lens' ModifyDBCluster Text
mdcDBClusterIdentifier = lens _mdcDBClusterIdentifier (\ s a -> s{_mdcDBClusterIdentifier = a})

instance AWSRequest ModifyDBCluster where
        type Rs ModifyDBCluster = ModifyDBClusterResponse
        request = postQuery docDB
        response
          = receiveXMLWrapper "ModifyDBClusterResult"
              (\ s h x ->
                 ModifyDBClusterResponse' <$>
                   (x .@? "DBCluster") <*> (pure (fromEnum s)))

instance Hashable ModifyDBCluster where

instance NFData ModifyDBCluster where

instance ToHeaders ModifyDBCluster where
        toHeaders = const mempty

instance ToPath ModifyDBCluster where
        toPath = const "/"

instance ToQuery ModifyDBCluster where
        toQuery ModifyDBCluster'{..}
          = mconcat
              ["Action" =: ("ModifyDBCluster" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "EngineVersion" =: _mdcEngineVersion,
               "MasterUserPassword" =: _mdcMasterUserPassword,
               "CloudwatchLogsExportConfiguration" =:
                 _mdcCloudwatchLogsExportConfiguration,
               "PreferredMaintenanceWindow" =:
                 _mdcPreferredMaintenanceWindow,
               "PreferredBackupWindow" =: _mdcPreferredBackupWindow,
               "BackupRetentionPeriod" =: _mdcBackupRetentionPeriod,
               "VpcSecurityGroupIds" =:
                 toQuery
                   (toQueryList "VpcSecurityGroupId" <$>
                      _mdcVPCSecurityGroupIds),
               "DBClusterParameterGroupName" =:
                 _mdcDBClusterParameterGroupName,
               "ApplyImmediately" =: _mdcApplyImmediately,
               "NewDBClusterIdentifier" =:
                 _mdcNewDBClusterIdentifier,
               "Port" =: _mdcPort,
               "DBClusterIdentifier" =: _mdcDBClusterIdentifier]

-- | /See:/ 'modifyDBClusterResponse' smart constructor.
data ModifyDBClusterResponse = ModifyDBClusterResponse'
  { _mdcrsDBCluster :: !(Maybe DBCluster)
  , _mdcrsResponseStatus :: !Int
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'ModifyDBClusterResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mdcrsDBCluster' - Undocumented member.
--
-- * 'mdcrsResponseStatus' - -- | The response status code.
modifyDBClusterResponse
    :: Int -- ^ 'mdcrsResponseStatus'
    -> ModifyDBClusterResponse
modifyDBClusterResponse pResponseStatus_ =
  ModifyDBClusterResponse'
    {_mdcrsDBCluster = Nothing, _mdcrsResponseStatus = pResponseStatus_}


-- | Undocumented member.
mdcrsDBCluster :: Lens' ModifyDBClusterResponse (Maybe DBCluster)
mdcrsDBCluster = lens _mdcrsDBCluster (\ s a -> s{_mdcrsDBCluster = a})

-- | -- | The response status code.
mdcrsResponseStatus :: Lens' ModifyDBClusterResponse Int
mdcrsResponseStatus = lens _mdcrsResponseStatus (\ s a -> s{_mdcrsResponseStatus = a})

instance NFData ModifyDBClusterResponse where
