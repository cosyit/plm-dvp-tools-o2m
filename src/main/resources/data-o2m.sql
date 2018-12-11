/*==============================================================*/
/*           TODO 第一步：mysql库中 高仿  Oracle 数据库          */
/*==============================================================*/

DROP TABLE IF EXISTS `dx_ca_data_management_export`;
/*==============================================================*/
/* Table01: DX_CA_DATA_MANAGEMENT_EXPORT                          */
/*==============================================================*/
CREATE TABLE `dx_ca_data_management_export` (
  `CA_NUMBER` text,
  `CA_PART_NUMBER` text,
  `CA_PART_REVISION_ID` text,
  `CA_PART_EXTERNAL_ID` text,
  `CA_CAD_REVISION_ID` text,
  `CA_PART_EXPORT_STATUS` text,
  `CA_ERROR_LOG` text,
  `CA_PART_EXPORT_START_TIME` text,
  `CA_PART_PROCESS_NAME` text,
  `CA_PART_EXPORT_FORMAT` text,
  `CA_PART_TEMP_FLODER` text,
  `JOB_OWNER_EMAIL` varchar(128) DEFAULT NULL,
  `CA_PART_OWNER` varchar(128) DEFAULT NULL,
  `EXPORT_RESULT` varchar(32) DEFAULT NULL,
  `EXPORT_FOLDER` text,
  `EXPORT_SERVER` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_ca_data_management_export`
--

LOCK TABLES `dx_ca_data_management_export` WRITE;
/*!40000 ALTER TABLE `dx_ca_data_management_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_ca_data_management_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_ca_info`
--

DROP TABLE IF EXISTS `dx_ca_info`;
/*==============================================================*/
/* Table02: DX_CA_INFO                                            */
/*==============================================================*/
CREATE TABLE `dx_ca_info` (
  `CA_DX_NUMBER` varchar(100) DEFAULT NULL,
  `CA_FOLDER_NAME` varchar(100) DEFAULT NULL,
  `CA_NUMBER` varchar(100) DEFAULT NULL,
  `CA_DESCRIPTION` text,
  `CA_OWNER` varchar(50) DEFAULT NULL,
  `CA_GROUP` varchar(100) DEFAULT NULL,
  `CA_PQM` varchar(100) DEFAULT NULL,
  `CA_SUPPLIER_CONTACT_PERSON` varchar(100) DEFAULT NULL,
  `CA_SUPPLIER_NAME` varchar(100) DEFAULT NULL,
  `CA_SUPP_CONTACT_PERSON_EMAIL` varchar(150) DEFAULT NULL,
  `CA_CHANGE_OF_ACTION` varchar(100) DEFAULT NULL,
  `CA_INITIAL_PROGRAM` varchar(100) DEFAULT NULL,
  `CA_AFFECT_VEHICLE` varchar(100) DEFAULT NULL,
  `CA_EXPORT_STATUS` varchar(100) DEFAULT NULL,
  `CA_SEND_STATUS` varchar(100) DEFAULT NULL,
  `CA_RECEIVED_STATUS` varchar(100) DEFAULT NULL,
  `CA_OWNER_EMAIL` varchar(100) DEFAULT NULL,
  `CA_TILTE` text,
  `EXPORT_ERROR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_ca_info`
--

LOCK TABLES `dx_ca_info` WRITE;
/*!40000 ALTER TABLE `dx_ca_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_ca_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_ca_info_other`
--
/*==============================================================*/
/* Table03: DX_CA_INFO_OTHER                                      */
/*==============================================================*/

DROP TABLE IF EXISTS `dx_ca_info_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dx_ca_info_other` (
  `CA_NUMBER` text,
  `CA_PART_NUMBER` text,
  `CA_PART_REVISION_ID` text,
  `CA_CAD_REVISION_ID` text,
  `CA_PART_EXPORT_STATUS` text,
  `CA_ERROR_LOG` text,
  `CA_PART_EXTERNAL_ID` text,
  `CA_PART_EXPORT_START_TIME` text,
  `CA_PART_PROCESS_NAME` text,
  `CA_PART_EXPORT_FORMAT` text,
  `CA_PART_TEMP_FLODER` text,
  `JOB_OWNER_EMAIL` varchar(128) DEFAULT NULL,
  `CA_PART_OWNER` varchar(128) DEFAULT NULL,
  `EXPORT_RESULT` varchar(32) DEFAULT NULL,
  `EXPORT_FOLDER` text,
  `EXPORT_SERVER` varchar(100) DEFAULT NULL,
  `CA_PART_STATUS` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_ca_info_other`
--

LOCK TABLES `dx_ca_info_other` WRITE;
/*!40000 ALTER TABLE `dx_ca_info_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_ca_info_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_company`
--

DROP TABLE IF EXISTS `dx_company`;
/*==============================================================*/
/* Table04: DX_COMPANY                                            */
/*==============================================================*/
CREATE TABLE `dx_company` (
  `COMPANY_ID` int DEFAULT NULL,
  `COMPANY_NAME` varchar(50) DEFAULT NULL,
  `COMPANY_TYPE` int DEFAULT NULL,
  `COMPANY_DESCRIPTION` varchar(20) DEFAULT NULL,
  `COMPANY_IS_ACTIVE` int DEFAULT NULL,
  `COMPANY_CREATE_TIME` datetime DEFAULT NULL,
  `COMPANY_DEFAULT_SITE` varchar(50) DEFAULT NULL,
  `COMPANY_GROUP`   numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_company`
--

LOCK TABLES `dx_company` WRITE;
/*!40000 ALTER TABLE `dx_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_company_temp`
--

DROP TABLE IF EXISTS `dx_company_temp`;
/*==============================================================*/
/* Table06: DX_COMPANY_TEMP                                       */
/*==============================================================*/
CREATE TABLE `dx_company_temp` (
  `COMPANY_ID`  numeric(8,0) DEFAULT NULL,
  `COMPANY_NAME` text,
  `COMPANY_SHORT_NAME` text,
  `COMPANY_IS_ACTIVE` numeric(8,0) DEFAULT NULL,
  `COMPANY_CREATE_DATE` datetime DEFAULT NULL,
  `COMPANY_DEFAULT_SITE` varchar(50) DEFAULT NULL,
  `COMPANY_CODE` varchar(50) DEFAULT NULL,
  `COMPANY_TYPE` numeric(8,0) DEFAULT NULL,
  `COMPANY_GROUP` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_company_temp`
--

LOCK TABLES `dx_company_temp` WRITE;
/*!40000 ALTER TABLE `dx_company_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_company_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_companydata_relation`
--

DROP TABLE IF EXISTS `dx_companydata_relation`;
/*==============================================================*/
/* Table05: DX_COMPANYDATA_RELATION                               */
/*==============================================================*/
CREATE TABLE `dx_companydata_relation` (
  `DR_FROM` numeric(8,0) DEFAULT NULL,
  `DR_TO` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_companydata_relation`
--

LOCK TABLES `dx_companydata_relation` WRITE;
/*!40000 ALTER TABLE `dx_companydata_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_companydata_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_dr_info`
--

DROP TABLE IF EXISTS `dx_dr_info`;
/*==============================================================*/
/* Table07: DX_DR_INFO                                            */
/*==============================================================*/
CREATE TABLE `dx_dr_info` (
  `DR_DX_NUMBER` varchar(100) DEFAULT NULL,
  `DR_FOLDER_NAME` varchar(100) DEFAULT NULL,
  `DR_NUMBER` varchar(100) DEFAULT NULL,
  `DR_DESCRIPTION` text,
  `DR_OWNER` varchar(50) DEFAULT NULL,
  `DR_GROUP` varchar(100) DEFAULT NULL,
  `DR_BUYER` varchar(100) DEFAULT NULL,
  `DR_SUPPLIER_NAME` varchar(100) DEFAULT NULL,
  `DR_SUPP_CONTACT_PERSON_EMAIL` varchar(150) DEFAULT NULL,
  `DR_CHANGE_OF_ACTION` varchar(100) DEFAULT NULL,
  `DR_INITIAL_PROGRAM` varchar(100) DEFAULT NULL,
  `DR_AFFECT_VEHICLE` varchar(100) DEFAULT NULL,
  `DR_OWNER_EMAIL` varchar(150) DEFAULT NULL,
  `DR_CREATE_DATE` datetime DEFAULT NULL,
  `DR_SUMMARY` text,
  `DR_SUPP_CONTACT_PERSON_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_dr_info`
--

LOCK TABLES `dx_dr_info` WRITE;
/*!40000 ALTER TABLE `dx_dr_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_dr_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_dr_info_total`
--

DROP TABLE IF EXISTS `dx_dr_info_total`;
/*==============================================================*/
/* Table08: DX_DR_INFO_TOTAL                                      */
/*==============================================================*/
CREATE TABLE `dx_dr_info_total` (
  `DR_FOLDER_NAME` varchar(128) DEFAULT NULL,
  `DR_NUMBER` varchar(128) DEFAULT NULL,
  `DR_SUMMARY` text,
  `DR_DESCRIPTION` text,
  `DR_OWNER` varchar(64) DEFAULT NULL,
  `DR_OWNER_EMAIL` text,
  `DR_GROUP` varchar(128) DEFAULT NULL,
  `DR_BUYER` varchar(128) DEFAULT NULL,
  `DR_SUPPLIER_NAME` varchar(128) DEFAULT NULL,
  `DR_SUPP_CONTACT_PERSON_EMAIL` text,
  `DR_CHANGE_OF_ACTION` varchar(128) DEFAULT NULL,
  `DR_INITIAL_PROGRAM` varchar(128) DEFAULT NULL,
  `DR_AFFECT_VEHICLE` varchar(128) DEFAULT NULL,
  `DR_SEND_STATUS` varchar(16) DEFAULT NULL,
  `DR_CREATE_DATE` datetime DEFAULT NULL,
  `DR_DX_NUMBER` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_dr_info_total`
--

LOCK TABLES `dx_dr_info_total` WRITE;
/*!40000 ALTER TABLE `dx_dr_info_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_dr_info_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_dx`
--

DROP TABLE IF EXISTS `dx_dx`;
/*==============================================================*/
/* Table09: DX_DX                                                 */
/*==============================================================*/
CREATE TABLE `dx_dx` (
  `DX_ID` int DEFAULT NULL,
  `DX_DXID` varchar(50) DEFAULT NULL,
  `DX_NAME` text,
  `DX_DESCRIPTION` text,
  `DX_STATE` int DEFAULT NULL,
  `DX_SOURCE` int DEFAULT NULL,
  `DX_CREATER` int DEFAULT NULL,
  `DX_CREATE_DATE` datetime DEFAULT NULL,
  `DX_UPDATE_DATE` datetime DEFAULT NULL,
  `DX_RECEIVER` int DEFAULT NULL,
  `DX_PROJECT_ID` int DEFAULT NULL,
  `DX_LINE_MANAGER` int DEFAULT NULL,
  `DX_APPROVE_CODE` varchar(50) DEFAULT NULL,
  `DX_SEND_DATE` datetime DEFAULT NULL,
  `DX_APPROVE_DATE` datetime DEFAULT NULL,
  `DX_DOWNLOAD_DATE` datetime DEFAULT NULL,
  `DX_NAME_TYPE` numeric(8,0) DEFAULT NULL,
  `DX_LINE_MANAGER_APPROVE_DATE` datetime DEFAULT NULL,
  `DX_APPROVER` numeric(8,0) DEFAULT NULL,
  `DX_CANUMBER` varchar(100) DEFAULT NULL,
  KEY `ENAME_IN` (`DX_UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_dx`
--

LOCK TABLES `dx_dx` WRITE;
/*!40000 ALTER TABLE `dx_dx` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_dx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_dx_line_manager`
--

DROP TABLE IF EXISTS `dx_dx_line_manager`;
/*==============================================================*/
/* Table11: DX_DX_LINE_MANAGER                                    */
/*==============================================================*/
CREATE TABLE `dx_dx_line_manager` (
  `DLM_DX_ID` numeric(8,0) DEFAULT NULL,
  `DLM_APPROVE_CODE` varchar(20) DEFAULT NULL,
  `DLM_APPROVE_DATE` datetime DEFAULT NULL,
  `DLM_USER_ID` numeric(8,0) DEFAULT NULL,
  `DLM_STATE` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_dx_line_manager`
--

LOCK TABLES `dx_dx_line_manager` WRITE;
/*!40000 ALTER TABLE `dx_dx_line_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_dx_line_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_dxfile_relation`
--

DROP TABLE IF EXISTS `dx_dxfile_relation`;
/*==============================================================*/
/* Table10: DX_DXFILE_RELATION                                    */
/*==============================================================*/
CREATE TABLE `dx_dxfile_relation` (
  `DFR_ID` int DEFAULT NULL,
  `DFR_DTA_ID` int DEFAULT NULL,
  `DFR_FILE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_dxfile_relation`
--

LOCK TABLES `dx_dxfile_relation` WRITE;
/*!40000 ALTER TABLE `dx_dxfile_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_dxfile_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_email_log`
--

DROP TABLE IF EXISTS `dx_email_log`;
/*==============================================================*/
/* Table12: DX_EMAIL_LOG                                          */
/*==============================================================*/
CREATE TABLE `dx_email_log` (
  `DXID` numeric(8,0) DEFAULT NULL,
  `SENDER` numeric(8,0) DEFAULT NULL,
  `RECEIVER` numeric(8,0) DEFAULT NULL,
  `EMAILTYPE` numeric(8,0) DEFAULT NULL,
  `SENDDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_email_log`
--

LOCK TABLES `dx_email_log` WRITE;
/*!40000 ALTER TABLE `dx_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_export_process`
--

DROP TABLE IF EXISTS `dx_export_process`;
/*==============================================================*/
/* Table13: DX_EXPORT_PROCESS                                     */
/*==============================================================*/
CREATE TABLE `dx_export_process` (
  `NAME` varchar(100) NOT NULL,
  `STATUS` varchar(200) DEFAULT NULL,
  `STARTTIME` varchar(100) DEFAULT NULL,
  `SUCCESS` varchar(20) DEFAULT NULL,
  `ERROR` varchar(20) DEFAULT NULL,
  `UPDATETIME` varchar(100) DEFAULT NULL,
  `PENDING` varchar(32) DEFAULT NULL,
  `ACTIVE` varchar(32) DEFAULT NULL,
  `ERROR_LOG` varchar(200) DEFAULT NULL,
  `TYPE` varchar(32) DEFAULT NULL,
  `SERVER` varchar(64) DEFAULT NULL,
  `PID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_export_process`
--

LOCK TABLES `dx_export_process` WRITE;
/*!40000 ALTER TABLE `dx_export_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_export_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_file`
--

DROP TABLE IF EXISTS `dx_file`;
/*==============================================================*/
/* Table14: DX_FILE                                               */
/*==============================================================*/
CREATE TABLE `dx_file` (
  `FILE_ID` int DEFAULT NULL,
  `FILE_NAME` text,
  `FILE_DESCRIPTION` text,
  `FILE_RENAME` varchar(100) DEFAULT NULL,
  `FILE_CREATE_DATE` datetime DEFAULT NULL,
  `FILE_STORE` int DEFAULT NULL,
  `FILE_STATE` int DEFAULT NULL,
  `FILE_DOWNLOAD_TIME` int DEFAULT NULL,
  `FILE_DX_ID` numeric(38,0) DEFAULT NULL,
  `FILE_FILESIZE` numeric DEFAULT NULL,
  `FILE_DOWNLOAD_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_file`
--

LOCK TABLES `dx_file` WRITE;
/*!40000 ALTER TABLE `dx_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_file_store`
--

DROP TABLE IF EXISTS `dx_file_store`;
/*==============================================================*/
/* Table15: DX_FILE_STORE                                         */
/*==============================================================*/
CREATE TABLE `dx_file_store` (
  `STORE_ID` int DEFAULT NULL,
  `STORE_NAME` varchar(50) DEFAULT NULL,
  `STORE_IP` varchar(30) DEFAULT NULL,
  `STORE_PATH` varchar(50) DEFAULT NULL,
  `STORE_TYPE` int DEFAULT NULL,
  `STORE_AREA` int DEFAULT NULL,
  `STORE_PORT` numeric(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_file_store`
--

LOCK TABLES `dx_file_store` WRITE;
/*!40000 ALTER TABLE `dx_file_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_file_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_folder`
--

DROP TABLE IF EXISTS `dx_folder`;
/*==============================================================*/
/* Table16: DX_FOLDER                                             */
/*==============================================================*/
CREATE TABLE `dx_folder` (
  `FOLDER_ID` int DEFAULT NULL,
  `FOLDER_NAME` varchar(30) DEFAULT NULL,
  `FOLDER_CREATER` int DEFAULT NULL,
  `FOLDER_CREATEDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_folder`
--

LOCK TABLES `dx_folder` WRITE;
/*!40000 ALTER TABLE `dx_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_folder_relation`
--

DROP TABLE IF EXISTS `dx_folder_relation`;
/*==============================================================*/
/* Table17: DX_FOLDER_RELATION                                    */
/*==============================================================*/
CREATE TABLE `dx_folder_relation` (
  `FOLDER_REL_USER_ID` int DEFAULT NULL,
  `FOLDER_REL_FROM` int DEFAULT NULL,
  `FOLDER_REL_TO` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_folder_relation`
--

LOCK TABLES `dx_folder_relation` WRITE;
/*!40000 ALTER TABLE `dx_folder_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_folder_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_group`
--

DROP TABLE IF EXISTS `dx_group`;
/*==============================================================*/
/* Table18: DX_GROUP                                              */
/*==============================================================*/
CREATE TABLE `dx_group` (
  `GROUP_ID` int DEFAULT NULL,
  `GROUP_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_group`
--

LOCK TABLES `dx_group` WRITE;
/*!40000 ALTER TABLE `dx_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_groupuser_relation`
--

DROP TABLE IF EXISTS `dx_groupuser_relation`;
/*==============================================================*/
/* Table19: DX_GROUPUSER_RELATION                                 */
/*==============================================================*/
CREATE TABLE `dx_groupuser_relation` (
  `GROUPUSER_GROUP_ID` numeric(8,0) DEFAULT NULL,
  `GROUPUSER_USER_ID` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_groupuser_relation`
--

LOCK TABLES `dx_groupuser_relation` WRITE;
/*!40000 ALTER TABLE `dx_groupuser_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_groupuser_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_operation_log`
--

DROP TABLE IF EXISTS `dx_operation_log`;
/*==============================================================*/
/* Table20: DX_OPERATION_LOG                                      */
/*==============================================================*/
CREATE TABLE `dx_operation_log` (
  `OPERATION_ID` int DEFAULT NULL,
  `OPERATION_TYPE` int DEFAULT NULL,
  `OPERATION_CONTENT` varchar(50) DEFAULT NULL,
  `OPERATION_USER` int DEFAULT NULL,
  `OPERATION_DATE` datetime DEFAULT NULL,
  `OPERATION_DX` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_operation_log`
--

LOCK TABLES `dx_operation_log` WRITE;
/*!40000 ALTER TABLE `dx_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_permission`
--

DROP TABLE IF EXISTS `dx_permission`;
/*==============================================================*/
/* Table21: DX_PERMISSION                                         */
/*==============================================================*/
CREATE TABLE `dx_permission` (
  `PERMISSION_ID` int DEFAULT NULL,
  `PERMISSION_NAME` varchar(30) DEFAULT NULL,
  `PERMISSION_RESOURCE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_permission`
--

LOCK TABLES `dx_permission` WRITE;
/*!40000 ALTER TABLE `dx_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_project`
--

DROP TABLE IF EXISTS `dx_project`;
/*==============================================================*/
/* Table22: DX_PROJECT                                            */
/*==============================================================*/
CREATE TABLE `dx_project` (
  `PROJECT_ID` int DEFAULT NULL,
  `PROJECT_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_project`
--

LOCK TABLES `dx_project` WRITE;
/*!40000 ALTER TABLE `dx_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_role`
--

DROP TABLE IF EXISTS `dx_role`;
/*==============================================================*/
/* Table23: DX_ROLE                                               */
/*==============================================================*/
CREATE TABLE `dx_role` (
  `ROLE_ID` int DEFAULT NULL,
  `ROLE_NAME` varchar(30) DEFAULT NULL,
  `ROLE_DESCRIPTION` varchar(50) DEFAULT NULL,
  `ROLE_CREATE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_role`
--

LOCK TABLES `dx_role` WRITE;
/*!40000 ALTER TABLE `dx_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_rolepermission_relation`
--

DROP TABLE IF EXISTS `dx_rolepermission_relation`;
/*==============================================================*/
/* Table24: DX_ROLEPERMISSION_RELATION                            */
/*==============================================================*/
CREATE TABLE `dx_rolepermission_relation` (
  `ROLEPERM_ID` int DEFAULT NULL,
  `ROLEPERM_ROLE_ID` int DEFAULT NULL,
  `ROLEPERM_PERMISSION_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_rolepermission_relation`
--

LOCK TABLES `dx_rolepermission_relation` WRITE;
/*!40000 ALTER TABLE `dx_rolepermission_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_rolepermission_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_supplier`
--

DROP TABLE IF EXISTS `dx_supplier`;
/*==============================================================*/
/* Table25: DX_SUPPLIER                                           */
/*==============================================================*/
CREATE TABLE `dx_supplier` (
  `SUPPLIER_ID` numeric(8,0) DEFAULT NULL,
  `SUPPLIER_NAME` text,
  `SUPPLIER_SHORT_NAME` text,
  `SUPPLIER_IS_ACTIVE` numeric(8,0) DEFAULT NULL,
  `SUPPLIER_CREATE_DATE` datetime DEFAULT NULL,
  `SUPPLIER_DEFAULT_SITE` varchar(50) DEFAULT NULL,
  `SUPPLIER_CODE` varchar(50) DEFAULT NULL,
  `SUPPLIER_TYPE` numeric(8,0) DEFAULT NULL,
  `SUPPLIER_GROUP` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_supplier`
--

LOCK TABLES `dx_supplier` WRITE;
/*!40000 ALTER TABLE `dx_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_user`
--

DROP TABLE IF EXISTS `dx_user`;
/*==============================================================*/
/* Table26: DX_USER                                               */
/*==============================================================*/
CREATE TABLE `dx_user` (
  `USER_ID` int DEFAULT NULL,
  `USER_NAME` varchar(64) DEFAULT NULL,
  `USER_PASSWORD` varchar(64) DEFAULT NULL,
  `USER_SALT` varchar(30) DEFAULT NULL,
  `USER_COMPANY_ID` int DEFAULT NULL,
  `USER_EMAIL` varchar(64) DEFAULT NULL,
  `USER_IS_ACTIVE` int DEFAULT NULL,
  `USER_CREATE_DATE` datetime DEFAULT NULL,
  `USER_LAST_LOGIN_DATE` datetime DEFAULT NULL,
  `USER_CODENAME` varchar(150) DEFAULT NULL,
  `USER_NAME_CH` varchar(64) DEFAULT NULL,
  `USER_NAME_EN` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_user`
--

LOCK TABLES `dx_user` WRITE;
/*!40000 ALTER TABLE `dx_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dx_usercompany_relation`
--

DROP TABLE IF EXISTS `dx_usercompany_relation`;
/*==============================================================*/
/* Table27: DX_USERCOMPANY_RELATION                               */
/*==============================================================*/
CREATE TABLE `dx_usercompany_relation` (
  `UC_USER_ID` numeric(8,0) DEFAULT NULL,
  `UC_COMPANY_ID` numeric(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dx_usercompany_relation`
--

LOCK TABLES `dx_usercompany_relation` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `dx_userrole_relation`
--

DROP TABLE IF EXISTS `dx_userrole_relation`;
/*==============================================================*/
/* Table28: DX_USERROLE_RELATION                                  */
/*==============================================================*/
CREATE TABLE `dx_userrole_relation` (
  `UROLE_ID` int DEFAULT NULL,
  `UROLE_USER_ID` int DEFAULT NULL,
  `UROLE_ROLE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dx_userrole_relation`
--

LOCK TABLES `dx_userrole_relation` WRITE;
/*!40000 ALTER TABLE `dx_userrole_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dx_userrole_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_temp`
--

DROP TABLE IF EXISTS `file_temp`;
/*==============================================================*/
/* Table29: FILE_TEMP                                             */
/*==============================================================*/
CREATE TABLE `file_temp` (
  `FILE_NAME` varchar(100) DEFAULT NULL,
  `FILE_RNAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_temp`
--

LOCK TABLES `file_temp` WRITE;
/*!40000 ALTER TABLE `file_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v5_post_in_process`
--

DROP TABLE IF EXISTS `v5_post_in_process`;

/*==============================================================*/
/* Table31: V5_POST_IN_PROCESS                                    */
/*==============================================================*/
CREATE TABLE `v5_post_in_process` (
  `PARTNUMBER` varchar(128) DEFAULT NULL,
  `PROCESS_NAME` varchar(128) DEFAULT NULL,
  `START_TIME` varchar(64) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v5_post_in_process`
--

LOCK TABLES `v5_post_in_process` WRITE;
/*!40000 ALTER TABLE `v5_post_in_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `v5_post_in_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v5_post_product_structure`
--

DROP TABLE IF EXISTS `v5_post_product_structure`;
/*==============================================================*/
/* Table32: V5_POST_PRODUCT_STRUCTURE                             */
/*==============================================================*/
CREATE TABLE `v5_post_product_structure` (
  `P_PARTNUMBER` varchar(128) DEFAULT NULL,
  `C_PARTNUMBER` varchar(128) DEFAULT NULL,
  `C_TYPE` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v5_post_product_structure`
--

LOCK TABLES `v5_post_product_structure` WRITE;
/*!40000 ALTER TABLE `v5_post_product_structure` DISABLE KEYS */;
/*!40000 ALTER TABLE `v5_post_product_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xfbdi_baseline_detail`
--

DROP TABLE IF EXISTS `xfbdi_baseline_detail`;
/*==============================================================*/
/* Table33: XFBDI_BASELINE_DETAIL                                 */
/*==============================================================*/
CREATE TABLE `xfbdi_baseline_detail` (
  `ID` varchar(36) NOT NULL,
  `CREATEUSER` varchar(128) DEFAULT NULL,
  `CNUMBER` varchar(128) DEFAULT NULL,
  `PNAME` varchar(128) DEFAULT NULL,
  `CNAME` varchar(128) DEFAULT NULL,
  `PNUMBER` varchar(128) DEFAULT NULL,
  `CREVISION` varchar(20) DEFAULT NULL,
  `PREVISION` varchar(20) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `INSTANCE` varchar(128) DEFAULT NULL,
  `MASTERID` varchar(36) NOT NULL,
  `PARENTID` varchar(36) DEFAULT NULL,
  `PSTATUS` varchar(20) DEFAULT NULL,
  `CSTATUS` varchar(20) DEFAULT NULL,
  `CUSAGE` varchar(20) DEFAULT NULL,
  `POSITION` varchar(256) DEFAULT NULL,
  `IMATRIX_1` numeric(8,0) DEFAULT NULL,
  `IMATRIX_2` numeric(8,0) DEFAULT NULL,
  `IMATRIX_3` numeric(8,0) DEFAULT NULL,
  `IMATRIX_4` numeric(8,0) DEFAULT NULL,
  `IMATRIX_5` numeric(8,0) DEFAULT NULL,
  `IMATRIX_6` numeric(8,0) DEFAULT NULL,
  `IMATRIX_7` numeric(8,0) DEFAULT NULL,
  `IMATRIX_8` numeric(8,0) DEFAULT NULL,
  `IMATRIX_9` numeric(8,0) DEFAULT NULL,
  `IMATRIX_10` numeric(8,0) DEFAULT NULL,
  `IMATRIX_11` numeric(8,0) DEFAULT NULL,
  `IMATRIX_12` numeric(8,0) DEFAULT NULL,
  primary key (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `xfbdi_baseline_detail`
--

LOCK TABLES `xfbdi_baseline_detail` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `xfbdi_baseline_master`
--

DROP TABLE IF EXISTS `xfbdi_baseline_master`;
/*==============================================================*/
/* Table34: XFBDI_BASELINE_MASTER                                 */
/*==============================================================*/
CREATE TABLE `xfbdi_baseline_master` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  `PNUMBER` varchar(128) DEFAULT NULL,
  `PNAME` varchar(128) DEFAULT NULL,
  `PREVISION` varchar(20) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `CREATEUSER` varchar(128) DEFAULT NULL,
  primary key (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `xfbdi_baseline_master`
--

LOCK TABLES `xfbdi_baseline_master` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `xfbdi_uniques`
--

DROP TABLE IF EXISTS `xfbdi_uniques`;
/*==============================================================*/
/* Table35: XFBDI_UNIQUES                                         */
/*==============================================================*/
CREATE TABLE `xfbdi_uniques` (
  `UNIQUEID` varchar(32) NOT NULL,
  `MODIFYTIME` datetime DEFAULT NULL,
  `TYPE` varchar(128) DEFAULT NULL,
  `REVISION` varchar(32) DEFAULT NULL,
  `OPERATOR` varchar(128) DEFAULT NULL,
  `ID` varchar(128) DEFAULT NULL,
  `PARENTID` varchar(128) DEFAULT NULL,
  `CHILDID` varchar(128) DEFAULT NULL,
  `OPERATIONTIME` datetime DEFAULT NULL,
  primary key (`UNIQUEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `xfbdi_uniques`
--
LOCK TABLES `xfbdi_uniques` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `SYS_TEMP_FBT`;
/*==============================================================*/
/* Table30: SYS_TEMP_FBT                                          */
/*==============================================================*/
create table SYS_TEMP_FBT
(
   `"SCHEMA"`             varchar(32),
   OBJECT_NAME          varchar(32),
   `OBJECT#`              numeric(8,0),
   RID                  decimal(64,0),
   ACTION               char(1)
);
-- Dump completed on 2018-12-11 11:23:57
