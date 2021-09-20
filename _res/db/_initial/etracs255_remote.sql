-- MySQL dump 10.13  Distrib 5.5.59, for Win64 (AMD64)
--
-- Host: localhost    Database: etracs255_remote
-- ------------------------------------------------------
-- Server version	5.5.59

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `etracs255_remote`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `etracs255_remote` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `etracs255_remote`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `objid` varchar(50) NOT NULL,
  `maingroupid` varchar(50) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `leftindex` int(11) DEFAULT NULL,
  `rightindex` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_code` (`code`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_maingroupid` (`maingroupid`),
  KEY `ix_title` (`title`),
  KEY `uix_account_code` (`maingroupid`,`code`),
  CONSTRAINT `fk_account_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `account_maingroup` (`objid`),
  CONSTRAINT `fk_account_groupid` FOREIGN KEY (`groupid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_incometarget`
--

DROP TABLE IF EXISTS `account_incometarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_incometarget` (
  `objid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemid` (`itemid`),
  KEY `ix_year` (`year`),
  CONSTRAINT `fk_account_incometarget_itemid` FOREIGN KEY (`itemid`) REFERENCES `account` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_incometarget`
--

LOCK TABLES `account_incometarget` WRITE;
/*!40000 ALTER TABLE `account_incometarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_incometarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_item_mapping`
--

DROP TABLE IF EXISTS `account_item_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_item_mapping` (
  `objid` varchar(50) NOT NULL,
  `maingroupid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_itemid` (`itemid`),
  KEY `ix_maingroupid` (`maingroupid`),
  CONSTRAINT `fk_account_item_mapping_maingroupid` FOREIGN KEY (`maingroupid`) REFERENCES `account_maingroup` (`objid`),
  CONSTRAINT `fk_account_item_mapping_acctid` FOREIGN KEY (`acctid`) REFERENCES `account` (`objid`),
  CONSTRAINT `fk_account_item_mapping_itemid` FOREIGN KEY (`itemid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_item_mapping`
--

LOCK TABLES `account_item_mapping` WRITE;
/*!40000 ALTER TABLE `account_item_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_item_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_maingroup`
--

DROP TABLE IF EXISTS `account_maingroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_maingroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `reporttype` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_maingroup`
--

LOCK TABLES `account_maingroup` WRITE;
/*!40000 ALTER TABLE `account_maingroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_maingroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `af`
--

DROP TABLE IF EXISTS `af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `usetype` varchar(50) DEFAULT NULL,
  `serieslength` int(11) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `denomination` decimal(10,2) DEFAULT NULL,
  `formtype` varchar(50) DEFAULT NULL,
  `baseunit` varchar(10) DEFAULT NULL,
  `defaultunit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `af`
--

LOCK TABLES `af` WRITE;
/*!40000 ALTER TABLE `af` DISABLE KEYS */;
INSERT INTO `af` VALUES ('51','ACCOUNTABLE FORM #51','collection',7,1,0.00,'serial',NULL,NULL);
/*!40000 ALTER TABLE `af` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `af_allocation`
--

DROP TABLE IF EXISTS `af_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_allocation` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `af_allocation`
--

LOCK TABLES `af_allocation` WRITE;
/*!40000 ALTER TABLE `af_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `af_control`
--

DROP TABLE IF EXISTS `af_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_control` (
  `objid` varchar(50) NOT NULL,
  `afid` varchar(50) NOT NULL,
  `txnmode` varchar(10) DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(50) DEFAULT NULL,
  `startseries` int(11) NOT NULL,
  `currentseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_title` varchar(200) DEFAULT NULL,
  `stubno` int(11) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `prefix` varchar(10) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '',
  `dtfiled` date NOT NULL,
  `state` varchar(50) NOT NULL,
  `unit` varchar(25) NOT NULL,
  `batchno` int(11) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  `cost` decimal(16,2) DEFAULT NULL,
  `currentindexno` int(11) DEFAULT NULL,
  `currentdetailid` varchar(150) DEFAULT NULL,
  `batchref` varchar(50) DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  `allocid` varchar(50) DEFAULT NULL,
  `ukey` varchar(50) NOT NULL DEFAULT '',
  `salecost` decimal(16,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_af_control` (`afid`,`startseries`,`prefix`,`suffix`,`ukey`),
  KEY `ix_afid` (`afid`),
  KEY `ix_allocid` (`allocid`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_batchno` (`batchno`),
  KEY `ix_currentdetailid` (`currentdetailid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_owner_name` (`owner_name`),
  KEY `ix_owner_objid` (`owner_objid`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_ukey` (`ukey`),
  CONSTRAINT `fk_af_control_allocid` FOREIGN KEY (`allocid`) REFERENCES `af_allocation` (`objid`),
  CONSTRAINT `fk_af_control_afid` FOREIGN KEY (`afid`) REFERENCES `af` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `af_control`
--

LOCK TABLES `af_control` WRITE;
/*!40000 ALTER TABLE `af_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `af_control_detail`
--

DROP TABLE IF EXISTS `af_control_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_control_detail` (
  `objid` varchar(150) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `controlid` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `aftxnitemid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) NOT NULL,
  `reftype` varchar(32) NOT NULL,
  `refdate` datetime NOT NULL,
  `txndate` datetime NOT NULL,
  `txntype` varchar(32) NOT NULL,
  `receivedstartseries` int(11) DEFAULT NULL,
  `receivedendseries` int(11) DEFAULT NULL,
  `beginstartseries` int(11) DEFAULT NULL,
  `beginendseries` int(11) DEFAULT NULL,
  `issuedstartseries` int(11) DEFAULT NULL,
  `issuedendseries` int(11) DEFAULT NULL,
  `endingstartseries` int(11) DEFAULT NULL,
  `endingendseries` int(11) DEFAULT NULL,
  `qtyreceived` int(11) NOT NULL,
  `qtybegin` int(11) NOT NULL,
  `qtyissued` int(11) NOT NULL,
  `qtyending` int(11) NOT NULL,
  `qtycancelled` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `issuedto_objid` varchar(50) DEFAULT NULL,
  `issuedto_name` varchar(255) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(255) DEFAULT NULL,
  `prevdetailid` varchar(150) DEFAULT NULL,
  `aftxnid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_aftxnid` (`aftxnid`),
  KEY `ix_aftxnitemid` (`aftxnitemid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_issuedto_name` (`issuedto_name`),
  KEY `ix_issuedto_objid` (`issuedto_objid`),
  KEY `ix_prevdetailid` (`prevdetailid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refitemid` (`aftxnitemid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_respcenter_name` (`respcenter_name`),
  KEY `ix_respcenter_objid` (`respcenter_objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txntype` (`txntype`),
  CONSTRAINT `fk_af_control_detail_controlid` FOREIGN KEY (`controlid`) REFERENCES `af_control` (`objid`),
  CONSTRAINT `fk_af_control_detail_aftxnid` FOREIGN KEY (`aftxnid`) REFERENCES `aftxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `af_control_detail`
--

LOCK TABLES `af_control_detail` WRITE;
/*!40000 ALTER TABLE `af_control_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `af_control_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afrequest`
--

DROP TABLE IF EXISTS `afrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afrequest` (
  `objid` varchar(50) NOT NULL,
  `reqno` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `reqtype` varchar(10) DEFAULT NULL,
  `itemclass` varchar(50) DEFAULT NULL,
  `requester_objid` varchar(50) DEFAULT NULL,
  `requester_name` varchar(50) DEFAULT NULL,
  `requester_title` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  `dtapproved` datetime DEFAULT NULL,
  `approvedby_objid` varchar(50) DEFAULT NULL,
  `approvedby_name` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_reqno` (`reqno`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_requester_name` (`requester_name`),
  KEY `ix_requester_objid` (`requester_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afrequest`
--

LOCK TABLES `afrequest` WRITE;
/*!40000 ALTER TABLE `afrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `afrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afrequestitem`
--

DROP TABLE IF EXISTS `afrequestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afrequestitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `qtyreceived` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_afrequestitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `afrequest` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afrequestitem`
--

LOCK TABLES `afrequestitem` WRITE;
/*!40000 ALTER TABLE `afrequestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `afrequestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aftxn`
--

DROP TABLE IF EXISTS `aftxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxn` (
  `objid` varchar(100) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `request_objid` varchar(50) DEFAULT NULL,
  `request_reqno` varchar(50) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `issueto_objid` varchar(50) DEFAULT NULL,
  `issueto_name` varchar(100) DEFAULT NULL,
  `issueto_title` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `respcenter_objid` varchar(50) DEFAULT NULL,
  `respcenter_name` varchar(100) DEFAULT NULL,
  `txndate` datetime NOT NULL,
  `cost` decimal(16,2) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `issuefrom_objid` varchar(50) DEFAULT NULL,
  `issuefrom_name` varchar(150) DEFAULT NULL,
  `issuefrom_title` varchar(150) DEFAULT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_issueno` (`controlno`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_issuefrom_name` (`issuefrom_name`),
  KEY `ix_issuefrom_objid` (`issuefrom_objid`),
  KEY `ix_issueto_objid` (`issueto_objid`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_request_objid` (`request_objid`),
  KEY `ix_request_reqno` (`request_reqno`),
  KEY `ix_user_objid` (`user_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aftxn`
--

LOCK TABLES `aftxn` WRITE;
/*!40000 ALTER TABLE `aftxn` DISABLE KEYS */;
/*!40000 ALTER TABLE `aftxn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aftxn_type`
--

DROP TABLE IF EXISTS `aftxn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxn_type` (
  `txntype` varchar(50) NOT NULL,
  `formtype` varchar(50) DEFAULT NULL,
  `poststate` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`txntype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aftxn_type`
--

LOCK TABLES `aftxn_type` WRITE;
/*!40000 ALTER TABLE `aftxn_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `aftxn_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aftxnitem`
--

DROP TABLE IF EXISTS `aftxnitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aftxnitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(100) NOT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `qtyserved` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `cost` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_item_objid` (`item_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_aftxnitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `aftxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aftxnitem`
--

LOCK TABLES `aftxnitem` WRITE;
/*!40000 ALTER TABLE `aftxnitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `aftxnitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `afunit`
--

DROP TABLE IF EXISTS `afunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afunit` (
  `objid` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `saleprice` decimal(16,2) NOT NULL,
  `interval` int(11) DEFAULT '1',
  `cashreceiptprintout` varchar(255) DEFAULT NULL,
  `cashreceiptdetailprintout` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_itemid_unit` (`itemid`,`unit`),
  KEY `ix_itemid` (`itemid`),
  CONSTRAINT `fk_afunit_itemid` FOREIGN KEY (`itemid`) REFERENCES `af` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afunit`
--

LOCK TABLES `afunit` WRITE;
/*!40000 ALTER TABLE `afunit` DISABLE KEYS */;
INSERT INTO `afunit` VALUES ('51-STUB','51','STUB',50,0.00,1,'cashreceipt:printout:51','cashreceiptdetail:printout:51');
/*!40000 ALTER TABLE `afunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `manager` varchar(50) DEFAULT NULL,
  `deposittype` varchar(50) DEFAULT NULL,
  `depository` int(11) DEFAULT NULL,
  `depositsliphandler` varchar(50) DEFAULT NULL,
  `cashreport` varchar(255) DEFAULT NULL,
  `checkreport` varchar(255) DEFAULT NULL,
  `_ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_bank_code_branch` (`code`,`branchname`,`_ukey`),
  UNIQUE KEY `ux_bank_name_branch` (`name`,`branchname`,`_ukey`),
  KEY `ix_bank_state` (`state`),
  KEY `ix_code` (`code`),
  KEY `ix_name` (`name`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accttype` varchar(50) NOT NULL,
  `bank_objid` varchar(50) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_code` varchar(50) NOT NULL,
  `fund_title` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `cashreport` varchar(50) DEFAULT NULL,
  `cashbreakdownreport` varchar(50) DEFAULT NULL,
  `checkreport` varchar(50) DEFAULT NULL,
  `forwardbalance` decimal(16,2) DEFAULT NULL,
  `beginbalance` decimal(16,2) DEFAULT NULL,
  `totaldr` decimal(16,2) DEFAULT NULL,
  `totalcr` decimal(16,2) DEFAULT NULL,
  `endbalance` decimal(16,2) DEFAULT NULL,
  `currentlineno` int(11) DEFAULT NULL,
  `checkbreakdownreport` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `bank_objid` (`bank_objid`),
  KEY `fund_objid` (`fund_objid`),
  KEY `ix_acctid` (`acctid`),
  CONSTRAINT `fk_bankaccount_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `bankaccount_ibfk_1` FOREIGN KEY (`bank_objid`) REFERENCES `bank` (`objid`),
  CONSTRAINT `fk_bankaccount_acctid` FOREIGN KEY (`acctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccount`
--

LOCK TABLES `bankaccount` WRITE;
/*!40000 ALTER TABLE `bankaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccount_ledger`
--

DROP TABLE IF EXISTS `bankaccount_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) NOT NULL,
  `bankacctid` varchar(50) NOT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_bankaccount_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccount_ledger`
--

LOCK TABLES `bankaccount_ledger` WRITE;
/*!40000 ALTER TABLE `bankaccount_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankaccount_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barangay` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `captain_name` varchar(100) DEFAULT NULL,
  `captain_title` varchar(50) DEFAULT NULL,
  `captain_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `oldindexno` varchar(15) DEFAULT NULL,
  `oldpin` varchar(15) DEFAULT NULL,
  `fullname` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lgu_barangay_indexno` (`indexno`),
  KEY `ix_lgu_barangay_parentid` (`parentid`),
  KEY `ix_lgu_barangay_previd` (`previd`),
  CONSTRAINT `barangay_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangay`
--

LOCK TABLES `barangay` WRITE;
/*!40000 ALTER TABLE `barangay` DISABLE KEYS */;
/*!40000 ALTER TABLE `barangay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchcapture_collection`
--

DROP TABLE IF EXISTS `batchcapture_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txndate` datetime NOT NULL,
  `defaultreceiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `stub` int(11) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `formtype` varchar(10) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `serieslength` int(11) NOT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `startseries` int(11) NOT NULL,
  `endseries` int(11) NOT NULL,
  `totalamount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(100) DEFAULT NULL,
  `collector_objid` varchar(50) DEFAULT NULL,
  `collector_name` varchar(100) DEFAULT NULL,
  `collector_title` varchar(50) DEFAULT NULL,
  `capturedby_objid` varchar(50) DEFAULT NULL,
  `capturedby_name` varchar(100) DEFAULT NULL,
  `capturedby_title` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(100) DEFAULT NULL,
  `postedby_date` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `collector_objid` (`collector_objid`),
  KEY `ix_batchcapture_collection_capturedbyname` (`capturedby_name`),
  KEY `ix_batchcapture_collection_collectorname` (`collector_name`),
  KEY `ix_batchcapture_collection_txndate` (`txndate`),
  KEY `ix_capturedby_objid` (`capturedby_objid`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_defaultreceiptdate` (`defaultreceiptdate`),
  KEY `ix_formno` (`formno`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `batchcapture_collection_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchcapture_collection`
--

LOCK TABLES `batchcapture_collection` WRITE;
/*!40000 ALTER TABLE `batchcapture_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchcapture_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchcapture_collection_entry`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection_entry` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `paidby` varchar(100) NOT NULL,
  `paidbyaddress` varchar(255) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `series` int(11) NOT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `particulars` longtext,
  `voided` int(11) DEFAULT NULL,
  `paymentitems` longtext,
  PRIMARY KEY (`objid`),
  KEY `collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_batchcapture_collection_entry_parentid` (`parentid`),
  KEY `ix_batchcapture_collection_entry_receiptdate` (`receiptdate`),
  KEY `ix_batchcapture_collection_entry_receiptno` (`receiptno`),
  CONSTRAINT `batchcapture_collection_entry_ibfk_2` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `batchcapture_collection_entry_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `batchcapture_collection` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchcapture_collection_entry`
--

LOCK TABLES `batchcapture_collection_entry` WRITE;
/*!40000 ALTER TABLE `batchcapture_collection_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchcapture_collection_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchcapture_collection_entry_item`
--

DROP TABLE IF EXISTS `batchcapture_collection_entry_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchcapture_collection_entry_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_code` varchar(50) DEFAULT NULL,
  `fund_title` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fund_objid` (`fund_objid`),
  KEY `item_objid` (`item_objid`),
  KEY `ix_batchcapture_collection_entry_item_item_code` (`item_code`),
  KEY `ix_batchcapture_collection_entry_item_parentid` (`parentid`),
  CONSTRAINT `fk_batchcapture_collection_entry_item_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `batchcapture_collection_entry_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `batchcapture_collection_entry` (`objid`),
  CONSTRAINT `batchcapture_collection_entry_item_ibfk_2` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchcapture_collection_entry_item`
--

LOCK TABLES `batchcapture_collection_entry_item` WRITE;
/*!40000 ALTER TABLE `batchcapture_collection_entry_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchcapture_collection_entry_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brgy_taxaccount_mapping`
--

DROP TABLE IF EXISTS `brgy_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgy_taxaccount_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) DEFAULT NULL,
  `basicprevacct_objid` varchar(50) DEFAULT NULL,
  `basicprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicprioracct_objid` varchar(50) DEFAULT NULL,
  `basicpriorintacct_objid` varchar(50) DEFAULT NULL,
  `basiccurracct_objid` varchar(50) DEFAULT NULL,
  `basiccurrintacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brgy_taxaccount_mapping`
--

LOCK TABLES `brgy_taxaccount_mapping` WRITE;
/*!40000 ALTER TABLE `brgy_taxaccount_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgy_taxaccount_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brgyshare`
--

DROP TABLE IF EXISTS `brgyshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshare` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `txnno` varchar(15) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `totalshare` decimal(16,2) NOT NULL,
  `createdbyid` varchar(50) DEFAULT NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `postedbyid` varchar(50) DEFAULT NULL,
  `postedby` varchar(150) DEFAULT NULL,
  `postedbytitle` varchar(50) DEFAULT NULL,
  `sharetype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_brgyshare_state` (`state`),
  KEY `ix_brgyshare_yq` (`year`),
  KEY `ix_brgyshare_yqm` (`year`,`month`),
  KEY `ix_brgyshare_yr` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brgyshare`
--

LOCK TABLES `brgyshare` WRITE;
/*!40000 ALTER TABLE `brgyshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgyshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brgyshare_account_mapping`
--

DROP TABLE IF EXISTS `brgyshare_account_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshare_account_mapping` (
  `barangayid` varchar(50) NOT NULL,
  `acct_objid` varchar(50) NOT NULL,
  `penaltyacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`barangayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brgyshare_account_mapping`
--

LOCK TABLES `brgyshare_account_mapping` WRITE;
/*!40000 ALTER TABLE `brgyshare_account_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgyshare_account_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brgyshareitem`
--

DROP TABLE IF EXISTS `brgyshareitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brgyshareitem` (
  `objid` varchar(50) NOT NULL,
  `brgyshareid` varchar(50) NOT NULL,
  `barangayid` varchar(50) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `basicshare` decimal(16,2) NOT NULL,
  `basicintshare` decimal(16,2) NOT NULL,
  `commonshare` decimal(16,2) DEFAULT NULL,
  `basiccurrent` decimal(16,2) DEFAULT NULL,
  `basicprevious` decimal(16,2) DEFAULT NULL,
  `basiccollection` decimal(16,2) DEFAULT NULL,
  `basicintcollection` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `brgyshareid` (`brgyshareid`),
  CONSTRAINT `brgyshareitem_ibfk_1` FOREIGN KEY (`brgyshareid`) REFERENCES `brgyshare` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brgyshareitem`
--

LOCK TABLES `brgyshareitem` WRITE;
/*!40000 ALTER TABLE `brgyshareitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `brgyshareitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_treasury_ledger`
--

DROP TABLE IF EXISTS `cash_treasury_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_treasury_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `itemacctid` varchar(50) DEFAULT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `cash_treasury_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_treasury_ledger`
--

LOCK TABLES `cash_treasury_ledger` WRITE;
/*!40000 ALTER TABLE `cash_treasury_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_treasury_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashbook_revolving_fund`
--

DROP TABLE IF EXISTS `cashbook_revolving_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashbook_revolving_fund` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `issueto_objid` varchar(50) NOT NULL,
  `issueto_name` varchar(150) NOT NULL,
  `controldate` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_name` (`filedby_name`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_fund_title` (`fund_title`),
  KEY `ix_issueto_name` (`issueto_name`),
  KEY `ix_issueto_objid` (`issueto_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbook_revolving_fund`
--

LOCK TABLES `cashbook_revolving_fund` WRITE;
/*!40000 ALTER TABLE `cashbook_revolving_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbook_revolving_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt`
--

DROP TABLE IF EXISTS `cashreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `txndate` datetime NOT NULL,
  `receiptno` varchar(50) NOT NULL,
  `receiptdate` datetime NOT NULL,
  `txnmode` varchar(10) NOT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` varchar(800) DEFAULT NULL,
  `paidby` varchar(800) NOT NULL,
  `paidbyaddress` varchar(800) NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `totalcash` decimal(16,2) DEFAULT NULL,
  `totalnoncash` decimal(16,2) DEFAULT NULL,
  `cashchange` decimal(16,2) NOT NULL,
  `totalcredit` decimal(16,2) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `formno` varchar(50) NOT NULL,
  `series` int(11) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `collectiontype_name` varchar(100) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `subcollector_objid` varchar(50) DEFAULT NULL,
  `subcollector_name` varchar(100) DEFAULT NULL,
  `subcollector_title` varchar(50) DEFAULT NULL,
  `formtype` varchar(25) DEFAULT NULL,
  `stub` varchar(25) DEFAULT NULL,
  `remittanceid` varchar(50) DEFAULT NULL,
  `subcollector_remittanceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ix_receiptno` (`receiptno`),
  UNIQUE KEY `uix_receiptno` (`receiptno`),
  KEY `ix_collectiontype_objid` (`collectiontype_objid`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorname` (`collector_name`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_formno` (`formno`),
  KEY `ix_formtype` (`formtype`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_paidby` (`paidby`(255)),
  KEY `ix_payer_name` (`payer_name`(255)),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  KEY `ix_subcollector_remittanceid` (`subcollector_remittanceid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_user_objid` (`user_objid`),
  CONSTRAINT `fk_cashreceipt_subcollector_remittanceid` FOREIGN KEY (`subcollector_remittanceid`) REFERENCES `subcollector_remittance` (`objid`),
  CONSTRAINT `cashreceipt_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `cashreceipt_ibfk_2` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `fk_cashreceipt_collector_objid` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_cashreceipt_controlid` FOREIGN KEY (`controlid`) REFERENCES `af_control` (`objid`),
  CONSTRAINT `fk_cashreceipt_remittanceid` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt`
--

LOCK TABLES `cashreceipt` WRITE;
/*!40000 ALTER TABLE `cashreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_burial`
--

DROP TABLE IF EXISTS `cashreceipt_burial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_burial` (
  `objid` varchar(50) NOT NULL,
  `tocitymuni` varchar(100) DEFAULT NULL,
  `toprovince` varchar(100) DEFAULT NULL,
  `permissiontype` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `nationality` varchar(15) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `dtdeath` varchar(15) DEFAULT NULL,
  `deathcause` varchar(50) DEFAULT NULL,
  `cemetery` varchar(50) DEFAULT NULL,
  `infectious` varchar(50) DEFAULT NULL,
  `embalmed` varchar(50) DEFAULT NULL,
  `disposition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_burial`
--

LOCK TABLES `cashreceipt_burial` WRITE;
/*!40000 ALTER TABLE `cashreceipt_burial` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_burial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_cancelseries`
--

DROP TABLE IF EXISTS `cashreceipt_cancelseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_cancelseries` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(100) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `controlid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_receiptid` (`receiptid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `receiptid` (`receiptid`),
  CONSTRAINT `cashreceipt_cancelseries_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_cancelseries`
--

LOCK TABLES `cashreceipt_cancelseries` WRITE;
/*!40000 ALTER TABLE `cashreceipt_cancelseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_cancelseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_cashticket`
--

DROP TABLE IF EXISTS `cashreceipt_cashticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_cashticket` (
  `objid` varchar(50) NOT NULL,
  `qtyissued` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_cashticket_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_cashticket`
--

LOCK TABLES `cashreceipt_cashticket` WRITE;
/*!40000 ALTER TABLE `cashreceipt_cashticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_cashticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_changelog`
--

DROP TABLE IF EXISTS `cashreceipt_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_changelog` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `action` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_action` (`action`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_name` (`filedby_name`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_receiptid` (`receiptid`),
  CONSTRAINT `fk_cashreceipt_changelog_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_changelog`
--

LOCK TABLES `cashreceipt_changelog` WRITE;
/*!40000 ALTER TABLE `cashreceipt_changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_ctc_corporate`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_ctc_corporate` (
  `objid` varchar(50) NOT NULL,
  `payer_tin` varchar(50) DEFAULT NULL,
  `payer_orgtype` varchar(50) DEFAULT NULL,
  `payer_nature` varchar(50) DEFAULT NULL,
  `payer_dtregistered` datetime DEFAULT NULL,
  `payer_placeregistered` varchar(100) DEFAULT NULL,
  `additional_remarks` varchar(100) DEFAULT NULL,
  `realpropertyav` decimal(16,2) NOT NULL,
  `businessgross` decimal(16,2) NOT NULL,
  `basictax` decimal(16,2) NOT NULL,
  `propertyavtax` decimal(16,2) NOT NULL,
  `businessgrosstax` decimal(16,2) NOT NULL,
  `totaltax` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `amountdue` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_ctc_corporate_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_ctc_corporate`
--

LOCK TABLES `cashreceipt_ctc_corporate` WRITE;
/*!40000 ALTER TABLE `cashreceipt_ctc_corporate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_ctc_corporate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_ctc_individual`
--

DROP TABLE IF EXISTS `cashreceipt_ctc_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_ctc_individual` (
  `objid` varchar(50) NOT NULL,
  `payer_profession` varchar(50) DEFAULT NULL,
  `payer_citizenship` varchar(50) DEFAULT NULL,
  `payer_civilstatus` varchar(25) DEFAULT NULL,
  `payer_height` varchar(25) DEFAULT NULL,
  `payer_weight` varchar(25) DEFAULT NULL,
  `additional_remarks` varchar(100) DEFAULT NULL,
  `businessgross` decimal(16,2) NOT NULL,
  `annualsalary` decimal(16,2) NOT NULL,
  `propertyincome` decimal(16,2) NOT NULL,
  `basictax` decimal(16,2) NOT NULL,
  `salarytax` decimal(16,2) NOT NULL,
  `businessgrosstax` decimal(16,2) NOT NULL,
  `propertyincometax` decimal(16,2) NOT NULL,
  `additionaltax` decimal(16,2) NOT NULL,
  `totaltax` decimal(16,2) NOT NULL,
  `interest` decimal(16,2) NOT NULL,
  `amountdue` decimal(16,2) NOT NULL,
  `interestdue` decimal(16,2) NOT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(50) DEFAULT NULL,
  `brgytaxshare` decimal(16,2) NOT NULL,
  `brgyinterestshare` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_ctc_individual_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_ctc_individual`
--

LOCK TABLES `cashreceipt_ctc_individual` WRITE;
/*!40000 ALTER TABLE `cashreceipt_ctc_individual` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_ctc_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_group`
--

DROP TABLE IF EXISTS `cashreceipt_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_group` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `totalcash` decimal(16,2) NOT NULL,
  `totalnoncash` decimal(16,2) NOT NULL,
  `cashchange` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_txndate` (`txndate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_group`
--

LOCK TABLES `cashreceipt_group` WRITE;
/*!40000 ALTER TABLE `cashreceipt_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_groupitem`
--

DROP TABLE IF EXISTS `cashreceipt_groupitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_groupitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_cashreceipt_groupitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `cashreceipt_group` (`objid`),
  CONSTRAINT `fk_cashreceipt_groupitem_objid` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_groupitem`
--

LOCK TABLES `cashreceipt_groupitem` WRITE;
/*!40000 ALTER TABLE `cashreceipt_groupitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_groupitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_largecattleownership`
--

DROP TABLE IF EXISTS `cashreceipt_largecattleownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_largecattleownership` (
  `objid` varchar(50) NOT NULL,
  `ownerof` varchar(200) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `municipalitybrand` varchar(20) DEFAULT NULL,
  `ownerbrand` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_largecattleownership_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_largecattleownership`
--

LOCK TABLES `cashreceipt_largecattleownership` WRITE;
/*!40000 ALTER TABLE `cashreceipt_largecattleownership` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_largecattleownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_largecattletransfer`
--

DROP TABLE IF EXISTS `cashreceipt_largecattletransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_largecattletransfer` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `purchasedby` varchar(200) DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL,
  `citymuni` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `municipalitybrand` varchar(20) DEFAULT NULL,
  `ownerbrand` varchar(20) DEFAULT NULL,
  `certificateno` varchar(30) DEFAULT NULL,
  `issuedate` date DEFAULT NULL,
  `issuedcitymuni` varchar(100) DEFAULT NULL,
  `issuedprovince` varchar(100) DEFAULT NULL,
  `attestedby` varchar(100) DEFAULT NULL,
  `treasurer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_largecattletransfer_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_largecattletransfer`
--

LOCK TABLES `cashreceipt_largecattletransfer` WRITE;
/*!40000 ALTER TABLE `cashreceipt_largecattletransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_largecattletransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_marriage`
--

DROP TABLE IF EXISTS `cashreceipt_marriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_marriage` (
  `objid` varchar(50) NOT NULL,
  `groomname` varchar(100) DEFAULT NULL,
  `groomaddress` varchar(100) DEFAULT NULL,
  `groomageyear` int(11) DEFAULT NULL,
  `groomagemonth` int(11) DEFAULT NULL,
  `bridename` varchar(100) DEFAULT NULL,
  `brideaddress` varchar(100) DEFAULT NULL,
  `brideageyear` int(11) DEFAULT NULL,
  `brideagemonth` int(11) DEFAULT NULL,
  `registerno` varchar(30) DEFAULT NULL,
  `attachments` varchar(200) DEFAULT NULL,
  `lcrofficer` varchar(100) DEFAULT NULL,
  `lcrofficertitle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  CONSTRAINT `cashreceipt_marriage_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_marriage`
--

LOCK TABLES `cashreceipt_marriage` WRITE;
/*!40000 ALTER TABLE `cashreceipt_marriage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_marriage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_plugin`
--

DROP TABLE IF EXISTS `cashreceipt_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_plugin` (
  `objid` varchar(50) NOT NULL,
  `connection` varchar(150) NOT NULL,
  `servicename` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_plugin`
--

LOCK TABLES `cashreceipt_plugin` WRITE;
/*!40000 ALTER TABLE `cashreceipt_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_reprint_log`
--

DROP TABLE IF EXISTS `cashreceipt_reprint_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_reprint_log` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `approvedby_objid` varchar(50) NOT NULL,
  `approvedby_name` varchar(150) NOT NULL,
  `dtapproved` datetime NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_receiptid` (`receiptid`),
  CONSTRAINT `fk_cashreceipt_reprint_log_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_reprint_log`
--

LOCK TABLES `cashreceipt_reprint_log` WRITE;
/*!40000 ALTER TABLE `cashreceipt_reprint_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_reprint_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_rpt`
--

DROP TABLE IF EXISTS `cashreceipt_rpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_rpt` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_rpt`
--

LOCK TABLES `cashreceipt_rpt` WRITE;
/*!40000 ALTER TABLE `cashreceipt_rpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_rpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_rpt_share_forposting`
--

DROP TABLE IF EXISTS `cashreceipt_rpt_share_forposting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_rpt_share_forposting` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `error` int(11) NOT NULL,
  `msg` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_receiptid_rptledgerid` (`receiptid`,`rptledgerid`),
  KEY `fk_cashreceipt_rpt_share_forposing_cashreceipt` (`receiptid`),
  KEY `fk_cashreceipt_rpt_share_forposing_rptledger` (`rptledgerid`),
  CONSTRAINT `fk_cashreceipt_rpt_share_forposing_rptledger` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `fk_cashreceipt_rpt_share_forposing_cashreceipt` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_rpt_share_forposting`
--

LOCK TABLES `cashreceipt_rpt_share_forposting` WRITE;
/*!40000 ALTER TABLE `cashreceipt_rpt_share_forposting` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_rpt_share_forposting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_share`
--

DROP TABLE IF EXISTS `cashreceipt_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_share` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `refitem_objid` varchar(50) NOT NULL,
  `payableitem_objid` varchar(50) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `share` decimal(16,2) DEFAULT NULL,
  `receiptitemid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_payableitem_objid` (`payableitem_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_receiptitemid` (`receiptitemid`),
  KEY `ix_refitem_objid` (`refitem_objid`),
  CONSTRAINT `fk_cashreceipt_share_refitem_objid` FOREIGN KEY (`refitem_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_cashreceipt_share_payableitem_objid` FOREIGN KEY (`payableitem_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_cashreceipt_share_receiptid` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_share`
--

LOCK TABLES `cashreceipt_share` WRITE;
/*!40000 ALTER TABLE `cashreceipt_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_slaughter`
--

DROP TABLE IF EXISTS `cashreceipt_slaughter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_slaughter` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctno` varchar(50) DEFAULT NULL,
  `acctitle` varchar(100) DEFAULT NULL,
  `permitamount` decimal(18,2) DEFAULT NULL,
  `slaughterof` varchar(25) DEFAULT NULL,
  `weight` decimal(18,2) DEFAULT NULL,
  `ordinanceno` varchar(50) DEFAULT NULL,
  `ordinancedate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_acctno` (`acctno`),
  CONSTRAINT `cashreceipt_slaughter_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_slaughter`
--

LOCK TABLES `cashreceipt_slaughter` WRITE;
/*!40000 ALTER TABLE `cashreceipt_slaughter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_slaughter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipt_void`
--

DROP TABLE IF EXISTS `cashreceipt_void`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipt_void` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `txndate` datetime NOT NULL,
  `postedby_objid` varchar(50) NOT NULL,
  `postedby_name` varchar(100) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_receiptid` (`receiptid`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_txndate` (`txndate`),
  KEY `receiptid` (`receiptid`),
  CONSTRAINT `cashreceipt_void_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipt_void`
--

LOCK TABLES `cashreceipt_void` WRITE;
/*!40000 ALTER TABLE `cashreceipt_void` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipt_void` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceiptitem`
--

DROP TABLE IF EXISTS `cashreceiptitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `item_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `sortorder` int(11) DEFAULT '0',
  `item_fund_objid` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cashreceiptitem` (`receiptid`),
  KEY `item_objid` (`item_objid`),
  KEY `ix_item_code` (`item_code`),
  KEY `ix_item_fund_objid` (`item_fund_objid`),
  KEY `ix_item_title` (`item_title`),
  CONSTRAINT `fk_cashreceiptitem_item_fund_objid` FOREIGN KEY (`item_fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `cashreceiptitem_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`),
  CONSTRAINT `cashreceiptitem_ibfk_2` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceiptitem`
--

LOCK TABLES `cashreceiptitem` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceiptitem_discount`
--

DROP TABLE IF EXISTS `cashreceiptitem_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem_discount` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptitemid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `receiptid` (`receiptid`),
  CONSTRAINT `cashreceiptitem_discount_ibfk_1` FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceiptitem_discount`
--

LOCK TABLES `cashreceiptitem_discount` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceiptitem_rpt_account`
--

DROP TABLE IF EXISTS `cashreceiptitem_rpt_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem_rpt_account` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) DEFAULT NULL,
  `revperiod` varchar(25) NOT NULL,
  `revtype` varchar(25) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `rptreceiptid` varchar(50) DEFAULT NULL,
  `sharetype` varchar(25) NOT NULL,
  `discount` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_cashreceiptitemrptaccount_cashreceiptrpt` (`rptreceiptid`),
  KEY `ix_cashreceiptitem_rpt_account_rptledger` (`rptledgerid`),
  KEY `ix_rptbillledgeraccount_revenueitem` (`item_objid`),
  CONSTRAINT `cashreceiptitem_rpt_account_ibfk_2` FOREIGN KEY (`rptreceiptid`) REFERENCES `cashreceipt_rpt` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_account_ibfk_1` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceiptitem_rpt_account`
--

LOCK TABLES `cashreceiptitem_rpt_account` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceiptitem_rpt_online`
--

DROP TABLE IF EXISTS `cashreceiptitem_rpt_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptitem_rpt_online` (
  `objid` varchar(50) NOT NULL,
  `rptledgerid` varchar(50) DEFAULT NULL,
  `rptledgerfaasid` varchar(50) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `qtr` int(11) NOT NULL,
  `fromqtr` int(11) NOT NULL,
  `toqtr` int(11) NOT NULL,
  `basic` decimal(16,2) NOT NULL,
  `basicint` decimal(16,2) NOT NULL,
  `basicdisc` decimal(16,2) NOT NULL,
  `sef` decimal(16,2) NOT NULL,
  `sefint` decimal(16,2) NOT NULL,
  `sefdisc` decimal(16,2) NOT NULL,
  `firecode` decimal(10,2) DEFAULT NULL,
  `revperiod` varchar(25) DEFAULT NULL,
  `basicnet` decimal(16,2) DEFAULT NULL,
  `sefnet` decimal(16,2) DEFAULT NULL,
  `total` decimal(16,2) DEFAULT NULL,
  `rptreceiptid` varchar(50) DEFAULT NULL,
  `partialled` int(11) NOT NULL,
  `basicidle` decimal(16,2) DEFAULT '0.00',
  `rptledgeritemid` varchar(50) DEFAULT NULL,
  `basicidledisc` decimal(16,2) DEFAULT NULL,
  `basicidleint` decimal(16,2) DEFAULT NULL,
  `rptledgeritemqtrlyid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cashreceiptitem_rpt_online_rptledgeritem` (`rptledgeritemid`),
  KEY `ix_cashreceiptitem_rpt_online_rptledger` (`rptledgerid`),
  KEY `ix_cashreceiptitem_rpt_online_rptledgerfaas` (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerfaasid` (`rptledgerfaasid`),
  KEY `ix_rptledgerbillitem_rptledgerid` (`rptledgerid`),
  KEY `rptreceiptid` (`rptreceiptid`),
  CONSTRAINT `cashreceiptitem_rpt_online_ibfk_3` FOREIGN KEY (`rptreceiptid`) REFERENCES `cashreceipt_rpt` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_online_ibfk_1` FOREIGN KEY (`rptledgerid`) REFERENCES `rptledger` (`objid`),
  CONSTRAINT `cashreceiptitem_rpt_online_ibfk_2` FOREIGN KEY (`rptledgerfaasid`) REFERENCES `rptledgerfaas` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceiptitem_rpt_online`
--

LOCK TABLES `cashreceiptitem_rpt_online` WRITE;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptitem_rpt_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceiptpayment_creditmemo`
--

DROP TABLE IF EXISTS `cashreceiptpayment_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_creditmemo` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_code` varchar(100) DEFAULT NULL,
  `account_fund_name` varchar(50) DEFAULT NULL,
  `account_fund_objid` varchar(100) DEFAULT NULL,
  `account_bank` varchar(50) DEFAULT NULL,
  `refno` varchar(25) DEFAULT NULL,
  `refdate` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_cashreceiptpayment_creditmemo` (`receiptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceiptpayment_creditmemo`
--

LOCK TABLES `cashreceiptpayment_creditmemo` WRITE;
/*!40000 ALTER TABLE `cashreceiptpayment_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptpayment_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `cashreceiptpayment_noncash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceiptpayment_noncash` (
  `objid` varchar(50) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `_bank` varchar(50) DEFAULT NULL,
  `refno` varchar(25) DEFAULT NULL,
  `refdate` datetime DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `_bankid` varchar(50) DEFAULT NULL,
  `_deposittype` varchar(50) DEFAULT NULL,
  `account_objid` varchar(50) DEFAULT NULL,
  `account_code` varchar(50) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_fund_objid` varchar(100) DEFAULT NULL,
  `account_fund_name` varchar(50) DEFAULT NULL,
  `account_bank` varchar(100) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `checkid` varchar(50) DEFAULT NULL,
  `voidamount` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `bankid` (`_bankid`),
  KEY `FK_cashreceiptpayment_check` (`receiptid`),
  KEY `ix_account_fund_objid` (`account_fund_objid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_checkid` (`checkid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  CONSTRAINT `fk_cashreceiptpayment_noncash_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceiptpayment_noncash`
--

LOCK TABLES `cashreceiptpayment_noncash` WRITE;
/*!40000 ALTER TABLE `cashreceiptpayment_noncash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceiptpayment_noncash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreceipts`
--

DROP TABLE IF EXISTS `cashreceipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreceipts` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreceipts`
--

LOCK TABLES `cashreceipts` WRITE;
/*!40000 ALTER TABLE `cashreceipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashreceipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification`
--

DROP TABLE IF EXISTS `certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certification` (
  `objid` varchar(50) NOT NULL,
  `txnno` varchar(25) NOT NULL,
  `txndate` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `requestedby` longtext NOT NULL,
  `requestedbyaddress` varchar(100) NOT NULL,
  `purpose` text,
  `certifiedby` varchar(150) NOT NULL,
  `certifiedbytitle` varchar(50) NOT NULL,
  `byauthority` varchar(150) DEFAULT NULL,
  `byauthoritytitle` varchar(50) DEFAULT NULL,
  `orno` varchar(25) DEFAULT NULL,
  `ordate` datetime DEFAULT NULL,
  `oramount` decimal(16,2) NOT NULL,
  `stampamount` decimal(16,2) NOT NULL,
  `createdbyid` varchar(50) DEFAULT NULL,
  `createdby` varchar(150) NOT NULL,
  `createdbytitle` varchar(50) NOT NULL,
  `office` varchar(50) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_createdby` (`createdby`),
  KEY `ix_createdbyid` (`createdbyid`),
  KEY `ix_name` (`name`),
  KEY `ix_ordate` (`ordate`),
  KEY `ix_orno` (`orno`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txnno` (`txnno`),
  KEY `ix_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification`
--

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpayment`
--

DROP TABLE IF EXISTS `checkpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment` (
  `objid` varchar(50) NOT NULL,
  `bankid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `amtused` decimal(16,4) DEFAULT NULL,
  `receivedfrom` longtext,
  `state` varchar(50) DEFAULT NULL,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  `fundid` varchar(100) DEFAULT NULL,
  `depositslipid` varchar(100) DEFAULT NULL,
  `split` int(11) NOT NULL,
  `external` int(11) NOT NULL DEFAULT '0',
  `collector_objid` varchar(50) DEFAULT NULL,
  `collector_name` varchar(255) DEFAULT NULL,
  `subcollector_objid` varchar(50) DEFAULT NULL,
  `subcollector_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankid` (`bankid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_depositslipid` (`depositslipid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  CONSTRAINT `fk_paymentcheck_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_checkpayment_depositslipid` FOREIGN KEY (`depositslipid`) REFERENCES `depositslip` (`objid`),
  CONSTRAINT `fk_paymentcheck_depositvoucher` FOREIGN KEY (`depositvoucherid`) REFERENCES `depositvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpayment`
--

LOCK TABLES `checkpayment` WRITE;
/*!40000 ALTER TABLE `checkpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpayment_deadchecks`
--

DROP TABLE IF EXISTS `checkpayment_deadchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment_deadchecks` (
  `objid` varchar(50) NOT NULL,
  `bankid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `collector_objid` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `amtused` decimal(16,4) DEFAULT NULL,
  `receivedfrom` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  `fundid` varchar(100) DEFAULT NULL,
  `depositslipid` varchar(100) DEFAULT NULL,
  `split` int(11) NOT NULL,
  `amtdeposited` decimal(16,4) DEFAULT NULL,
  `external` int(11) DEFAULT NULL,
  `collector_name` varchar(255) DEFAULT NULL,
  `subcollector_objid` varchar(50) DEFAULT NULL,
  `subcollector_name` varchar(255) DEFAULT NULL,
  `collectorid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankid` (`bankid`),
  KEY `ix_collector_name` (`collector_name`),
  KEY `ix_collectorid` (`collector_objid`),
  KEY `ix_collectorid_` (`collectorid`),
  KEY `ix_depositslipid` (`depositslipid`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_subcollector_objid` (`subcollector_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpayment_deadchecks`
--

LOCK TABLES `checkpayment_deadchecks` WRITE;
/*!40000 ALTER TABLE `checkpayment_deadchecks` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkpayment_deadchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpayment_dishonored`
--

DROP TABLE IF EXISTS `checkpayment_dishonored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkpayment_dishonored` (
  `objid` varchar(50) NOT NULL,
  `checkpaymentid` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(150) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_checkpaymentid` (`checkpaymentid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_name` (`filedby_name`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  CONSTRAINT `fk_checkpayment_dishonored_checkpaymentid` FOREIGN KEY (`checkpaymentid`) REFERENCES `checkpayment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpayment_dishonored`
--

LOCK TABLES `checkpayment_dishonored` WRITE;
/*!40000 ALTER TABLE `checkpayment_dishonored` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkpayment_dishonored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citizenship` (
  `objid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizenship`
--

LOCK TABLES `citizenship` WRITE;
/*!40000 ALTER TABLE `citizenship` DISABLE KEYS */;
/*!40000 ALTER TABLE `citizenship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `mayor_name` varchar(100) DEFAULT NULL,
  `mayor_title` varchar(50) DEFAULT NULL,
  `mayor_office` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `assessor_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lgu_city_indexno` (`indexno`),
  KEY `ix_lgu_city_parentid` (`parentid`),
  KEY `ix_lgu_city_previd` (`previd`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiongroup`
--

DROP TABLE IF EXISTS `collectiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(30) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `sharing` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiongroup`
--

LOCK TABLES `collectiongroup` WRITE;
/*!40000 ALTER TABLE `collectiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiongroup_account`
--

DROP TABLE IF EXISTS `collectiongroup_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup_account` (
  `collectiongroupid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `valuetype` varchar(50) DEFAULT NULL,
  `defaultvalue` decimal(16,2) DEFAULT NULL,
  `objid` varchar(50) NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_account` (`collectiongroupid`,`account_objid`),
  KEY `ix_collectiongroupid` (`collectiongroupid`),
  KEY `revenueitemid` (`account_objid`),
  CONSTRAINT `fk_collectiongroup_account_collectiongroupid` FOREIGN KEY (`collectiongroupid`) REFERENCES `collectiongroup` (`objid`),
  CONSTRAINT `fk_collectiongroup_account_account_objid` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiongroup_account`
--

LOCK TABLES `collectiongroup_account` WRITE;
/*!40000 ALTER TABLE `collectiongroup_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiongroup_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiongroup_org`
--

DROP TABLE IF EXISTS `collectiongroup_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiongroup_org` (
  `objid` varchar(100) NOT NULL,
  `collectiongroupid` varchar(50) NOT NULL,
  `org_objid` varchar(50) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `org_type` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiongroup_org` (`collectiongroupid`,`org_objid`),
  KEY `ix_collectiongroupid` (`collectiongroupid`),
  KEY `ix_org_objid` (`org_objid`),
  CONSTRAINT `fk_collectiongroup_org_parent` FOREIGN KEY (`collectiongroupid`) REFERENCES `collectiongroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiongroup_org`
--

LOCK TABLES `collectiongroup_org` WRITE;
/*!40000 ALTER TABLE `collectiongroup_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiongroup_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiontype`
--

DROP TABLE IF EXISTS `collectiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `formno` varchar(10) DEFAULT NULL,
  `handler` varchar(25) DEFAULT NULL,
  `allowbatch` int(11) DEFAULT '0',
  `barcodekey` varchar(100) DEFAULT NULL,
  `allowonline` int(11) DEFAULT '0',
  `allowoffline` int(11) DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_title` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `allowpaymentorder` int(11) DEFAULT '0',
  `allowkiosk` int(11) DEFAULT '0',
  `allowcreditmemo` int(11) DEFAULT '0',
  `system` int(11) DEFAULT '0',
  `queuesection` varchar(50) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `fk_collectiontype_fund_objid` (`fund_objid`),
  KEY `ix_formno` (`formno`),
  KEY `ix_handler` (`handler`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_collectiontype_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiontype`
--

LOCK TABLES `collectiontype` WRITE;
/*!40000 ALTER TABLE `collectiontype` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiontype_account`
--

DROP TABLE IF EXISTS `collectiontype_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype_account` (
  `collectiontypeid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(100) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `defaultvalue` decimal(16,2) DEFAULT NULL,
  `valuetype` varchar(20) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiontype_account` (`collectiontypeid`,`account_objid`),
  KEY `fk_collectiontype_account_revitem` (`account_objid`),
  KEY `ix_account_title` (`account_title`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  CONSTRAINT `fk_collectiontype_account_collectiontype` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`),
  CONSTRAINT `FK_collectiontype_account` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_collectiontype_account_account_objid` FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiontype_account`
--

LOCK TABLES `collectiontype_account` WRITE;
/*!40000 ALTER TABLE `collectiontype_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiontype_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiontype_org`
--

DROP TABLE IF EXISTS `collectiontype_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiontype_org` (
  `objid` varchar(100) NOT NULL,
  `collectiontypeid` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(150) DEFAULT NULL,
  `org_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_collectiontype_org` (`collectiontypeid`,`org_objid`),
  KEY `ix_collectiontypeid` (`collectiontypeid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`),
  CONSTRAINT `fk_collectiontype_org_parent` FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiontype_org`
--

LOCK TABLES `collectiontype_org` WRITE;
/*!40000 ALTER TABLE `collectiontype_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiontype_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectionvoucher`
--

DROP TABLE IF EXISTS `collectionvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionvoucher` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `controldate` date NOT NULL,
  `dtposted` datetime NOT NULL,
  `liquidatingofficer_objid` varchar(50) DEFAULT NULL,
  `liquidatingofficer_name` varchar(100) DEFAULT NULL,
  `liquidatingofficer_title` varchar(50) DEFAULT NULL,
  `liquidatingofficer_signature` longtext,
  `amount` decimal(18,2) DEFAULT NULL,
  `totalcash` decimal(18,2) DEFAULT NULL,
  `totalcheck` decimal(16,4) DEFAULT NULL,
  `cashbreakdown` longtext,
  `totalcr` decimal(16,4) DEFAULT NULL,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_liquidatingofficer_name` (`liquidatingofficer_name`),
  KEY `ix_liquidatingofficer_objid` (`liquidatingofficer_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_collectionvoucher_liquidatingofficer` FOREIGN KEY (`liquidatingofficer_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_collectionvoucher_depositvoucherid` FOREIGN KEY (`depositvoucherid`) REFERENCES `depositvoucher` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectionvoucher`
--

LOCK TABLES `collectionvoucher` WRITE;
/*!40000 ALTER TABLE `collectionvoucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectionvoucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectionvoucher_fund`
--

DROP TABLE IF EXISTS `collectionvoucher_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionvoucher_fund` (
  `objid` varchar(255) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(100) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `cashbreakdown` longtext,
  `depositvoucherid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_fund_objid` (`parentid`,`fund_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_depositvoucherid` (`depositvoucherid`),
  KEY `ix_fund_objid` (`fund_objid`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `fk_collectionvoucher_fund_parentid` FOREIGN KEY (`parentid`) REFERENCES `collectionvoucher` (`objid`),
  CONSTRAINT `fk_collectionvoucher_fund_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectionvoucher_fund`
--

LOCK TABLES `collectionvoucher_fund` WRITE;
/*!40000 ALTER TABLE `collectionvoucher_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectionvoucher_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditmemo`
--

DROP TABLE IF EXISTS `creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(25) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `particulars` varchar(250) DEFAULT NULL,
  `type_objid` varchar(50) DEFAULT NULL,
  `type_title` varchar(150) DEFAULT NULL,
  `bankaccount_objid` varchar(50) DEFAULT NULL,
  `bankaccount_title` varchar(150) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `_payername` varchar(255) DEFAULT NULL,
  `_payeraddress` varchar(255) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `bankaccount_code` varchar(50) DEFAULT NULL,
  `receiptdate` date DEFAULT NULL,
  `issuereceipt` int(11) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `payer_name` varchar(255) NOT NULL,
  `payer_address_objid` varchar(50) DEFAULT NULL,
  `payer_address_text` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankaccount_objid` (`bankaccount_objid`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_payer_address_objid` (`payer_address_objid`),
  KEY `ix_payer_name` (`payer_name`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_receiptdate` (`receiptdate`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_receiptno` (`receiptno`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  KEY `ix_type_objid` (`type_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditmemo`
--

LOCK TABLES `creditmemo` WRITE;
/*!40000 ALTER TABLE `creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditmemoitem`
--

DROP TABLE IF EXISTS `creditmemoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemoitem` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_creditmemo_item` (`parentid`),
  KEY `FK_creditmemoitem_revenueitem` (`item_objid`),
  CONSTRAINT `FK_creditmemo_item` FOREIGN KEY (`parentid`) REFERENCES `creditmemo` (`objid`),
  CONSTRAINT `fk_creditmemoitem_item_objid` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_creditmemoitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `creditmemo` (`objid`),
  CONSTRAINT `FK_creditmemoitem_revenueitem` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditmemoitem`
--

LOCK TABLES `creditmemoitem` WRITE;
/*!40000 ALTER TABLE `creditmemoitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditmemoitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditmemotype`
--

DROP TABLE IF EXISTS `creditmemotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemotype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `issuereceipt` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_code` varchar(50) DEFAULT NULL,
  `fund_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_creditmemotype_fund_objid` (`fund_objid`),
  CONSTRAINT `fk_creditmemotype_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditmemotype`
--

LOCK TABLES `creditmemotype` WRITE;
/*!40000 ALTER TABLE `creditmemotype` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditmemotype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditmemotype_account`
--

DROP TABLE IF EXISTS `creditmemotype_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditmemotype_account` (
  `typeid` varchar(50) NOT NULL,
  `account_objid` varchar(50) NOT NULL,
  `account_title` varchar(100) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_objid`,`typeid`),
  KEY `ix_account_objid` (`account_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditmemotype_account`
--

LOCK TABLES `creditmemotype_account` WRITE;
/*!40000 ALTER TABLE `creditmemotype_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditmemotype_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_fund_transfer`
--

DROP TABLE IF EXISTS `deposit_fund_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_fund_transfer` (
  `objid` varchar(150) NOT NULL,
  `fromdepositvoucherfundid` varchar(150) NOT NULL,
  `todepositvoucherfundid` varchar(150) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_fromfundid` (`fromdepositvoucherfundid`),
  KEY `ix_tofundid` (`todepositvoucherfundid`),
  CONSTRAINT `fk_deposit_fund_transfer_todepositvoucherfundid` FOREIGN KEY (`todepositvoucherfundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_deposit_fund_transfer_fromdepositvoucherfundid` FOREIGN KEY (`fromdepositvoucherfundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_fund_transfer`
--

LOCK TABLES `deposit_fund_transfer` WRITE;
/*!40000 ALTER TABLE `deposit_fund_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit_fund_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositslip`
--

DROP TABLE IF EXISTS `depositslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositslip` (
  `objid` varchar(100) NOT NULL,
  `depositvoucherfundid` varchar(150) DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `depositdate` date DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `bankacctid` varchar(50) DEFAULT NULL,
  `totalcash` decimal(16,4) DEFAULT NULL,
  `totalcheck` decimal(16,4) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `validation_refno` varchar(50) DEFAULT NULL,
  `validation_refdate` date DEFAULT NULL,
  `cashbreakdown` longtext,
  `state` varchar(10) DEFAULT NULL,
  `deposittype` varchar(50) DEFAULT NULL,
  `checktype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_depositdate` (`depositdate`),
  KEY `ix_depositvoucherid` (`depositvoucherfundid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_validation_refdate` (`validation_refdate`),
  KEY `ix_validation_refno` (`validation_refno`),
  CONSTRAINT `fk_depositslip_depositvoucherfundid` FOREIGN KEY (`depositvoucherfundid`) REFERENCES `depositvoucher_fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositslip`
--

LOCK TABLES `depositslip` WRITE;
/*!40000 ALTER TABLE `depositslip` DISABLE KEYS */;
/*!40000 ALTER TABLE `depositslip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositvoucher`
--

DROP TABLE IF EXISTS `depositvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositvoucher` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `controldate` date NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `dtposted` datetime DEFAULT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_postedby_name` (`postedby_name`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositvoucher`
--

LOCK TABLES `depositvoucher` WRITE;
/*!40000 ALTER TABLE `depositvoucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `depositvoucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositvoucher_fund`
--

DROP TABLE IF EXISTS `depositvoucher_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositvoucher_fund` (
  `objid` varchar(150) NOT NULL,
  `state` varchar(20) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `fundid` varchar(100) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `amountdeposited` decimal(16,4) NOT NULL,
  `totaldr` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `dtposted` datetime DEFAULT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  `postedby_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_fundid` (`parentid`,`fundid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_postedby_name` (`postedby_name`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_depositvoucher_fund_parentid` FOREIGN KEY (`parentid`) REFERENCES `depositvoucher` (`objid`),
  CONSTRAINT `fk_depositvoucher_fund_fundid` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositvoucher_fund`
--

LOCK TABLES `depositvoucher_fund` WRITE;
/*!40000 ALTER TABLE `depositvoucher_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `depositvoucher_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounttype`
--

DROP TABLE IF EXISTS `discounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounttype` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounttype`
--

LOCK TABLES `discounttype` WRITE;
/*!40000 ALTER TABLE `discounttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `oldindexno` varchar(15) DEFAULT NULL,
  `oldpin` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lgu_district_indexno` (`indexno`),
  KEY `ix_lgu_district_parentid` (`parentid`),
  KEY `ix_lgu_district_previd` (`previd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draftremittance`
--

DROP TABLE IF EXISTS `draftremittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftremittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `remittancedate` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(255) NOT NULL,
  `collector_title` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `txnmode` varchar(32) NOT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_remittancedate` (`remittancedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draftremittance`
--

LOCK TABLES `draftremittance` WRITE;
/*!40000 ALTER TABLE `draftremittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `draftremittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draftremittanceitem`
--

DROP TABLE IF EXISTS `draftremittanceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftremittanceitem` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `controlid` varchar(50) NOT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalnoncash` decimal(18,2) NOT NULL,
  `voided` int(11) NOT NULL,
  `cancelled` int(11) NOT NULL,
  `lockid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchid` (`batchid`),
  KEY `ix_controlid` (`controlid`),
  KEY `ix_remittanceid` (`remittanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draftremittanceitem`
--

LOCK TABLES `draftremittanceitem` WRITE;
/*!40000 ALTER TABLE `draftremittanceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `draftremittanceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eftpayment`
--

DROP TABLE IF EXISTS `eftpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eftpayment` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `receivedfrom` varchar(255) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `bankacctid` varchar(50) NOT NULL,
  `fundid` varchar(100) DEFAULT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `receiptid` varchar(50) DEFAULT NULL,
  `receiptno` varchar(50) DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `payer_address_objid` varchar(50) DEFAULT NULL,
  `payer_address_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_bankacctid` (`bankacctid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_payer_address_objid` (`payer_address_objid`),
  KEY `ix_payer_objid` (`payer_objid`),
  KEY `ix_receiptid` (`receiptid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refno` (`refno`),
  KEY `ix_state` (`state`),
  CONSTRAINT `fk_eftpayment_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_eftpayment_bankacct` FOREIGN KEY (`bankacctid`) REFERENCES `bankaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eftpayment`
--

LOCK TABLES `eftpayment` WRITE;
/*!40000 ALTER TABLE `eftpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `eftpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity` (
  `objid` varchar(50) NOT NULL,
  `entityno` varchar(50) NOT NULL,
  `name` longtext NOT NULL,
  `address_text` varchar(255) NOT NULL DEFAULT '',
  `mailingaddress` varchar(255) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `sys_lastupdate` varchar(25) DEFAULT NULL,
  `sys_lastupdateby` varchar(50) DEFAULT NULL,
  `remarks` text,
  `entityname` varchar(800) NOT NULL,
  `address_objid` varchar(50) DEFAULT NULL,
  `mobileno` varchar(25) DEFAULT NULL,
  `phoneno` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_entityno` (`entityno`),
  KEY `ix_address_objid` (`address_objid`),
  KEY `ix_entityname` (`entityname`(255)),
  KEY `ix_entityname_state` (`state`,`entityname`(255)),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_address`
--

DROP TABLE IF EXISTS `entity_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_address` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `addresstype` varchar(50) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `municipality` varchar(50) DEFAULT NULL,
  `bldgno` varchar(50) DEFAULT NULL,
  `bldgname` varchar(50) DEFAULT NULL,
  `unitno` varchar(50) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_parentid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_address`
--

LOCK TABLES `entity_address` WRITE;
/*!40000 ALTER TABLE `entity_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_ctc`
--

DROP TABLE IF EXISTS `entity_ctc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_ctc` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `nonresident` int(11) NOT NULL,
  `ctcno` varchar(50) NOT NULL,
  `dtissued` date NOT NULL,
  `placeissued` varchar(255) NOT NULL,
  `lgu_objid` varchar(50) DEFAULT NULL,
  `lgu_name` varchar(255) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(255) NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(160) NOT NULL,
  `system` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_name` (`barangay_name`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_createdby_name` (`createdby_name`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_ctcno` (`ctcno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_lgu_name` (`lgu_name`),
  KEY `ix_lgu_objid` (`lgu_objid`),
  CONSTRAINT `fk_entity_ctc_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_ctc`
--

LOCK TABLES `entity_ctc` WRITE;
/*!40000 ALTER TABLE `entity_ctc` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_ctc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_fingerprint`
--

DROP TABLE IF EXISTS `entity_fingerprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_fingerprint` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `fingertype` varchar(20) DEFAULT NULL,
  `data` longtext,
  `image` longtext,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_entityid_fingertype` (`entityid`,`fingertype`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_entityid` (`entityid`),
  CONSTRAINT `fk_entity_fingerprint_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_fingerprint`
--

LOCK TABLES `entity_fingerprint` WRITE;
/*!40000 ALTER TABLE `entity_fingerprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_fingerprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_mapping`
--

DROP TABLE IF EXISTS `entity_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping` (
  `objid` varchar(50) NOT NULL,
  `parent_objid` varchar(50) NOT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_mapping`
--

LOCK TABLES `entity_mapping` WRITE;
/*!40000 ALTER TABLE `entity_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_reconciled`
--

DROP TABLE IF EXISTS `entity_reconciled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_reconciled` (
  `objid` varchar(50) NOT NULL,
  `info` longtext,
  `masterid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_entity_reconciled_entity` (`masterid`),
  CONSTRAINT `FK_entity_reconciled_entity` FOREIGN KEY (`masterid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_reconciled`
--

LOCK TABLES `entity_reconciled` WRITE;
/*!40000 ALTER TABLE `entity_reconciled` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_reconciled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_reconciled_txn`
--

DROP TABLE IF EXISTS `entity_reconciled_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_reconciled_txn` (
  `objid` varchar(50) NOT NULL,
  `reftype` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `tag` char(1) DEFAULT NULL,
  PRIMARY KEY (`objid`,`refid`,`reftype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_reconciled_txn`
--

LOCK TABLES `entity_reconciled_txn` WRITE;
/*!40000 ALTER TABLE `entity_reconciled_txn` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_reconciled_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_relation`
--

DROP TABLE IF EXISTS `entity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relation` (
  `objid` varchar(50) NOT NULL,
  `entity_objid` varchar(50) DEFAULT NULL,
  `relateto_objid` varchar(50) DEFAULT NULL,
  `relation_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_sender_receiver` (`entity_objid`,`relateto_objid`),
  KEY `ix_entity_objid` (`entity_objid`),
  KEY `ix_relateto_objid` (`relateto_objid`),
  KEY `ix_relation_objid` (`relation_objid`),
  CONSTRAINT `fk_entity_relation_relation_objid` FOREIGN KEY (`relateto_objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `fk_entity_relation_entity_objid` FOREIGN KEY (`entity_objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `fk_entity_relation_relation` FOREIGN KEY (`relation_objid`) REFERENCES `entity_relation_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_relation`
--

LOCK TABLES `entity_relation` WRITE;
/*!40000 ALTER TABLE `entity_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_relation_type`
--

DROP TABLE IF EXISTS `entity_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_relation_type` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(1) DEFAULT NULL,
  `inverse_any` varchar(50) DEFAULT NULL,
  `inverse_male` varchar(50) DEFAULT NULL,
  `inverse_female` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_relation_type`
--

LOCK TABLES `entity_relation_type` WRITE;
/*!40000 ALTER TABLE `entity_relation_type` DISABLE KEYS */;
INSERT INTO `entity_relation_type` VALUES ('AUNT','F','NEPHEW/NIECE','NEPHEW','NIECE'),('BROTHER','M','SIBLING','BROTHER','SISTER'),('COUSIN',NULL,'COUSIN','COUSIN','COUSIN'),('DAUGHTER','F','PARENT','FATHER','MOTHER'),('FATHER','M','CHILD','SON','DAUGHTER'),('GRANDDAUGHTER','F','GRANDPARENT','GRANDFATHER','GRANDMOTHER'),('GRANDSON','M','GRANDPARENT','GRANDFATHER','GRANDMOTHER'),('HUSBAND','M','SPOUSE','SPOUSE','WIFE'),('MOTHER','F','CHILD','SON','DAUGHTER'),('NEPHEW','M','UNCLE/AUNT','UNCLE','AUNT'),('NIECE','F','UNCLE/AUNT','UNCLE','AUNT'),('SISTER','F','SIBLING','BROTHER','SISTER'),('SON','M','PARENT','FATHER','MOTHER'),('SPOUSE',NULL,'SPOUSE','HUSBAND','WIFE'),('UNCLE','M','NEPHEW/NIECE','NEPHEW','NIECE'),('WIFE','F','SPOUSE','HUSBAND','SPOUSE');
/*!40000 ALTER TABLE `entity_relation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitycontact`
--

DROP TABLE IF EXISTS `entitycontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitycontact` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `contacttype` varchar(25) NOT NULL,
  `contact` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_entityid` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitycontact`
--

LOCK TABLES `entitycontact` WRITE;
/*!40000 ALTER TABLE `entitycontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitycontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityid`
--

DROP TABLE IF EXISTS `entityid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityid` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `idtype` varchar(50) NOT NULL,
  `idno` varchar(25) NOT NULL,
  `dtissued` date DEFAULT NULL,
  `dtexpiry` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_idtype_idno` (`entityid`,`idtype`,`idno`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  KEY `ix_entityid` (`entityid`),
  KEY `ix_idno` (`idno`),
  KEY `ix_idtype` (`idtype`),
  CONSTRAINT `fk_entityid_entityid` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityid`
--

LOCK TABLES `entityid` WRITE;
/*!40000 ALTER TABLE `entityid` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityindividual`
--

DROP TABLE IF EXISTS `entityindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityindividual` (
  `objid` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplace` varchar(160) DEFAULT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civilstatus` varchar(15) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `tin` varchar(50) DEFAULT NULL,
  `sss` varchar(25) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `acr` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `photo` mediumblob,
  `thumbnail` blob,
  `profileid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_fname` (`firstname`),
  KEY `ix_lastname` (`lastname`),
  KEY `ix_lfname` (`lastname`,`firstname`),
  KEY `ix_profileid` (`profileid`),
  KEY `ix_ss` (`sss`),
  KEY `ix_tin` (`tin`),
  CONSTRAINT `fk_entityindividual_objid` FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `entityindividual_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityindividual`
--

LOCK TABLES `entityindividual` WRITE;
/*!40000 ALTER TABLE `entityindividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityindividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityjuridical`
--

DROP TABLE IF EXISTS `entityjuridical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityjuridical` (
  `objid` varchar(50) NOT NULL,
  `tin` varchar(50) DEFAULT NULL,
  `dtregistered` datetime DEFAULT NULL,
  `orgtype` varchar(25) DEFAULT NULL,
  `nature` varchar(50) DEFAULT NULL,
  `placeregistered` varchar(100) DEFAULT NULL,
  `administrator_name` varchar(100) DEFAULT NULL,
  `administrator_address` varchar(255) DEFAULT NULL,
  `administrator_position` varchar(50) DEFAULT NULL,
  `administrator_objid` varchar(50) DEFAULT NULL,
  `administrator_address_objid` varchar(50) DEFAULT NULL,
  `administrator_address_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_administrator_address_objid` (`administrator_address_objid`),
  KEY `ix_administrator_name` (`administrator_name`),
  KEY `ix_administrator_objid` (`administrator_objid`),
  KEY `ix_dtregistered` (`dtregistered`),
  KEY `ix_tin` (`tin`),
  CONSTRAINT `fk_entityjuridical_objid` FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityjuridical`
--

LOCK TABLES `entityjuridical` WRITE;
/*!40000 ALTER TABLE `entityjuridical` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityjuridical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitymember`
--

DROP TABLE IF EXISTS `entitymember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymember` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `itemno` int(11) NOT NULL,
  `prefix` varchar(100) DEFAULT NULL,
  `member_objid` varchar(50) NOT NULL,
  `member_name` varchar(800) NOT NULL,
  `member_address_text` varchar(160) NOT NULL DEFAULT '',
  `suffix` varchar(100) DEFAULT NULL,
  `remarks` varchar(160) DEFAULT NULL,
  `member_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `entityid` (`entityid`),
  KEY `ix_member_name` (`member_name`(255)),
  KEY `ix_taxpayer_objid` (`member_objid`),
  CONSTRAINT `entitymember_ibfk_2` FOREIGN KEY (`member_objid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `entitymember_ibfk_1` FOREIGN KEY (`entityid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitymember`
--

LOCK TABLES `entitymember` WRITE;
/*!40000 ALTER TABLE `entitymember` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitymember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitymultiple`
--

DROP TABLE IF EXISTS `entitymultiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymultiple` (
  `objid` varchar(50) NOT NULL,
  `fullname` longtext,
  PRIMARY KEY (`objid`),
  CONSTRAINT `entitymultiple_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitymultiple`
--

LOCK TABLES `entitymultiple` WRITE;
/*!40000 ALTER TABLE `entitymultiple` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitymultiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityprofile`
--

DROP TABLE IF EXISTS `entityprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityprofile` (
  `objid` varchar(50) NOT NULL,
  `idno` varchar(50) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `middlename` varchar(60) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` longtext,
  `defaultentityid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_defaultentityid` (`defaultentityid`),
  KEY `ix_firstname` (`firstname`),
  KEY `ix_idno` (`idno`),
  KEY `ix_lastname` (`lastname`),
  KEY `ix_lfname` (`lastname`,`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityprofile`
--

LOCK TABLES `entityprofile` WRITE;
/*!40000 ALTER TABLE `entityprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `special` int(11) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `groupid` varchar(50) DEFAULT NULL,
  `depositoryfundid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_code` (`code`),
  KEY `ix_depositoryfundid` (`depositoryfundid`),
  KEY `ix_groupid` (`groupid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_title` (`title`),
  CONSTRAINT `fk_fund_groupid` FOREIGN KEY (`groupid`) REFERENCES `fundgroup` (`objid`),
  CONSTRAINT `fk_fund_depositoryfundid` FOREIGN KEY (`depositoryfundid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
INSERT INTO `fund` VALUES ('GENERAL',NULL,'ACTIVE','01','GENERAL PROPER',NULL,0,1,'GENERAL','GENERAL'),('SEF',NULL,'ACTIVE','02','SEF PROPER',NULL,0,1,'SEF','SEF'),('TRUST',NULL,'ACTIVE','03','TRUST PROPER',NULL,0,1,'TRUST','TRUST');
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundgroup`
--

DROP TABLE IF EXISTS `fundgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fundgroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `indexno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundgroup`
--

LOCK TABLES `fundgroup` WRITE;
/*!40000 ALTER TABLE `fundgroup` DISABLE KEYS */;
INSERT INTO `fundgroup` VALUES ('GENERAL','GENERAL',0),('SEF','SEF',1),('TRUST','TRUST',2);
/*!40000 ALTER TABLE `fundgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `government_property`
--

DROP TABLE IF EXISTS `government_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `government_property` (
  `objid` varchar(50) NOT NULL,
  `bldgno` varchar(50) DEFAULT NULL,
  `bldgname` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `subdivision` varchar(100) DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(100) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_barangay_name` (`barangay_name`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_bldgname` (`bldgname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `government_property`
--

LOCK TABLES `government_property` WRITE;
/*!40000 ALTER TABLE `government_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `government_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `dow` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_ledger`
--

DROP TABLE IF EXISTS `income_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) NOT NULL,
  `cr` decimal(16,4) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_income_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`),
  CONSTRAINT `fk_income_ledger_itemacctid` FOREIGN KEY (`itemacctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_ledger`
--

LOCK TABLES `income_ledger` WRITE;
/*!40000 ALTER TABLE `income_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `income_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_summary`
--

DROP TABLE IF EXISTS `income_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_summary` (
  `refid` varchar(50) NOT NULL,
  `refdate` date NOT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) NOT NULL,
  `fundid` varchar(50) NOT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `orgid` varchar(50) NOT NULL,
  `collectorid` varchar(50) DEFAULT NULL,
  `refyear` int(11) DEFAULT NULL,
  `refmonth` int(11) DEFAULT NULL,
  `refqtr` int(11) DEFAULT NULL,
  `remittanceid` varchar(50) NOT NULL DEFAULT '',
  `remittancedate` date DEFAULT NULL,
  `remittanceyear` int(11) DEFAULT NULL,
  `remittancemonth` int(11) DEFAULT NULL,
  `remittanceqtr` int(11) DEFAULT NULL,
  `liquidationid` varchar(50) NOT NULL DEFAULT '',
  `liquidationdate` date DEFAULT NULL,
  `liquidationyear` int(11) DEFAULT NULL,
  `liquidationmonth` int(11) DEFAULT NULL,
  `liquidationqtr` int(11) DEFAULT NULL,
  PRIMARY KEY (`acctid`,`fundid`,`liquidationid`,`orgid`,`refdate`,`refid`,`remittanceid`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_collectorid` (`collectorid`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_liquidationdate` (`liquidationdate`),
  KEY `ix_liquidationid` (`liquidationid`),
  KEY `ix_liquidationmonth` (`liquidationmonth`),
  KEY `ix_liquidationqtr` (`liquidationqtr`),
  KEY `ix_liquidationyear` (`liquidationyear`),
  KEY `ix_orgid` (`orgid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refmonth` (`refmonth`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refqtr` (`refqtr`),
  KEY `ix_refyear` (`refyear`),
  KEY `ix_remittancedate` (`remittancedate`),
  KEY `ix_remittanceid` (`remittanceid`),
  KEY `ix_remittancemonth` (`remittancemonth`),
  KEY `ix_remittanceqtr` (`remittanceqtr`),
  KEY `ix_remittanceyear` (`remittanceyear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_summary`
--

LOCK TABLES `income_summary` WRITE;
/*!40000 ALTER TABLE `income_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `income_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfund_transfer_ledger`
--

DROP TABLE IF EXISTS `interfund_transfer_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfund_transfer_ledger` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `itemacctid` varchar(50) DEFAULT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  CONSTRAINT `fk_interfund_transfer_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfund_transfer_ledger`
--

LOCK TABLES `interfund_transfer_ledger` WRITE;
/*!40000 ALTER TABLE `interfund_transfer_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `interfund_transfer_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemaccount`
--

DROP TABLE IF EXISTS `itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `fund_objid` varchar(100) DEFAULT NULL,
  `fund_code` varchar(50) DEFAULT NULL,
  `fund_title` varchar(50) DEFAULT NULL,
  `defaultvalue` decimal(16,2) DEFAULT NULL,
  `valuetype` varchar(10) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `system` smallint(6) DEFAULT NULL,
  `generic` int(11) DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `hidefromlookup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `fund_objid` (`fund_objid`),
  KEY `ix_code` (`code`),
  KEY `ix_generic` (`generic`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_state` (`state`),
  KEY `ix_title` (`title`),
  KEY `ix_type` (`type`),
  KEY `org_objid` (`org_objid`),
  CONSTRAINT `itemaccount_ibfk_2` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `fk_itemaccount_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemaccount`
--

LOCK TABLES `itemaccount` WRITE;
/*!40000 ALTER TABLE `itemaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemaccount_tag`
--

DROP TABLE IF EXISTS `itemaccount_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount_tag` (
  `acctid` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`acctid`,`tag`),
  KEY `ix_objid` (`objid`),
  CONSTRAINT `itemaccount_tag_itemaccount` FOREIGN KEY (`acctid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemaccount_tag`
--

LOCK TABLES `itemaccount_tag` WRITE;
/*!40000 ALTER TABLE `itemaccount_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemaccount_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jev`
--

DROP TABLE IF EXISTS `jev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jev` (
  `objid` varchar(150) NOT NULL,
  `jevno` varchar(50) DEFAULT NULL,
  `jevdate` date DEFAULT NULL,
  `fundid` varchar(50) DEFAULT NULL,
  `dtposted` datetime DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `postedby_objid` varchar(50) DEFAULT NULL,
  `postedby_name` varchar(255) DEFAULT NULL,
  `verifiedby_objid` varchar(50) DEFAULT NULL,
  `verifiedby_name` varchar(255) DEFAULT NULL,
  `dtverified` datetime DEFAULT NULL,
  `batchid` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_batchid` (`batchid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_dtverified` (`dtverified`),
  KEY `ix_fundid` (`fundid`),
  KEY `ix_jevdate` (`jevdate`),
  KEY `ix_jevno` (`jevno`),
  KEY `ix_postedby_objid` (`postedby_objid`),
  KEY `ix_refdate` (`refdate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_reftype` (`reftype`),
  KEY `ix_verifiedby_objid` (`verifiedby_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jev`
--

LOCK TABLES `jev` WRITE;
/*!40000 ALTER TABLE `jev` DISABLE KEYS */;
/*!40000 ALTER TABLE `jev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jevitem`
--

DROP TABLE IF EXISTS `jevitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jevitem` (
  `objid` varchar(150) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `accttype` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `acctcode` varchar(32) DEFAULT NULL,
  `acctname` varchar(255) DEFAULT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `itemrefid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctcode` (`acctcode`),
  KEY `ix_acctid` (`acctid`),
  KEY `ix_acctname` (`acctname`),
  KEY `ix_itemrefid` (`itemrefid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_ledgertype` (`accttype`),
  CONSTRAINT `fk_jevitem_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jevitem`
--

LOCK TABLES `jevitem` WRITE;
/*!40000 ALTER TABLE `jevitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `jevitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `mayor_name` varchar(100) DEFAULT NULL,
  `mayor_title` varchar(50) DEFAULT NULL,
  `mayor_office` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `assessor_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lgu_municipality_indexno` (`indexno`),
  KEY `ix_lgu_municipality_parentid` (`parentid`),
  KEY `ix_lgu_municipality_previd` (`previd`),
  CONSTRAINT `municipality_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipality`
--

LOCK TABLES `municipality` WRITE;
/*!40000 ALTER TABLE `municipality` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipality_taxaccount_mapping`
--

DROP TABLE IF EXISTS `municipality_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality_taxaccount_mapping` (
  `lguid` varchar(50) NOT NULL,
  `basicadvacct_objid` varchar(50) DEFAULT NULL,
  `basicprevacct_objid` varchar(50) DEFAULT NULL,
  `basicprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicprioracct_objid` varchar(50) DEFAULT NULL,
  `basicpriorintacct_objid` varchar(50) DEFAULT NULL,
  `basiccurracct_objid` varchar(50) DEFAULT NULL,
  `basiccurrintacct_objid` varchar(50) DEFAULT NULL,
  `sefadvacct_objid` varchar(50) DEFAULT NULL,
  `sefprevacct_objid` varchar(50) DEFAULT NULL,
  `sefprevintacct_objid` varchar(50) DEFAULT NULL,
  `sefprioracct_objid` varchar(50) DEFAULT NULL,
  `sefpriorintacct_objid` varchar(50) DEFAULT NULL,
  `sefcurracct_objid` varchar(50) DEFAULT NULL,
  `sefcurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurracct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleadvacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipality_taxaccount_mapping`
--

LOCK TABLES `municipality_taxaccount_mapping` WRITE;
/*!40000 ALTER TABLE `municipality_taxaccount_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipality_taxaccount_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngas_revenue_mapping`
--

DROP TABLE IF EXISTS `ngas_revenue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngas_revenue_mapping` (
  `objid` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `revenueitemid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_revenueitem_ngasacctid` (`version`,`revenueitemid`,`acctid`),
  KEY `fk_revenue_mapping_ngasaccount` (`acctid`),
  KEY `fk_revenue_mapping_revenueitemid` (`revenueitemid`),
  CONSTRAINT `fk_revenue_mapping_revenueitemid` FOREIGN KEY (`revenueitemid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_ngas_revenue_mapping_acctid` FOREIGN KEY (`acctid`) REFERENCES `ngasaccount` (`objid`),
  CONSTRAINT `fk_ngas_revenue_mapping_revenueitemid` FOREIGN KEY (`revenueitemid`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `fk_revenue_mapping_ngasaccount` FOREIGN KEY (`acctid`) REFERENCES `ngasaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngas_revenue_mapping`
--

LOCK TABLES `ngas_revenue_mapping` WRITE;
/*!40000 ALTER TABLE `ngas_revenue_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngas_revenue_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngasaccount`
--

DROP TABLE IF EXISTS `ngasaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngasaccount` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `chartid` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `acctgroup` varchar(50) DEFAULT NULL,
  `target` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngasaccount`
--

LOCK TABLES `ngasaccount` WRITE;
/*!40000 ALTER TABLE `ngasaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngasaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payable_ledger`
--

DROP TABLE IF EXISTS `payable_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_ledger` (
  `objid` varchar(50) NOT NULL,
  `jevid` varchar(150) DEFAULT NULL,
  `refitemacctid` varchar(50) DEFAULT NULL,
  `itemacctid` varchar(50) NOT NULL,
  `dr` decimal(16,4) DEFAULT NULL,
  `cr` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_itemacctid` (`itemacctid`),
  KEY `ix_jevid` (`jevid`),
  KEY `ix_refitemacctid` (`refitemacctid`),
  CONSTRAINT `fk_payable_ledger_jevid` FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payable_ledger`
--

LOCK TABLES `payable_ledger` WRITE;
/*!40000 ALTER TABLE `payable_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `payable_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentorder`
--

DROP TABLE IF EXISTS `paymentorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(150) DEFAULT NULL,
  `particulars` text,
  `amount` decimal(16,2) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `info` text,
  `locationid` varchar(50) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `items` text,
  `queueid` varchar(50) DEFAULT NULL,
  `paymentordertype_objid` varchar(50) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_issuedby_name` (`issuedby_name`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_locationid` (`locationid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_paymentordertype_objid` (`paymentordertype_objid`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `fk_paymentorder_paymentordertype_objid` FOREIGN KEY (`paymentordertype_objid`) REFERENCES `paymentorder_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentorder`
--

LOCK TABLES `paymentorder` WRITE;
/*!40000 ALTER TABLE `paymentorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentorder_paid`
--

DROP TABLE IF EXISTS `paymentorder_paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder_paid` (
  `objid` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `payer_objid` varchar(50) DEFAULT NULL,
  `payer_name` text,
  `paidby` text,
  `paidbyaddress` varchar(150) DEFAULT NULL,
  `particulars` text,
  `amount` decimal(16,2) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `info` text,
  `locationid` varchar(50) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(150) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(255) DEFAULT NULL,
  `items` text,
  `paymentordertype_objid` varchar(50) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_issuedby_name` (`issuedby_name`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_locationid` (`locationid`),
  KEY `ix_org_name` (`org_name`),
  KEY `ix_org_objid` (`org_objid`),
  KEY `ix_paymentordertype_objid` (`paymentordertype_objid`),
  KEY `ix_txndate` (`txndate`),
  CONSTRAINT `fk_paymentorder_paid_paymentordertype_objid` FOREIGN KEY (`paymentordertype_objid`) REFERENCES `paymentorder_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentorder_paid`
--

LOCK TABLES `paymentorder_paid` WRITE;
/*!40000 ALTER TABLE `paymentorder_paid` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentorder_paid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentorder_type`
--

DROP TABLE IF EXISTS `paymentorder_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentorder_type` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `collectiontype_objid` varchar(50) DEFAULT NULL,
  `queuesection` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_paymentorder_type_collectiontype` (`collectiontype_objid`),
  CONSTRAINT `paymentorder_type_ibfk_1` FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentorder_type`
--

LOCK TABLES `paymentorder_type` WRITE;
/*!40000 ALTER TABLE `paymentorder_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentorder_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profession` (
  `objid` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `indexno` varchar(15) DEFAULT NULL,
  `pin` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `previd` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `governor_name` varchar(100) DEFAULT NULL,
  `governor_title` varchar(50) DEFAULT NULL,
  `governor_office` varchar(50) DEFAULT NULL,
  `assessor_name` varchar(100) DEFAULT NULL,
  `assessor_title` varchar(50) DEFAULT NULL,
  `assessor_office` varchar(50) DEFAULT NULL,
  `treasurer_name` varchar(100) DEFAULT NULL,
  `treasurer_title` varchar(50) DEFAULT NULL,
  `treasurer_office` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lgu_province_indexno` (`indexno`),
  KEY `ix_lgu_province_parentid` (`parentid`),
  KEY `ix_lgu_province_previd` (`previd`),
  CONSTRAINT `province_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_taxaccount_mapping`
--

DROP TABLE IF EXISTS `province_taxaccount_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_taxaccount_mapping` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `basicadvacct_objid` varchar(50) DEFAULT NULL,
  `basicprevacct_objid` varchar(50) DEFAULT NULL,
  `basicprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicprioracct_objid` varchar(50) DEFAULT NULL,
  `basicpriorintacct_objid` varchar(50) DEFAULT NULL,
  `basiccurracct_objid` varchar(50) DEFAULT NULL,
  `basiccurrintacct_objid` varchar(50) DEFAULT NULL,
  `sefadvacct_objid` varchar(50) DEFAULT NULL,
  `sefprevacct_objid` varchar(50) DEFAULT NULL,
  `sefprevintacct_objid` varchar(50) DEFAULT NULL,
  `sefprioracct_objid` varchar(50) DEFAULT NULL,
  `sefpriorintacct_objid` varchar(50) DEFAULT NULL,
  `sefcurracct_objid` varchar(50) DEFAULT NULL,
  `sefcurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurracct_objid` varchar(50) DEFAULT NULL,
  `basicidlecurrintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevacct_objid` varchar(50) DEFAULT NULL,
  `basicidleprevintacct_objid` varchar(50) DEFAULT NULL,
  `basicidleadvacct_objid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_taxaccount_mapping`
--

LOCK TABLES `province_taxaccount_mapping` WRITE;
/*!40000 ALTER TABLE `province_taxaccount_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `province_taxaccount_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religion` (
  `objid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religion`
--

LOCK TABLES `religion` WRITE;
/*!40000 ALTER TABLE `religion` DISABLE KEYS */;
/*!40000 ALTER TABLE `religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remittance`
--

DROP TABLE IF EXISTS `remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `controlno` varchar(100) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(50) NOT NULL,
  `liquidatingofficer_objid` varchar(50) DEFAULT NULL,
  `liquidatingofficer_name` varchar(100) DEFAULT NULL,
  `liquidatingofficer_title` varchar(50) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(18,2) NOT NULL,
  `totalcheck` decimal(16,2) NOT NULL,
  `cashbreakdown` text NOT NULL,
  `controldate` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `totalcr` decimal(16,2) NOT NULL,
  `collector_signature` longtext,
  `liquidatingofficer_signature` longtext,
  `collectionvoucherid` varchar(50) DEFAULT NULL,
  `_ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_controlno` (`controlno`,`_ukey`),
  KEY `collector_objid` (`collector_objid`),
  KEY `ix_collectionvoucherid` (`collectionvoucherid`),
  KEY `ix_controldate` (`controldate`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_remittance_state` (`state`),
  KEY `liquidatingofficer_objid` (`liquidatingofficer_objid`),
  CONSTRAINT `remittance_ibfk_2` FOREIGN KEY (`liquidatingofficer_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `fk_remittance_collectionvoucherid` FOREIGN KEY (`collectionvoucherid`) REFERENCES `collectionvoucher` (`objid`),
  CONSTRAINT `remittance_ibfk_1` FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remittance`
--

LOCK TABLES `remittance` WRITE;
/*!40000 ALTER TABLE `remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remittance_af`
--

DROP TABLE IF EXISTS `remittance_af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance_af` (
  `objid` varchar(150) NOT NULL,
  `remittanceid` varchar(50) DEFAULT NULL,
  `controlid` varchar(50) DEFAULT NULL,
  `receivedstartseries` int(11) DEFAULT NULL,
  `receivedendseries` int(11) DEFAULT NULL,
  `beginstartseries` int(11) DEFAULT NULL,
  `beginendseries` int(11) DEFAULT NULL,
  `issuedstartseries` int(11) DEFAULT NULL,
  `issuedendseries` int(11) DEFAULT NULL,
  `endingstartseries` int(11) DEFAULT NULL,
  `endingendseries` int(11) DEFAULT NULL,
  `qtyreceived` int(11) DEFAULT NULL,
  `qtybegin` int(11) DEFAULT NULL,
  `qtyissued` int(11) DEFAULT NULL,
  `qtyending` int(11) DEFAULT NULL,
  `qtycancelled` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_remittance_afserial_remittance` (`remittanceid`),
  KEY `ix_controlid` (`controlid`),
  CONSTRAINT `remittance_af_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remittance_af`
--

LOCK TABLES `remittance_af` WRITE;
/*!40000 ALTER TABLE `remittance_af` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_af` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remittance_fund`
--

DROP TABLE IF EXISTS `remittance_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remittance_fund` (
  `objid` varchar(150) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  `fund_objid` varchar(100) NOT NULL,
  `fund_title` varchar(255) NOT NULL,
  `amount` decimal(16,4) NOT NULL,
  `totalcash` decimal(16,4) NOT NULL,
  `totalcheck` decimal(16,4) NOT NULL,
  `totalcr` decimal(16,4) NOT NULL,
  `cashbreakdown` longtext,
  `controlno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_remittance_fund` (`remittanceid`,`fund_objid`),
  KEY `fund_objid` (`fund_objid`),
  KEY `remittanceid` (`remittanceid`),
  CONSTRAINT `remittance_fund_ibfk_2` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `fk_remittance_fund_fund_objid` FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`),
  CONSTRAINT `remittance_fund_ibfk_1` FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remittance_fund`
--

LOCK TABLES `remittance_fund` WRITE;
/*!40000 ALTER TABLE `remittance_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `remittance_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remote_mapping`
--

DROP TABLE IF EXISTS `remote_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remote_mapping` (
  `objid` varchar(50) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `remote_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(255) NOT NULL,
  `createdby_title` varchar(100) DEFAULT NULL,
  `dtcreated` datetime NOT NULL,
  `orgcode` varchar(10) DEFAULT NULL,
  `remote_orgcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_doctype` (`doctype`),
  KEY `ix_orgcode` (`orgcode`),
  KEY `ix_remote_objid` (`remote_objid`),
  KEY `ix_remote_orgcode` (`remote_orgcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_mapping`
--

LOCK TABLES `remote_mapping` WRITE;
/*!40000 ALTER TABLE `remote_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `remote_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remoteserverdata`
--

DROP TABLE IF EXISTS `remoteserverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remoteserverdata` (
  `objid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remoteserverdata`
--

LOCK TABLES `remoteserverdata` WRITE;
/*!40000 ALTER TABLE `remoteserverdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `remoteserverdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signatory`
--

DROP TABLE IF EXISTS `signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signatory` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `indexno` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `personnelid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_signatory_doctype` (`doctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signatory`
--

LOCK TABLES `signatory` WRITE;
/*!40000 ALTER TABLE `signatory` DISABLE KEYS */;
/*!40000 ALTER TABLE `signatory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sre_revenue_mapping`
--

DROP TABLE IF EXISTS `sre_revenue_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sre_revenue_mapping` (
  `objid` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `revenueitemid` varchar(50) NOT NULL,
  `acctid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sre_revenue_mapping`
--

LOCK TABLES `sre_revenue_mapping` WRITE;
/*!40000 ALTER TABLE `sre_revenue_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `sre_revenue_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sreaccount`
--

DROP TABLE IF EXISTS `sreaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreaccount` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `chartid` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `acctgroup` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sreaccount`
--

LOCK TABLES `sreaccount` WRITE;
/*!40000 ALTER TABLE `sreaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `sreaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sreaccount_incometarget`
--

DROP TABLE IF EXISTS `sreaccount_incometarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sreaccount_incometarget` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `target` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`objid`,`year`),
  CONSTRAINT `sreaccount_incometarget_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sreaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sreaccount_incometarget`
--

LOCK TABLES `sreaccount_incometarget` WRITE;
/*!40000 ALTER TABLE `sreaccount_incometarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `sreaccount_incometarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcollector_remittance`
--

DROP TABLE IF EXISTS `subcollector_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollector_remittance` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `dtposted` datetime NOT NULL,
  `collector_objid` varchar(50) NOT NULL,
  `collector_name` varchar(100) NOT NULL,
  `collector_title` varchar(30) NOT NULL,
  `subcollector_objid` varchar(50) NOT NULL,
  `subcollector_name` varchar(100) NOT NULL,
  `subcollector_title` varchar(50) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `totalcash` decimal(12,2) DEFAULT NULL,
  `totalnoncash` decimal(12,2) DEFAULT NULL,
  `cashbreakdown` text,
  `collectionsummaries` longtext,
  PRIMARY KEY (`objid`),
  KEY `ix_collector_objid` (`collector_objid`),
  KEY `ix_dtposted` (`dtposted`),
  KEY `ix_state` (`state`),
  KEY `ix_subcollector_objid` (`subcollector_objid`),
  KEY `ix_txnno` (`txnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcollector_remittance`
--

LOCK TABLES `subcollector_remittance` WRITE;
/*!40000 ALTER TABLE `subcollector_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollector_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcollector_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `subcollector_remittance_cashreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcollector_remittance_cashreceipt` (
  `objid` varchar(50) NOT NULL,
  `remittanceid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_subcollector_remittance_cashreceipt_remittance` (`remittanceid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_2` FOREIGN KEY (`remittanceid`) REFERENCES `subcollector_remittance` (`objid`),
  CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcollector_remittance_cashreceipt`
--

LOCK TABLES `subcollector_remittance_cashreceipt` WRITE;
/*!40000 ALTER TABLE `subcollector_remittance_cashreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcollector_remittance_cashreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dataset`
--

DROP TABLE IF EXISTS `sys_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dataset` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `input` longtext,
  `output` longtext,
  `statement` varchar(50) DEFAULT NULL,
  `datasource` varchar(50) DEFAULT NULL,
  `servicename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dataset`
--

LOCK TABLES `sys_dataset` WRITE;
/*!40000 ALTER TABLE `sys_dataset` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_domain`
--

DROP TABLE IF EXISTS `sys_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_domain` (
  `name` varchar(50) NOT NULL,
  `connection` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_domain`
--

LOCK TABLES `sys_domain` WRITE;
/*!40000 ALTER TABLE `sys_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email_queue`
--

DROP TABLE IF EXISTS `sys_email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_queue` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `state` int(11) NOT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `dtsent` datetime NOT NULL,
  `to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `errmsg` longtext,
  `connection` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_dtsent` (`dtsent`),
  KEY `ix_refid` (`refid`),
  KEY `ix_reportid` (`reportid`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_queue`
--

LOCK TABLES `sys_email_queue` WRITE;
/*!40000 ALTER TABLE `sys_email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_org`
--

DROP TABLE IF EXISTS `sys_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_org` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `parent_objid` varchar(50) DEFAULT NULL,
  `parent_orgclass` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `root` int(11) NOT NULL DEFAULT '0',
  `txncode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_org` (`parent_orgclass`),
  KEY `FK_sys_org_orgclass` (`orgclass`),
  KEY `parent_objid` (`parent_objid`),
  CONSTRAINT `sys_org_ibfk_3` FOREIGN KEY (`parent_objid`) REFERENCES `sys_org` (`objid`),
  CONSTRAINT `sys_org_ibfk_1` FOREIGN KEY (`parent_orgclass`) REFERENCES `sys_orgclass` (`name`),
  CONSTRAINT `sys_org_ibfk_2` FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_org`
--

LOCK TABLES `sys_org` WRITE;
/*!40000 ALTER TABLE `sys_org` DISABLE KEYS */;
INSERT INTO `sys_org` VALUES ('ROOT','ROOT','ROOT',NULL,NULL,'ROOT',1,'ROOT');
/*!40000 ALTER TABLE `sys_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_orgclass`
--

DROP TABLE IF EXISTS `sys_orgclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_orgclass` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parentclass` varchar(255) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_orgclass`
--

LOCK TABLES `sys_orgclass` WRITE;
/*!40000 ALTER TABLE `sys_orgclass` DISABLE KEYS */;
INSERT INTO `sys_orgclass` VALUES ('ROOT','ROOT',NULL,NULL);
/*!40000 ALTER TABLE `sys_orgclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_quarter`
--

DROP TABLE IF EXISTS `sys_quarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_quarter` (
  `qtrid` int(11) NOT NULL,
  PRIMARY KEY (`qtrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_quarter`
--

LOCK TABLES `sys_quarter` WRITE;
/*!40000 ALTER TABLE `sys_quarter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_quarter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report`
--

DROP TABLE IF EXISTS `sys_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report` (
  `objid` varchar(50) NOT NULL,
  `folderid` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `filetype` varchar(25) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `datasetid` varchar(50) DEFAULT NULL,
  `template` mediumtext,
  `outputtype` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_dataset` (`datasetid`),
  KEY `FK_sys_report_entry_folder` (`folderid`),
  CONSTRAINT `fk_sys_report_datasetid` FOREIGN KEY (`datasetid`) REFERENCES `sys_dataset` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report`
--

LOCK TABLES `sys_report` WRITE;
/*!40000 ALTER TABLE `sys_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_admin`
--

DROP TABLE IF EXISTS `sys_report_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_admin` (
  `objid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `reportfolderid` varchar(50) DEFAULT NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_admin_folder` (`reportfolderid`),
  KEY `FK_sys_report_admin_user` (`userid`),
  CONSTRAINT `sys_report_admin_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_report_admin_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_admin`
--

LOCK TABLES `sys_report_admin` WRITE;
/*!40000 ALTER TABLE `sys_report_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_folder`
--

DROP TABLE IF EXISTS `sys_report_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_folder` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_folder`
--

LOCK TABLES `sys_report_folder` WRITE;
/*!40000 ALTER TABLE `sys_report_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_member`
--

DROP TABLE IF EXISTS `sys_report_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_member` (
  `objid` varchar(50) NOT NULL,
  `reportfolderid` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `usergroupid` varchar(50) DEFAULT NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_report_member_folder` (`reportfolderid`),
  KEY `FK_sys_report_member_user` (`userid`),
  KEY `FK_sys_report_member_usergroup` (`usergroupid`),
  CONSTRAINT `sys_report_member_ibfk_3` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_1` FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`),
  CONSTRAINT `sys_report_member_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_member`
--

LOCK TABLES `sys_report_member` WRITE;
/*!40000 ALTER TABLE `sys_report_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_requirement_type`
--

DROP TABLE IF EXISTS `sys_requirement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_requirement_type` (
  `code` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `objid` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `system` int(11) DEFAULT NULL,
  `agency` varchar(50) DEFAULT NULL,
  `sortindex` int(11) NOT NULL,
  `verifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_requirement_type`
--

LOCK TABLES `sys_requirement_type` WRITE;
/*!40000 ALTER TABLE `sys_requirement_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_requirement_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT NULL,
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) NOT NULL DEFAULT '1',
  `_ukey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_ruleset_name` (`ruleset`,`name`,`_ukey`),
  KEY `rulegroup` (`rulegroup`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`),
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_actiondef_objid` (`actiondef_objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondefparam_objid` varchar(100) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_action_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddRevenueShare','add-share','Add Revenue Share',1,'add-share','TREASURY','treasury.actions.AddRevenueShare');
/*!40000 ALTER TABLE `sys_rule_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(255) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.amount','treasury.actions.AddRevenueShare','amount',4,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddRevenueShareByOrg.org','treasury.actions.AddRevenueShare','org',3,'Org',NULL,'var',NULL,NULL,NULL,'enterprise.facts.Org',NULL),('treasury.actions.AddRevenueShareByOrg.payableaccount','treasury.actions.AddRevenueShare','payableaccount',2,'Payable Account',NULL,'lookup','payableaccount:lookup','objid','title','string',NULL),('treasury.actions.AddRevenueShareByOrg.refitem','treasury.actions.AddRevenueShare','refitem',1,'Ref Item',NULL,'var','revenueitem:lookup','objid','title','treasury.facts.AbstractBillItem',NULL);
/*!40000 ALTER TABLE `sys_rule_actiondef_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`objid`),
  KEY `fact_objid` (`fact_objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_condition_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`),
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_rule_deployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
INSERT INTO `sys_rule_fact` VALUES ('com.rameses.rules.common.CurrentDate','com.rameses.rules.common.CurrentDate','Current Date','com.rameses.rules.common.CurrentDate',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SYSTEM',NULL),('enterprise.facts.DateInfo','enterprise.facts.DateInfo','Date Info','enterprise.facts.DateInfo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('enterprise.facts.Org','enterprise.facts.Org','Org','enterprise.facts.Org',1,NULL,'ORG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE',NULL),('treasury.facts.BillItem','treasury.facts.BillItem','Bill Item','treasury.facts.BillItem',1,NULL,'BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.CollectionGroup','treasury.facts.CollectionGroup','Collection Group','treasury.facts.CollectionGroup',0,NULL,'CG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.RevenueShare','treasury.facts.RevenueShare','Revenue Share','treasury.facts.RevenueShare',1,NULL,'RS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL);
/*!40000 ALTER TABLE `sys_rule_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(100) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.date','com.rameses.rules.common.CurrentDate','date','Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('com.rameses.rules.common.CurrentDate.day','com.rameses.rules.common.CurrentDate','day','Day','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.month','com.rameses.rules.common.CurrentDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.qtr','com.rameses.rules.common.CurrentDate','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.year','com.rameses.rules.common.CurrentDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.day','enterprise.facts.DateInfo','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.month','enterprise.facts.DateInfo','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.name','enterprise.facts.DateInfo','name','Name','string',5,'lookup','variableinfo_date:lookup','name','name',NULL,NULL,1,'string',NULL),('enterprise.facts.DateInfo.qtr','enterprise.facts.DateInfo','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.value','enterprise.facts.DateInfo','value','Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,1,'date',NULL),('enterprise.facts.DateInfo.year','enterprise.facts.DateInfo','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.Org.orgid','enterprise.facts.Org','orgid','Org ID','string',1,'lookup','org:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.account','treasury.facts.BillItem','account','Account','string',3,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.BillItem.account.objid','treasury.facts.BillItem','account.objid','Account ID','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.amount','treasury.facts.BillItem','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.billrefid','treasury.facts.BillItem','billrefid','Bill Ref ID','string',7,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.discount','treasury.facts.BillItem','discount','Discount','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.duedate','treasury.facts.BillItem','duedate','Due Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.fromdate','treasury.facts.BillItem','fromdate','From Date','date',14,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.interest','treasury.facts.BillItem','interest','Interest','decimal',11,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.month','treasury.facts.BillItem','month','Month','integer',13,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.org','treasury.facts.BillItem','org','Org','string',10,'var',NULL,NULL,NULL,NULL,NULL,NULL,'enterprise.facts.Org',NULL),('treasury.facts.BillItem.parentaccount','treasury.facts.BillItem','parentaccount','Parent Account','string',9,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.BillItem.paypriority','treasury.facts.BillItem','paypriority','Pay Priority','integer',18,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.refid','treasury.facts.BillItem','refid','Ref ID','string',16,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.remarks','treasury.facts.BillItem','remarks','Remarks','string',17,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.sortorder','treasury.facts.BillItem','sortorder','Sort Order','integer',19,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.surcharge','treasury.facts.BillItem','surcharge','Surcharge','decimal',5,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.tag','treasury.facts.BillItem','tag','Tag','string',20,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.todate','treasury.facts.BillItem','todate','To Date','date',15,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.txntype','treasury.facts.BillItem','txntype','Txn Type','string',6,'lookup','billitem_txntype:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.year','treasury.facts.BillItem','year','Year','integer',12,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.CollectionGroup.objid','treasury.facts.CollectionGroup','objid','Name','string',1,'lookup','collectiongroup:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('treasury.facts.RevenueShare.amount','treasury.facts.RevenueShare','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.RevenueShare.payableaccount','treasury.facts.RevenueShare','payableaccount','Payable Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.RevenueShare.refaccount','treasury.facts.RevenueShare','refaccount','Reference Account','string',1,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL);
/*!40000 ALTER TABLE `sys_rule_fact_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
INSERT INTO `sys_rulegroup` VALUES ('after-compute-share','revenuesharing','After Compute Share',1),('compute-share','revenuesharing','Compute Share',0);
/*!40000 ALTER TABLE `sys_rulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
INSERT INTO `sys_ruleset` VALUES ('revenuesharing','Revenue Sharing','revenuesharing','TREASURY','RULE_AUTHOR',NULL);
/*!40000 ALTER TABLE `sys_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`actiondef`,`ruleset`),
  KEY `actiondef` (`actiondef`),
  KEY `sys_ruleset_actiondef_ibfk_2` (`ruleset`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
INSERT INTO `sys_ruleset_actiondef` VALUES ('revenuesharing','treasury.actions.AddRevenueShare');
/*!40000 ALTER TABLE `sys_ruleset_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`rulefact`,`ruleset`),
  KEY `rulefact` (`rulefact`),
  KEY `sys_ruleset_fact_ibfk_2` (`ruleset`),
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
INSERT INTO `sys_ruleset_fact` VALUES ('revenuesharing','com.rameses.rules.common.CurrentDate'),('revenuesharing','enterprise.facts.DateInfo'),('revenuesharing','enterprise.facts.Org'),('revenuesharing','treasury.facts.BillItem'),('revenuesharing','treasury.facts.CollectionGroup'),('revenuesharing','treasury.facts.RevenueShare');
/*!40000 ALTER TABLE `sys_ruleset_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `title` longblob,
  `content` longtext,
  `category` varchar(20) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_script`
--

LOCK TABLES `sys_script` WRITE;
/*!40000 ALTER TABLE `sys_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_securitygroup`
--

DROP TABLE IF EXISTS `sys_securitygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_securitygroup` (
  `objid` varchar(100) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `usergroup_objid` varchar(50) DEFAULT NULL,
  `exclude` longtext,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_securitygroup_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_securitygroup_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_securitygroup`
--

LOCK TABLES `sys_securitygroup` WRITE;
/*!40000 ALTER TABLE `sys_securitygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_securitygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_session`
--

DROP TABLE IF EXISTS `sys_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `clienttype` varchar(12) DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL,
  `accessexpiry` datetime DEFAULT NULL,
  `timein` datetime DEFAULT NULL,
  `terminalid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_session`
--

LOCK TABLES `sys_session` WRITE;
/*!40000 ALTER TABLE `sys_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_session_log`
--

DROP TABLE IF EXISTS `sys_session_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_session_log` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `clienttype` varchar(12) DEFAULT NULL,
  `accesstime` datetime DEFAULT NULL,
  `accessexpiry` datetime DEFAULT NULL,
  `timein` datetime DEFAULT NULL,
  `timeout` datetime DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `terminalid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_timeout` (`timeout`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_session_log`
--

LOCK TABLES `sys_session_log` WRITE;
/*!40000 ALTER TABLE `sys_session_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_terminal`
--

DROP TABLE IF EXISTS `sys_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_terminal` (
  `terminalid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `parentcode` varchar(50) DEFAULT NULL,
  `parenttype` varchar(50) DEFAULT NULL,
  `macaddress` varchar(50) DEFAULT NULL,
  `dtregistered` datetime DEFAULT NULL,
  `registeredby` varchar(50) DEFAULT NULL,
  `info` longtext,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`terminalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_terminal`
--

LOCK TABLES `sys_terminal` WRITE;
/*!40000 ALTER TABLE `sys_terminal` DISABLE KEYS */;
INSERT INTO `sys_terminal` VALUES ('T001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('T002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('T003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  `pwdlogincount` int(11) DEFAULT NULL,
  `pwdexpirydate` datetime DEFAULT NULL,
  `usedpwds` longtext,
  `lockid` varchar(32) DEFAULT NULL,
  `txncode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('USR-ADMIN',NULL,NULL,NULL,'ADMIN','557a4295dcca1a044b690f8b6486f33d','ADMIN','ADMIN','.','ADMIN, ADMIN .','ADMIN',0,'2050-06-09 15:34:43','e320774659b1b23333bd033754d2ac1a',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!50001 DROP VIEW IF EXISTS `sys_user_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sys_user_role` (
  `objid` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `domain` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `txncode` tinyint NOT NULL,
  `jobtitle` tinyint NOT NULL,
  `usergroupmemberid` tinyint NOT NULL,
  `usergroup_objid` tinyint NOT NULL,
  `respcenter_objid` tinyint NOT NULL,
  `respcenter_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `userclass` varchar(25) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usergroup`
--

LOCK TABLES `sys_usergroup` WRITE;
/*!40000 ALTER TABLE `sys_usergroup` DISABLE KEYS */;
INSERT INTO `sys_usergroup` VALUES ('ADMIN.NOTIFICATION','SYSTEM ADMINISTRATOR','ADMIN','usergroup',NULL,'NOTIFICATION'),('ADMIN.SYSADMIN','SYSTEM ADMINISTRATOR','ADMIN','usergroup',NULL,'SYSADMIN');
/*!40000 ALTER TABLE `sys_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_admin`
--

DROP TABLE IF EXISTS `sys_usergroup_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_admin` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_username` varchar(50) DEFAULT NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) DEFAULT NULL,
  `exclude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_usergroup_admin` (`user_objid`),
  KEY `usergroupid` (`usergroupid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_2` FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_admin_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usergroup_admin`
--

LOCK TABLES `sys_usergroup_admin` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_member`
--

DROP TABLE IF EXISTS `sys_usergroup_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_member` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `usergroup_objid` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) NOT NULL,
  `user_username` varchar(50) DEFAULT NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `org_orgclass` varchar(50) DEFAULT NULL,
  `securitygroup_objid` varchar(50) DEFAULT NULL,
  `exclude` varchar(255) DEFAULT NULL,
  `displayname` varchar(50) DEFAULT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_usergroup_member` (`user_objid`),
  KEY `FK_sys_usergroup_member_org` (`org_objid`),
  KEY `FK_sys_usergroup_member_securitygorup` (`securitygroup_objid`),
  KEY `ix_user_firstname` (`user_firstname`),
  KEY `ix_user_lastname_firstname` (`user_lastname`,`user_firstname`),
  KEY `ix_username` (`user_username`),
  KEY `usergroup_objid` (`usergroup_objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_4` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `fk_sys_usergroup_member_securitygroup_objid` FOREIGN KEY (`securitygroup_objid`) REFERENCES `sys_securitygroup` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_1` FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`),
  CONSTRAINT `sys_usergroup_member_ibfk_2` FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usergroup_member`
--

LOCK TABLES `sys_usergroup_member` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_member` DISABLE KEYS */;
INSERT INTO `sys_usergroup_member` VALUES ('UGM-ADMIN-SYS-0001',NULL,'ADMIN.SYSADMIN','USR-ADMIN','ADMIN','ADMIN','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('UGM-ADMIN-SYS-0002',NULL,'ADMIN.NOTIFICATION','USR-ADMIN','ADMIN','ADMIN','ADMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_usergroup_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_permission`
--

DROP TABLE IF EXISTS `sys_usergroup_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup_permission` (
  `objid` varchar(100) NOT NULL,
  `usergroup_objid` varchar(50) DEFAULT NULL,
  `object` varchar(25) DEFAULT NULL,
  `permission` varchar(25) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_usergroup_permission_usergroup` (`usergroup_objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_2` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`),
  CONSTRAINT `sys_usergroup_permission_ibfk_1` FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usergroup_permission`
--

LOCK TABLES `sys_usergroup_permission` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
INSERT INTO `sys_var` VALUES ('allow_general_collection_discount','0',NULL,'checkbox','TC'),('allow_multiple_open_liquidation','1',NULL,'checkbox','TC'),('assttreasurername','-',NULL,NULL,NULL),('assttreasurertitle','-',NULL,NULL,NULL),('deposit_collection_by_bank_account','0','Deposit collection by bank account instead of by fund','checkbox','TC'),('deposit_print_date','0',NULL,NULL,'TC'),('invalid_login_access_date_interval','1m','number of hours/days access date is moved when failed_login_max_retries is reached( d=days, h=hours)',NULL,NULL),('invalid_login_action','1','0 - suspend 1-move access to a later date',NULL,NULL),('invalid_login_max_retries','5','No. of times a user can retry login before disabling account',NULL,NULL),('liquidate_remittance_as_of_date','1','Liquidate Remittance up to date','checkbox','TC'),('liquidation_report_show_accountable_forms','0','Show Accoutable Forms in RCD Liquidation Report ',NULL,'TC'),('pwd_change_cycle','1','No. of times the user cannot use a repeating password',NULL,'SYSTEM'),('pwd_change_date_interval','365M','No. of days/months before a user is required to change their password (d=days, M=months)',NULL,'SYSTEM'),('pwd_change_login_count','0','No. of times a user has successfully logged in before changing their password. (0=no limit) ',NULL,'SYSTEM'),('receipt_item_printout_count','10',NULL,NULL,'SYSTEM'),('sa_pwd','ba4d084b31b41fbe55302c0429d93c81',NULL,NULL,'SYSTEM'),('secretary_name',NULL,NULL,NULL,NULL),('secretary_title',NULL,NULL,NULL,NULL),('server_timezone','Asia/Shanghai','this must be matched with default timezone of server',NULL,NULL),('session_timeout_interval','1d ','expiry dates of inactive session (d=days, h=hours)',NULL,'SYSTEM'),('system_pwd','!1234#','system password',NULL,'SYSTEM');
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf`
--

LOCK TABLES `sys_wf` WRITE;
/*!40000 ALTER TABLE `sys_wf` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_assignee`
--

DROP TABLE IF EXISTS `sys_wf_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_assignee` (
  `objid` varchar(50) NOT NULL,
  `processname` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `expr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_assignee`
--

LOCK TABLES `sys_wf_assignee` WRITE;
/*!40000 ALTER TABLE `sys_wf_assignee` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) NOT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `properties` text,
  `ui` text,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_node`
--

LOCK TABLES `sys_wf_node` WRITE;
/*!40000 ALTER TABLE `sys_wf_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_subtask`
--

DROP TABLE IF EXISTS `sys_wf_subtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_subtask` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `taskid` varchar(50) DEFAULT NULL,
  `requester_objid` varchar(50) DEFAULT NULL,
  `requester_name` varchar(100) DEFAULT NULL,
  `requestdate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `FK_sys_wf_subtask_sys_wf_task` (`taskid`),
  CONSTRAINT `FK_sys_wf_subtask_sys_wf_task` FOREIGN KEY (`taskid`) REFERENCES `sys_wf_task` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_subtask`
--

LOCK TABLES `sys_wf_subtask` WRITE;
/*!40000 ALTER TABLE `sys_wf_subtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_subtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_task`
--

DROP TABLE IF EXISTS `sys_wf_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_task` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_task`
--

LOCK TABLES `sys_wf_task` WRITE;
/*!40000 ALTER TABLE `sys_wf_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` mediumtext,
  `properties` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` text,
  PRIMARY KEY (`action`,`parentid`,`processname`,`to`),
  KEY `FK_sys_wf_transition_wf_node` (`parentid`,`processname`),
  CONSTRAINT `FK_sys_wf_transition_wf_node` FOREIGN KEY (`parentid`, `processname`) REFERENCES `sys_wf_node` (`name`, `processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_transition`
--

LOCK TABLES `sys_wf_transition` WRITE;
/*!40000 ALTER TABLE `sys_wf_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_workitemtype`
--

DROP TABLE IF EXISTS `sys_wf_workitemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_workitemtype` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `expr` varchar(255) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`,`state`),
  KEY `FK_sys_wf_subtasktype_node` (`state`,`processname`),
  CONSTRAINT `FK_sys_wf_subtasktype_node` FOREIGN KEY (`state`, `processname`) REFERENCES `sys_wf_node` (`name`, `processname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_workitemtype`
--

LOCK TABLES `sys_wf_workitemtype` WRITE;
/*!40000 ALTER TABLE `sys_wf_workitemtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_workitemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasury_variableinfo`
--

DROP TABLE IF EXISTS `treasury_variableinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasury_variableinfo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arrayvalues` longtext,
  `system` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasury_variableinfo`
--

LOCK TABLES `treasury_variableinfo` WRITE;
/*!40000 ALTER TABLE `treasury_variableinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasury_variableinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txnlog`
--

DROP TABLE IF EXISTS `txnlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnlog` (
  `objid` varchar(50) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `refid` varchar(255) NOT NULL,
  `txndate` datetime NOT NULL,
  `action` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `remarks` text,
  `diff` longtext,
  `username` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_txnlog_action` (`action`),
  KEY `ix_txnlog_ref` (`ref`),
  KEY `ix_txnlog_userid` (`userid`),
  KEY `ix_txnlog_useridaction` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txnlog`
--

LOCK TABLES `txnlog` WRITE;
/*!40000 ALTER TABLE `txnlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `txnlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txnref`
--

DROP TABLE IF EXISTS `txnref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnref` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `ix_txnref_objid` (`objid`),
  KEY `ix_txnref_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txnref`
--

LOCK TABLES `txnref` WRITE;
/*!40000 ALTER TABLE `txnref` DISABLE KEYS */;
/*!40000 ALTER TABLE `txnref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txnsignatory`
--

DROP TABLE IF EXISTS `txnsignatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txnsignatory` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `personnelid` varchar(50) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `caption` varchar(25) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dtsigned` datetime DEFAULT NULL,
  `seqno` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_signatory_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txnsignatory`
--

LOCK TABLES `txnsignatory` WRITE;
/*!40000 ALTER TABLE `txnsignatory` DISABLE KEYS */;
/*!40000 ALTER TABLE `txnsignatory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variableinfo`
--

DROP TABLE IF EXISTS `variableinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variableinfo` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `arrayvalues` longtext,
  `system` int(11) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variableinfo`
--

LOCK TABLES `variableinfo` WRITE;
/*!40000 ALTER TABLE `variableinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `variableinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_account_income_summary`
--

DROP TABLE IF EXISTS `vw_account_income_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_account_income_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_income_summary` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `accttype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_incometarget`
--

DROP TABLE IF EXISTS `vw_account_incometarget`;
/*!50001 DROP VIEW IF EXISTS `vw_account_incometarget`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_incometarget` (
  `objid` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `target` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `item_objid` tinyint NOT NULL,
  `item_code` tinyint NOT NULL,
  `item_title` tinyint NOT NULL,
  `item_level` tinyint NOT NULL,
  `item_leftindex` tinyint NOT NULL,
  `group_objid` tinyint NOT NULL,
  `group_code` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `group_level` tinyint NOT NULL,
  `group_leftindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_item_mapping`
--

DROP TABLE IF EXISTS `vw_account_item_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_account_item_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_item_mapping` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_account_mapping`
--

DROP TABLE IF EXISTS `vw_account_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_account_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_account_mapping` (
  `objid` tinyint NOT NULL,
  `maingroupid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `leftindex` tinyint NOT NULL,
  `rightindex` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_af_control_detail`
--

DROP TABLE IF EXISTS `vw_af_control_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_af_control_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_af_control_detail` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `indexno` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `aftxnitemid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `txntype` tinyint NOT NULL,
  `receivedstartseries` tinyint NOT NULL,
  `receivedendseries` tinyint NOT NULL,
  `beginstartseries` tinyint NOT NULL,
  `beginendseries` tinyint NOT NULL,
  `issuedstartseries` tinyint NOT NULL,
  `issuedendseries` tinyint NOT NULL,
  `endingstartseries` tinyint NOT NULL,
  `endingendseries` tinyint NOT NULL,
  `qtyreceived` tinyint NOT NULL,
  `qtybegin` tinyint NOT NULL,
  `qtyissued` tinyint NOT NULL,
  `qtyending` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `issuedto_objid` tinyint NOT NULL,
  `issuedto_name` tinyint NOT NULL,
  `respcenter_objid` tinyint NOT NULL,
  `respcenter_name` tinyint NOT NULL,
  `prevdetailid` tinyint NOT NULL,
  `aftxnid` tinyint NOT NULL,
  `afid` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `saleprice` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `currentseries` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL,
  `cost` tinyint NOT NULL,
  `batchno` tinyint NOT NULL,
  `controlstate` tinyint NOT NULL,
  `qtybalance` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_af_inventory_summary`
--

DROP TABLE IF EXISTS `vw_af_inventory_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_af_inventory_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_af_inventory_summary` (
  `objid` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL,
  `countopen` tinyint NOT NULL,
  `countissued` tinyint NOT NULL,
  `countclosed` tinyint NOT NULL,
  `countsold` tinyint NOT NULL,
  `countprocessing` tinyint NOT NULL,
  `counthold` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_afunit`
--

DROP TABLE IF EXISTS `vw_afunit`;
/*!50001 DROP VIEW IF EXISTS `vw_afunit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_afunit` (
  `objid` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `usetype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `unit` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `saleprice` tinyint NOT NULL,
  `interval` tinyint NOT NULL,
  `cashreceiptprintout` tinyint NOT NULL,
  `cashreceiptdetailprintout` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt_share`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt_share` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refitemid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceipt_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceipt_share_payable` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `payableitemid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid_share`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid_share` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_cashreceiptvoid_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_cashreceiptvoid_share_payable` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittancedtposted` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance_share`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance_share`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance_share` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashbook_remittance_share_payable`
--

DROP TABLE IF EXISTS `vw_cashbook_remittance_share_payable`;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share_payable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashbook_remittance_share_payable` (
  `objid` tinyint NOT NULL,
  `txndate` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `dr` tinyint NOT NULL,
  `cr` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `sortdate` tinyint NOT NULL,
  `liquidatingofficer_objid` tinyint NOT NULL,
  `liquidatingofficer_name` tinyint NOT NULL,
  `voidid` tinyint NOT NULL,
  `voiddate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_item`
--

DROP TABLE IF EXISTS `vw_cashreceipt_item`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_item`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_item` (
  `receiptid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL,
  `amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `hidefromlookup` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount_collectiongroup`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount_collectiongroup` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectiongroupid` tinyint NOT NULL,
  `generic` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceipt_itemaccount_collectiontype`
--

DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceipt_itemaccount_collectiontype` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectiontypeid` tinyint NOT NULL,
  `hasorg` tinyint NOT NULL,
  `hidefromlookup` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceiptpayment_noncash` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `account_objid` tinyint NOT NULL,
  `account_code` tinyint NOT NULL,
  `account_name` tinyint NOT NULL,
  `account_fund_objid` tinyint NOT NULL,
  `account_fund_name` tinyint NOT NULL,
  `account_bank` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `checkid` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `void_objid` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `receipt_receiptno` tinyint NOT NULL,
  `receipt_receiptdate` tinyint NOT NULL,
  `receipt_amount` tinyint NOT NULL,
  `receipt_collector_objid` tinyint NOT NULL,
  `receipt_collector_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_objid` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreceiptpayment_noncash_liquidated`
--

DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreceiptpayment_noncash_liquidated` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `account_objid` tinyint NOT NULL,
  `account_code` tinyint NOT NULL,
  `account_name` tinyint NOT NULL,
  `account_fund_objid` tinyint NOT NULL,
  `account_fund_name` tinyint NOT NULL,
  `account_bank` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `checkid` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `void_objid` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `receipt_receiptno` tinyint NOT NULL,
  `receipt_receiptdate` tinyint NOT NULL,
  `receipt_amount` tinyint NOT NULL,
  `receipt_collector_objid` tinyint NOT NULL,
  `receipt_collector_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_objid` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectionvoucher_objid` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `collectionvoucher_controldate` tinyint NOT NULL,
  `depositvoucherid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_cashreciept`
--

DROP TABLE IF EXISTS `vw_cashreciept`;
/*!50001 DROP VIEW IF EXISTS `vw_cashreciept`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cashreciept` (
  `iyear` tinyint NOT NULL,
  `imonth` tinyint NOT NULL,
  `objid` tinyint NOT NULL,
  `txnmode` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `formno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiongroup`
--

DROP TABLE IF EXISTS `vw_collectiongroup`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiongroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiongroup` (
  `objid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `sharing` tinyint NOT NULL,
  `orgid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiontype`
--

DROP TABLE IF EXISTS `vw_collectiontype`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiontype` (
  `objid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `handler` tinyint NOT NULL,
  `allowbatch` tinyint NOT NULL,
  `barcodekey` tinyint NOT NULL,
  `allowonline` tinyint NOT NULL,
  `allowoffline` tinyint NOT NULL,
  `sortorder` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `queuesection` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `af_formtype` tinyint NOT NULL,
  `af_serieslength` tinyint NOT NULL,
  `af_denomination` tinyint NOT NULL,
  `af_baseunit` tinyint NOT NULL,
  `allowpaymentorder` tinyint NOT NULL,
  `allowkiosk` tinyint NOT NULL,
  `allowcreditmemo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectiontype_account`
--

DROP TABLE IF EXISTS `vw_collectiontype_account`;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectiontype_account` (
  `objid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `fund_objid` tinyint NOT NULL,
  `fund_code` tinyint NOT NULL,
  `fund_title` tinyint NOT NULL,
  `collectiontypeid` tinyint NOT NULL,
  `tag` tinyint NOT NULL,
  `valuetype` tinyint NOT NULL,
  `defaultvalue` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectionvoucher_cashreceiptitem`
--

DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptitem`;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectionvoucher_cashreceiptitem` (
  `collectionvoucher_controldate` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_collectionvoucher_cashreceiptshare`
--

DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptshare`;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_collectionvoucher_cashreceiptshare` (
  `collectionvoucher_controldate` tinyint NOT NULL,
  `collectionvoucher_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `refacctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_deposit_fund_transfer`
--

DROP TABLE IF EXISTS `vw_deposit_fund_transfer`;
/*!50001 DROP VIEW IF EXISTS `vw_deposit_fund_transfer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_deposit_fund_transfer` (
  `objid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `todepositvoucherfundid` tinyint NOT NULL,
  `todepositvoucherfund_fund_objid` tinyint NOT NULL,
  `todepositvoucherfund_fund_code` tinyint NOT NULL,
  `todepositvoucherfund_fund_title` tinyint NOT NULL,
  `fromdepositvoucherfundid` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_objid` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_code` tinyint NOT NULL,
  `fromdepositvoucherfund_fund_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entity_mapping`
--

DROP TABLE IF EXISTS `vw_entity_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_entity_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entity_mapping` (
  `objid` tinyint NOT NULL,
  `parent_objid` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `address_text` tinyint NOT NULL,
  `address_province` tinyint NOT NULL,
  `address_municipality` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entity_relation`
--

DROP TABLE IF EXISTS `vw_entity_relation`;
/*!50001 DROP VIEW IF EXISTS `vw_entity_relation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entity_relation` (
  `objid` tinyint NOT NULL,
  `ownerid` tinyint NOT NULL,
  `entityid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `relationship` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityindividual`
--

DROP TABLE IF EXISTS `vw_entityindividual`;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityindividual` (
  `objid` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `birthplace` tinyint NOT NULL,
  `citizenship` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `civilstatus` tinyint NOT NULL,
  `profession` tinyint NOT NULL,
  `tin` tinyint NOT NULL,
  `sss` tinyint NOT NULL,
  `height` tinyint NOT NULL,
  `weight` tinyint NOT NULL,
  `acr` tinyint NOT NULL,
  `religion` tinyint NOT NULL,
  `photo` tinyint NOT NULL,
  `thumbnail` tinyint NOT NULL,
  `profileid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `entityname` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL,
  `address_objid` tinyint NOT NULL,
  `address_text` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityindividual_lookup`
--

DROP TABLE IF EXISTS `vw_entityindividual_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityindividual_lookup` (
  `objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_entityrelation_lookup`
--

DROP TABLE IF EXISTS `vw_entityrelation_lookup`;
/*!50001 DROP VIEW IF EXISTS `vw_entityrelation_lookup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_entityrelation_lookup` (
  `objid` tinyint NOT NULL,
  `entity_objid` tinyint NOT NULL,
  `relateto_objid` tinyint NOT NULL,
  `relation_objid` tinyint NOT NULL,
  `entityno` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `middlename` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `birthdate` tinyint NOT NULL,
  `mobileno` tinyint NOT NULL,
  `phoneno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_fund`
--

DROP TABLE IF EXISTS `vw_fund`;
/*!50001 DROP VIEW IF EXISTS `vw_fund`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_fund` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `special` tinyint NOT NULL,
  `system` tinyint NOT NULL,
  `groupid` tinyint NOT NULL,
  `depositoryfundid` tinyint NOT NULL,
  `group_objid` tinyint NOT NULL,
  `group_title` tinyint NOT NULL,
  `group_indexno` tinyint NOT NULL,
  `depositoryfund_objid` tinyint NOT NULL,
  `depositoryfund_state` tinyint NOT NULL,
  `depositoryfund_code` tinyint NOT NULL,
  `depositoryfund_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_gender_count`
--

DROP TABLE IF EXISTS `vw_gender_count`;
/*!50001 DROP VIEW IF EXISTS `vw_gender_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_gender_count` (
  `gender` tinyint NOT NULL,
  `icount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_income_ledger`
--

DROP TABLE IF EXISTS `vw_income_ledger`;
/*!50001 DROP VIEW IF EXISTS `vw_income_ledger`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_income_ledger` (
  `year` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `itemacctid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `jevid` tinyint NOT NULL,
  `objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_income_summary`
--

DROP TABLE IF EXISTS `vw_income_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_income_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_income_summary` (
  `refid` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `orgid` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `refyear` tinyint NOT NULL,
  `refmonth` tinyint NOT NULL,
  `refqtr` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `remittancedate` tinyint NOT NULL,
  `remittanceyear` tinyint NOT NULL,
  `remittancemonth` tinyint NOT NULL,
  `remittanceqtr` tinyint NOT NULL,
  `liquidationid` tinyint NOT NULL,
  `liquidationdate` tinyint NOT NULL,
  `liquidationyear` tinyint NOT NULL,
  `liquidationmonth` tinyint NOT NULL,
  `liquidationqtr` tinyint NOT NULL,
  `fundgroupid` tinyint NOT NULL,
  `itemid` tinyint NOT NULL,
  `itemcode` tinyint NOT NULL,
  `itemtitle` tinyint NOT NULL,
  `itemtype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_individualentity_list`
--

DROP TABLE IF EXISTS `vw_individualentity_list`;
/*!50001 DROP VIEW IF EXISTS `vw_individualentity_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_individualentity_list` (
  `lastname` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `addresstext` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt` (
  `remittance_objid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formtypeindexno` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `totalnoncash` tinyint NOT NULL,
  `totalcash` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `payer_objid` tinyint NOT NULL,
  `payer_name` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `collector_name` tinyint NOT NULL,
  `collector_title` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt_af`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt_af`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_af`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt_af` (
  `remittanceid` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `fromreceiptno` tinyint NOT NULL,
  `toreceiptno` tinyint NOT NULL,
  `fromseries` tinyint NOT NULL,
  `toseries` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `qtyvoided` tinyint NOT NULL,
  `voidamt` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `cancelledamt` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceipt_afsummary`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceipt_afsummary`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceipt_afsummary` (
  `objid` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collector_objid` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `fromreceiptno` tinyint NOT NULL,
  `toreceiptno` tinyint NOT NULL,
  `fromseries` tinyint NOT NULL,
  `toseries` tinyint NOT NULL,
  `qty` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `qtyvoided` tinyint NOT NULL,
  `voidamt` tinyint NOT NULL,
  `qtycancelled` tinyint NOT NULL,
  `cancelledamt` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `serieslength` tinyint NOT NULL,
  `denomination` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `startseries` tinyint NOT NULL,
  `endseries` tinyint NOT NULL,
  `prefix` tinyint NOT NULL,
  `suffix` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptitem`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptitem`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptitem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptitem` (
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `series` tinyint NOT NULL,
  `stubno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptpayment_noncash`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptpayment_noncash`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptpayment_noncash` (
  `objid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `refno` tinyint NOT NULL,
  `refdate` tinyint NOT NULL,
  `reftype` tinyint NOT NULL,
  `particulars` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `refid` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `bankid` tinyint NOT NULL,
  `bank_name` tinyint NOT NULL,
  `remittanceid` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_remittance_cashreceiptshare`
--

DROP TABLE IF EXISTS `vw_remittance_cashreceiptshare`;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptshare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_remittance_cashreceiptshare` (
  `remittanceid` tinyint NOT NULL,
  `remittance_controldate` tinyint NOT NULL,
  `remittance_controlno` tinyint NOT NULL,
  `collectionvoucherid` tinyint NOT NULL,
  `formno` tinyint NOT NULL,
  `formtype` tinyint NOT NULL,
  `controlid` tinyint NOT NULL,
  `receiptid` tinyint NOT NULL,
  `receiptdate` tinyint NOT NULL,
  `receiptno` tinyint NOT NULL,
  `paidby` tinyint NOT NULL,
  `paidbyaddress` tinyint NOT NULL,
  `org_objid` tinyint NOT NULL,
  `org_name` tinyint NOT NULL,
  `collectiontype_objid` tinyint NOT NULL,
  `collectiontype_name` tinyint NOT NULL,
  `collectorid` tinyint NOT NULL,
  `collectorname` tinyint NOT NULL,
  `collectortitle` tinyint NOT NULL,
  `refacctid` tinyint NOT NULL,
  `fundid` tinyint NOT NULL,
  `acctid` tinyint NOT NULL,
  `acctcode` tinyint NOT NULL,
  `acctname` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `voided` tinyint NOT NULL,
  `voidamount` tinyint NOT NULL,
  `formtypeindex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workflowstate`
--

DROP TABLE IF EXISTS `workflowstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowstate` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `txndate` datetime DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`objid`,`state`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowstate`
--

LOCK TABLES `workflowstate` WRITE;
/*!40000 ALTER TABLE `workflowstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `etracs255_remote`
--

USE `etracs255_remote`;

--
-- Final view structure for view `sys_user_role`
--

/*!50001 DROP TABLE IF EXISTS `sys_user_role`*/;
/*!50001 DROP VIEW IF EXISTS `sys_user_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sys_user_role` AS select `u`.`objid` AS `objid`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`middlename` AS `middlename`,`u`.`username` AS `username`,concat(`u`.`lastname`,', ',`u`.`firstname`,(case when isnull(`u`.`middlename`) then '' else concat(' ',`u`.`middlename`) end)) AS `name`,`ug`.`role` AS `role`,`ug`.`domain` AS `domain`,`ugm`.`org_objid` AS `orgid`,`u`.`txncode` AS `txncode`,`u`.`jobtitle` AS `jobtitle`,`ugm`.`objid` AS `usergroupmemberid`,`ugm`.`usergroup_objid` AS `usergroup_objid`,`ugm`.`org_objid` AS `respcenter_objid`,`ugm`.`org_name` AS `respcenter_name` from ((`sys_usergroup_member` `ugm` join `sys_usergroup` `ug` on((`ug`.`objid` = `ugm`.`usergroup_objid`))) join `sys_user` `u` on((`u`.`objid` = `ugm`.`user_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_income_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_income_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_income_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_income_summary` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`inc`.`amount` AS `amount`,`inc`.`acctid` AS `acctid`,`inc`.`fundid` AS `fundid`,`inc`.`collectorid` AS `collectorid`,`inc`.`refdate` AS `refdate`,`inc`.`remittancedate` AS `remittancedate`,`inc`.`liquidationdate` AS `liquidationdate`,`ia`.`type` AS `accttype` from (((`account_item_mapping` `aim` join `account` `a` on((`a`.`objid` = `aim`.`acctid`))) join `itemaccount` `ia` on((`ia`.`objid` = `aim`.`itemid`))) join `income_summary` `inc` on((`inc`.`acctid` = `ia`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_incometarget`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_incometarget`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_incometarget`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_incometarget` AS select `t`.`objid` AS `objid`,`t`.`itemid` AS `itemid`,`t`.`year` AS `year`,`t`.`target` AS `target`,`a`.`maingroupid` AS `maingroupid`,`a`.`objid` AS `item_objid`,`a`.`code` AS `item_code`,`a`.`title` AS `item_title`,`a`.`level` AS `item_level`,`a`.`leftindex` AS `item_leftindex`,`g`.`objid` AS `group_objid`,`g`.`code` AS `group_code`,`g`.`title` AS `group_title`,`g`.`level` AS `group_level`,`g`.`leftindex` AS `group_leftindex` from ((`account_incometarget` `t` join `account` `a` on((`a`.`objid` = `t`.`itemid`))) join `account` `g` on((`g`.`objid` = `a`.`groupid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_item_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_item_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_item_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_item_mapping` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`l`.`amount` AS `amount`,`l`.`fundid` AS `fundid`,`l`.`year` AS `year`,`l`.`month` AS `month`,`aim`.`itemid` AS `itemid`,`ia`.`code` AS `itemcode`,`ia`.`title` AS `itemtitle` from (((`account_item_mapping` `aim` join `account` `a` on((`a`.`objid` = `aim`.`acctid`))) join `itemaccount` `ia` on((`ia`.`objid` = `aim`.`itemid`))) join `vw_income_ledger` `l` on((`l`.`itemacctid` = `aim`.`itemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_account_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_account_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_account_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_mapping` AS select `a`.`objid` AS `objid`,`a`.`maingroupid` AS `maingroupid`,`a`.`code` AS `code`,`a`.`title` AS `title`,`a`.`groupid` AS `groupid`,`a`.`type` AS `type`,`a`.`leftindex` AS `leftindex`,`a`.`rightindex` AS `rightindex`,`a`.`level` AS `level`,`m`.`itemid` AS `itemid`,`m`.`acctid` AS `acctid` from (`account_item_mapping` `m` join `account` `a` on((`a`.`objid` = `m`.`acctid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_af_control_detail`
--

/*!50001 DROP TABLE IF EXISTS `vw_af_control_detail`*/;
/*!50001 DROP VIEW IF EXISTS `vw_af_control_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_af_control_detail` AS select `afd`.`objid` AS `objid`,`afd`.`state` AS `state`,`afd`.`controlid` AS `controlid`,`afd`.`indexno` AS `indexno`,`afd`.`refid` AS `refid`,`afd`.`aftxnitemid` AS `aftxnitemid`,`afd`.`refno` AS `refno`,`afd`.`reftype` AS `reftype`,`afd`.`refdate` AS `refdate`,`afd`.`txndate` AS `txndate`,`afd`.`txntype` AS `txntype`,`afd`.`receivedstartseries` AS `receivedstartseries`,`afd`.`receivedendseries` AS `receivedendseries`,`afd`.`beginstartseries` AS `beginstartseries`,`afd`.`beginendseries` AS `beginendseries`,`afd`.`issuedstartseries` AS `issuedstartseries`,`afd`.`issuedendseries` AS `issuedendseries`,`afd`.`endingstartseries` AS `endingstartseries`,`afd`.`endingendseries` AS `endingendseries`,`afd`.`qtyreceived` AS `qtyreceived`,`afd`.`qtybegin` AS `qtybegin`,`afd`.`qtyissued` AS `qtyissued`,`afd`.`qtyending` AS `qtyending`,`afd`.`qtycancelled` AS `qtycancelled`,`afd`.`remarks` AS `remarks`,`afd`.`issuedto_objid` AS `issuedto_objid`,`afd`.`issuedto_name` AS `issuedto_name`,`afd`.`respcenter_objid` AS `respcenter_objid`,`afd`.`respcenter_name` AS `respcenter_name`,`afd`.`prevdetailid` AS `prevdetailid`,`afd`.`aftxnid` AS `aftxnid`,`afc`.`afid` AS `afid`,`afc`.`unit` AS `unit`,`af`.`formtype` AS `formtype`,`af`.`denomination` AS `denomination`,`af`.`serieslength` AS `serieslength`,`afu`.`qty` AS `qty`,`afu`.`saleprice` AS `saleprice`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`currentseries` AS `currentseries`,`afc`.`stubno` AS `stubno`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix`,`afc`.`cost` AS `cost`,`afc`.`batchno` AS `batchno`,`afc`.`state` AS `controlstate`,`afd`.`qtyending` AS `qtybalance` from (((`af_control_detail` `afd` join `af_control` `afc` on((`afc`.`objid` = `afd`.`controlid`))) join `af` on((`af`.`objid` = `afc`.`afid`))) join `afunit` `afu` on(((`afu`.`itemid` = `af`.`objid`) and (`afu`.`unit` = `afc`.`unit`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_af_inventory_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_af_inventory_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_af_inventory_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_af_inventory_summary` AS select `af`.`objid` AS `objid`,`af`.`title` AS `title`,`u`.`unit` AS `unit`,`af`.`formtype` AS `formtype`,(case when (`af`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'OPEN'))) AS `countopen`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'ISSUED'))) AS `countissued`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'ISSUED') and (`af_control`.`currentseries` > `af_control`.`endseries`))) AS `countclosed`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'SOLD'))) AS `countsold`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'PROCESSING'))) AS `countprocessing`,(select count(0) from `af_control` where ((`af_control`.`afid` = `af`.`objid`) and (`af_control`.`state` = 'HOLD'))) AS `counthold` from (`af` join `afunit` `u`) where (`af`.`objid` = `u`.`itemid`) order by (case when (`af`.`formtype` = 'serial') then 0 else 1 end),`af`.`objid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_afunit`
--

/*!50001 DROP TABLE IF EXISTS `vw_afunit`*/;
/*!50001 DROP VIEW IF EXISTS `vw_afunit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afunit` AS select `u`.`objid` AS `objid`,`af`.`title` AS `title`,`af`.`usetype` AS `usetype`,`af`.`serieslength` AS `serieslength`,`af`.`system` AS `system`,`af`.`denomination` AS `denomination`,`af`.`formtype` AS `formtype`,`u`.`itemid` AS `itemid`,`u`.`unit` AS `unit`,`u`.`qty` AS `qty`,`u`.`saleprice` AS `saleprice`,`u`.`interval` AS `interval`,`u`.`cashreceiptprintout` AS `cashreceiptprintout`,`u`.`cashreceiptdetailprintout` AS `cashreceiptdetailprintout` from (`afunit` `u` join `af` on((`af`.`objid` = `u`.`itemid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt` AS select `c`.`objid` AS `objid`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`ci`.`amount` AS `dr`,0.0 AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt_share` AS select `c`.`objid` AS `objid`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,0.0 AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`cs`.`refitem_objid` AS `refitemid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceipt_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceipt_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceipt_share_payable` AS select `c`.`objid` AS `objid`,`c`.`txndate` AS `txndate`,cast(`c`.`receiptdate` as date) AS `refdate`,`c`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt' AS `reftype`,concat(`ct`.`name`,' (',`c`.`paidby`,')') AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,0.0 AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`c`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`objid` AS `receiptid`,`cs`.`payableitem_objid` AS `payableitemid`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt` `c` join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid` AS select `v`.`objid` AS `objid`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`ci`.`amount` AS `dr`,(case when isnull(`r`.`liquidatingofficer_objid`) then 0.0 when (`v`.`txndate` > `r`.`dtposted`) then `ci`.`amount` else 0.0 end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from ((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid_share` AS select `v`.`objid` AS `objid`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,(case when isnull(`r`.`liquidatingofficer_objid`) then 0.0 when (`v`.`txndate` > `r`.`dtposted`) then `cs`.`amount` else 0.0 end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_cashreceiptvoid_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_cashreceiptvoid_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_cashreceiptvoid_share_payable` AS select `v`.`objid` AS `objid`,`v`.`txndate` AS `txndate`,cast(`v`.`txndate` as date) AS `refdate`,`v`.`objid` AS `refid`,`c`.`receiptno` AS `refno`,'cashreceipt:void' AS `reftype`,concat('VOID ',`v`.`reason`) AS `particulars`,`ia`.`fund_objid` AS `fundid`,`c`.`collector_objid` AS `collectorid`,`cs`.`amount` AS `dr`,(case when isnull(`r`.`liquidatingofficer_objid`) then 0.0 when (`v`.`txndate` > `r`.`dtposted`) then `cs`.`amount` else 0.0 end) AS `cr`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`series` AS `series`,`c`.`controlid` AS `controlid`,`v`.`txndate` AS `sortdate`,`c`.`receiptdate` AS `receiptdate`,`c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittancedate`,`r`.`dtposted` AS `remittancedtposted` from (((((`cashreceipt_void` `v` join `cashreceipt` `c` on((`c`.`objid` = `v`.`receiptid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) join `collectiontype` `ct` on((`ct`.`objid` = `c`.`collectiontype_objid`))) left join `remittance` `r` on((`r`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance` AS select `r`.`objid` AS `objid`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ci`.`item_fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,0.0 AS `dr`,`ci`.`amount` AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptitem` `ci` on((`ci`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance_share`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance_share`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance_share` AS select `r`.`objid` AS `objid`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ia`.`fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,0.0 AS `dr`,`cs`.`amount` AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`refitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashbook_remittance_share_payable`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashbook_remittance_share_payable`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashbook_remittance_share_payable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashbook_remittance_share_payable` AS select `r`.`objid` AS `objid`,`r`.`dtposted` AS `txndate`,`r`.`controldate` AS `refdate`,`r`.`objid` AS `refid`,`r`.`controlno` AS `refno`,'remittance' AS `reftype`,'REMITTANCE' AS `particulars`,`ia`.`fund_objid` AS `fundid`,`r`.`collector_objid` AS `collectorid`,0.0 AS `dr`,`cs`.`amount` AS `cr`,'remittance' AS `formno`,'remittance' AS `formtype`,NULL AS `series`,NULL AS `controlid`,`r`.`dtposted` AS `sortdate`,`r`.`liquidatingofficer_objid` AS `liquidatingofficer_objid`,`r`.`liquidatingofficer_name` AS `liquidatingofficer_name`,`v`.`objid` AS `voidid`,`v`.`txndate` AS `voiddate` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_item`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_item`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_item` AS select `cashreceiptitem`.`receiptid` AS `receiptid`,`cashreceiptitem`.`item_code` AS `itemcode`,`cashreceiptitem`.`item_title` AS `itemtitle`,`cashreceiptitem`.`amount` AS `amount` from `cashreceiptitem` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount` AS select `itemaccount`.`objid` AS `objid`,`itemaccount`.`state` AS `state`,`itemaccount`.`code` AS `code`,`itemaccount`.`title` AS `title`,`itemaccount`.`description` AS `description`,`itemaccount`.`type` AS `type`,`itemaccount`.`fund_objid` AS `fund_objid`,`itemaccount`.`fund_code` AS `fund_code`,`itemaccount`.`fund_title` AS `fund_title`,`itemaccount`.`defaultvalue` AS `defaultvalue`,`itemaccount`.`valuetype` AS `valuetype`,`itemaccount`.`sortorder` AS `sortorder`,`itemaccount`.`org_objid` AS `orgid`,`itemaccount`.`hidefromlookup` AS `hidefromlookup` from `itemaccount` where ((`itemaccount`.`state` = 'ACTIVE') and (`itemaccount`.`type` in ('REVENUE','NONREVENUE','PAYABLE')) and (ifnull(`itemaccount`.`generic`,0) = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount_collectiongroup`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiongroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount_collectiongroup` AS select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,(case when (`ca`.`defaultvalue` = 0) then `ia`.`defaultvalue` else `ca`.`defaultvalue` end) AS `defaultvalue`,(case when (`ca`.`defaultvalue` = 0) then `ia`.`valuetype` else `ca`.`valuetype` end) AS `valuetype`,`ca`.`sortorder` AS `sortorder`,`ia`.`org_objid` AS `orgid`,`ca`.`collectiongroupid` AS `collectiongroupid`,`ia`.`generic` AS `generic` from (`collectiongroup_account` `ca` join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceipt_itemaccount_collectiontype`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceipt_itemaccount_collectiontype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceipt_itemaccount_collectiontype` AS select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,`ca`.`defaultvalue` AS `defaultvalue`,(case when isnull(`ca`.`valuetype`) then 'ANY' else `ca`.`valuetype` end) AS `valuetype`,(case when isnull(`ca`.`sortorder`) then 0 else `ca`.`sortorder` end) AS `sortorder`,NULL AS `orgid`,`ca`.`collectiontypeid` AS `collectiontypeid`,0 AS `hasorg`,`ia`.`hidefromlookup` AS `hidefromlookup` from (((`collectiontype` `ct` join `collectiontype_account` `ca` on((`ca`.`collectiontypeid` = `ct`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) left join `collectiontype_org` `o` on((`o`.`collectiontypeid` = `ca`.`objid`))) where (isnull(`o`.`objid`) and (`ia`.`state` = 'ACTIVE') and (`ia`.`type` in ('REVENUE','NONREVENUE','PAYABLE'))) union all select `ia`.`objid` AS `objid`,`ia`.`state` AS `state`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`description` AS `description`,`ia`.`type` AS `type`,`ia`.`fund_objid` AS `fund_objid`,`ia`.`fund_code` AS `fund_code`,`ia`.`fund_title` AS `fund_title`,`ca`.`defaultvalue` AS `defaultvalue`,(case when isnull(`ca`.`valuetype`) then 'ANY' else `ca`.`valuetype` end) AS `valuetype`,(case when isnull(`ca`.`sortorder`) then 0 else `ca`.`sortorder` end) AS `sortorder`,`o`.`org_objid` AS `orgid`,`ca`.`collectiontypeid` AS `collectiontypeid`,1 AS `hasorg`,`ia`.`hidefromlookup` AS `hidefromlookup` from (((`collectiontype` `ct` join `collectiontype_org` `o` on((`o`.`collectiontypeid` = `ct`.`objid`))) join `collectiontype_account` `ca` on((`ca`.`collectiontypeid` = `ct`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `ca`.`account_objid`))) where ((`ia`.`state` = 'ACTIVE') and (`ia`.`type` in ('REVENUE','NONREVENUE','PAYABLE'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceiptpayment_noncash`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceiptpayment_noncash` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`amount` AS `amount`,`nc`.`particulars` AS `particulars`,`nc`.`account_objid` AS `account_objid`,`nc`.`account_code` AS `account_code`,`nc`.`account_name` AS `account_name`,`nc`.`account_fund_objid` AS `account_fund_objid`,`nc`.`account_fund_name` AS `account_fund_name`,`nc`.`account_bank` AS `account_bank`,`nc`.`fund_objid` AS `fund_objid`,`nc`.`refid` AS `refid`,`nc`.`checkid` AS `checkid`,`nc`.`voidamount` AS `voidamount`,`v`.`objid` AS `void_objid`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,`c`.`receiptno` AS `receipt_receiptno`,`c`.`receiptdate` AS `receipt_receiptdate`,`c`.`amount` AS `receipt_amount`,`c`.`collector_objid` AS `receipt_collector_objid`,`c`.`collector_name` AS `receipt_collector_name`,`c`.`remittanceid` AS `remittanceid`,`rem`.`objid` AS `remittance_objid`,`rem`.`controlno` AS `remittance_controlno`,`rem`.`controldate` AS `remittance_controldate` from (((`cashreceiptpayment_noncash` `nc` join `cashreceipt` `c` on((`c`.`objid` = `nc`.`receiptid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) left join `remittance` `rem` on((`rem`.`objid` = `c`.`remittanceid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreceiptpayment_noncash_liquidated`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreceiptpayment_noncash_liquidated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreceiptpayment_noncash_liquidated` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`amount` AS `amount`,`nc`.`particulars` AS `particulars`,`nc`.`account_objid` AS `account_objid`,`nc`.`account_code` AS `account_code`,`nc`.`account_name` AS `account_name`,`nc`.`account_fund_objid` AS `account_fund_objid`,`nc`.`account_fund_name` AS `account_fund_name`,`nc`.`account_bank` AS `account_bank`,`nc`.`fund_objid` AS `fund_objid`,`nc`.`refid` AS `refid`,`nc`.`checkid` AS `checkid`,`nc`.`voidamount` AS `voidamount`,`v`.`objid` AS `void_objid`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,`c`.`receiptno` AS `receipt_receiptno`,`c`.`receiptdate` AS `receipt_receiptdate`,`c`.`amount` AS `receipt_amount`,`c`.`collector_objid` AS `receipt_collector_objid`,`c`.`collector_name` AS `receipt_collector_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`objid` AS `remittance_objid`,`r`.`controlno` AS `remittance_controlno`,`r`.`controldate` AS `remittance_controldate`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`cv`.`objid` AS `collectionvoucher_objid`,`cv`.`controlno` AS `collectionvoucher_controlno`,`cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`depositvoucherid` AS `depositvoucherid` from ((((`collectionvoucher` `cv` join `remittance` `r` on((`r`.`collectionvoucherid` = `cv`.`objid`))) join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on((`nc`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashreciept`
--

/*!50001 DROP TABLE IF EXISTS `vw_cashreciept`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cashreciept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashreciept` AS select year(`c`.`receiptdate`) AS `iyear`,month(`c`.`receiptdate`) AS `imonth`,`c`.`objid` AS `objid`,`c`.`txnmode` AS `txnmode`,`c`.`receiptno` AS `receiptno`,`c`.`receiptdate` AS `receiptdate`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`collector_name` AS `collectorname`,`c`.`amount` AS `amount`,`c`.`formno` AS `formno` from (`cashreceipt` `c` left join `cashreceipt_void` `v` on((`c`.`objid` = `v`.`objid`))) where isnull(`v`.`objid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiongroup`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiongroup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiongroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiongroup` AS select `cg`.`objid` AS `objid`,`cg`.`name` AS `name`,`cg`.`sharing` AS `sharing`,NULL AS `orgid` from (`collectiongroup` `cg` left join `collectiongroup_org` `co` on((`co`.`collectiongroupid` = `cg`.`objid`))) where ((`cg`.`state` = 'ACTIVE') and isnull(`co`.`objid`)) union select `cg`.`objid` AS `objid`,`cg`.`name` AS `name`,`cg`.`sharing` AS `sharing`,`co`.`org_objid` AS `orgid` from (`collectiongroup` `cg` join `collectiongroup_org` `co` on((`co`.`collectiongroupid` = `cg`.`objid`))) where (`cg`.`state` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiontype`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiontype`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiontype` AS select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`name` AS `name`,`c`.`title` AS `title`,`c`.`formno` AS `formno`,`c`.`handler` AS `handler`,`c`.`allowbatch` AS `allowbatch`,`c`.`barcodekey` AS `barcodekey`,`c`.`allowonline` AS `allowonline`,`c`.`allowoffline` AS `allowoffline`,`c`.`sortorder` AS `sortorder`,`o`.`org_objid` AS `orgid`,`c`.`fund_objid` AS `fund_objid`,`c`.`fund_title` AS `fund_title`,`c`.`category` AS `category`,`c`.`queuesection` AS `queuesection`,`c`.`system` AS `system`,`af`.`formtype` AS `af_formtype`,`af`.`serieslength` AS `af_serieslength`,`af`.`denomination` AS `af_denomination`,`af`.`baseunit` AS `af_baseunit`,`c`.`allowpaymentorder` AS `allowpaymentorder`,`c`.`allowkiosk` AS `allowkiosk`,`c`.`allowcreditmemo` AS `allowcreditmemo` from ((`collectiontype_org` `o` join `collectiontype` `c` on((`c`.`objid` = `o`.`collectiontypeid`))) join `af` on((`af`.`objid` = `c`.`formno`))) where (`c`.`state` = 'ACTIVE') union select `c`.`objid` AS `objid`,`c`.`state` AS `state`,`c`.`name` AS `name`,`c`.`title` AS `title`,`c`.`formno` AS `formno`,`c`.`handler` AS `handler`,`c`.`allowbatch` AS `allowbatch`,`c`.`barcodekey` AS `barcodekey`,`c`.`allowonline` AS `allowonline`,`c`.`allowoffline` AS `allowoffline`,`c`.`sortorder` AS `sortorder`,NULL AS `orgid`,`c`.`fund_objid` AS `fund_objid`,`c`.`fund_title` AS `fund_title`,`c`.`category` AS `category`,`c`.`queuesection` AS `queuesection`,`c`.`system` AS `system`,`af`.`formtype` AS `af_formtype`,`af`.`serieslength` AS `af_serieslength`,`af`.`denomination` AS `af_denomination`,`af`.`baseunit` AS `af_baseunit`,`c`.`allowpaymentorder` AS `allowpaymentorder`,`c`.`allowkiosk` AS `allowkiosk`,`c`.`allowcreditmemo` AS `allowcreditmemo` from ((`collectiontype` `c` join `af` on((`af`.`objid` = `c`.`formno`))) left join `collectiontype_org` `o` on((`c`.`objid` = `o`.`collectiontypeid`))) where ((`c`.`state` = 'ACTIVE') and isnull(`o`.`objid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectiontype_account`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectiontype_account`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectiontype_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectiontype_account` AS select `ia`.`objid` AS `objid`,`ia`.`code` AS `code`,`ia`.`title` AS `title`,`ia`.`fund_objid` AS `fund_objid`,`fund`.`code` AS `fund_code`,`fund`.`title` AS `fund_title`,`cta`.`collectiontypeid` AS `collectiontypeid`,`cta`.`tag` AS `tag`,`cta`.`valuetype` AS `valuetype`,`cta`.`defaultvalue` AS `defaultvalue` from ((`collectiontype_account` `cta` join `itemaccount` `ia` on((`ia`.`objid` = `cta`.`account_objid`))) join `fund` on((`fund`.`objid` = `ia`.`fund_objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectionvoucher_cashreceiptitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectionvoucher_cashreceiptitem` AS select `cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`controlno` AS `collectionvoucher_controlno`,`v`.`remittanceid` AS `remittanceid`,`v`.`remittance_controldate` AS `remittance_controldate`,`v`.`remittance_controlno` AS `remittance_controlno`,`v`.`collectionvoucherid` AS `collectionvoucherid`,`v`.`collectiontype_objid` AS `collectiontype_objid`,`v`.`collectiontype_name` AS `collectiontype_name`,`v`.`org_objid` AS `org_objid`,`v`.`org_name` AS `org_name`,`v`.`formtype` AS `formtype`,`v`.`formno` AS `formno`,`v`.`receiptid` AS `receiptid`,`v`.`receiptdate` AS `receiptdate`,`v`.`receiptno` AS `receiptno`,`v`.`controlid` AS `controlid`,`v`.`series` AS `series`,`v`.`stubno` AS `stubno`,`v`.`paidby` AS `paidby`,`v`.`paidbyaddress` AS `paidbyaddress`,`v`.`collectorid` AS `collectorid`,`v`.`collectorname` AS `collectorname`,`v`.`collectortitle` AS `collectortitle`,`v`.`fundid` AS `fundid`,`v`.`acctid` AS `acctid`,`v`.`acctcode` AS `acctcode`,`v`.`acctname` AS `acctname`,`v`.`remarks` AS `remarks`,`v`.`amount` AS `amount`,`v`.`voided` AS `voided`,`v`.`voidamount` AS `voidamount`,`v`.`formtypeindex` AS `formtypeindex` from (`collectionvoucher` `cv` join `vw_remittance_cashreceiptitem` `v` on((`v`.`collectionvoucherid` = `cv`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_collectionvoucher_cashreceiptshare`
--

/*!50001 DROP TABLE IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
/*!50001 DROP VIEW IF EXISTS `vw_collectionvoucher_cashreceiptshare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_collectionvoucher_cashreceiptshare` AS select `cv`.`controldate` AS `collectionvoucher_controldate`,`cv`.`controlno` AS `collectionvoucher_controlno`,`v`.`remittanceid` AS `remittanceid`,`v`.`remittance_controldate` AS `remittance_controldate`,`v`.`remittance_controlno` AS `remittance_controlno`,`v`.`collectionvoucherid` AS `collectionvoucherid`,`v`.`formno` AS `formno`,`v`.`formtype` AS `formtype`,`v`.`controlid` AS `controlid`,`v`.`receiptid` AS `receiptid`,`v`.`receiptdate` AS `receiptdate`,`v`.`receiptno` AS `receiptno`,`v`.`paidby` AS `paidby`,`v`.`paidbyaddress` AS `paidbyaddress`,`v`.`org_objid` AS `org_objid`,`v`.`org_name` AS `org_name`,`v`.`collectiontype_objid` AS `collectiontype_objid`,`v`.`collectiontype_name` AS `collectiontype_name`,`v`.`collectorid` AS `collectorid`,`v`.`collectorname` AS `collectorname`,`v`.`collectortitle` AS `collectortitle`,`v`.`refacctid` AS `refacctid`,`v`.`fundid` AS `fundid`,`v`.`acctid` AS `acctid`,`v`.`acctcode` AS `acctcode`,`v`.`acctname` AS `acctname`,`v`.`amount` AS `amount`,`v`.`voided` AS `voided`,`v`.`voidamount` AS `voidamount`,`v`.`formtypeindex` AS `formtypeindex` from (`collectionvoucher` `cv` join `vw_remittance_cashreceiptshare` `v` on((`v`.`collectionvoucherid` = `cv`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_deposit_fund_transfer`
--

/*!50001 DROP TABLE IF EXISTS `vw_deposit_fund_transfer`*/;
/*!50001 DROP VIEW IF EXISTS `vw_deposit_fund_transfer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_deposit_fund_transfer` AS select `dft`.`objid` AS `objid`,`dft`.`amount` AS `amount`,`dft`.`todepositvoucherfundid` AS `todepositvoucherfundid`,`tof`.`objid` AS `todepositvoucherfund_fund_objid`,`tof`.`code` AS `todepositvoucherfund_fund_code`,`tof`.`title` AS `todepositvoucherfund_fund_title`,`dft`.`fromdepositvoucherfundid` AS `fromdepositvoucherfundid`,`fromf`.`objid` AS `fromdepositvoucherfund_fund_objid`,`fromf`.`code` AS `fromdepositvoucherfund_fund_code`,`fromf`.`title` AS `fromdepositvoucherfund_fund_title` from ((((`deposit_fund_transfer` `dft` join `depositvoucher_fund` `todv` on((`dft`.`todepositvoucherfundid` = `todv`.`objid`))) join `fund` `tof` on((`todv`.`fundid` = `tof`.`objid`))) join `depositvoucher_fund` `fromdv` on((`dft`.`fromdepositvoucherfundid` = `fromdv`.`objid`))) join `fund` `fromf` on((`fromdv`.`fundid` = `fromf`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entity_mapping`
--

/*!50001 DROP TABLE IF EXISTS `vw_entity_mapping`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entity_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entity_mapping` AS select `r`.`objid` AS `objid`,`r`.`parent_objid` AS `parent_objid`,`r`.`org_objid` AS `org_objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `address_text`,`a`.`province` AS `address_province`,`a`.`municipality` AS `address_municipality` from ((((`entity_mapping` `r` join `entity` `e` on((`r`.`objid` = `e`.`objid`))) left join `entity_address` `a` on((`e`.`address_objid` = `a`.`objid`))) left join `sys_org` `b` on((`a`.`barangay_objid` = `b`.`objid`))) left join `sys_org` `m` on((`b`.`parent_objid` = `m`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entity_relation`
--

/*!50001 DROP TABLE IF EXISTS `vw_entity_relation`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entity_relation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entity_relation` AS select `er`.`objid` AS `objid`,`er`.`entity_objid` AS `ownerid`,`ei`.`objid` AS `entityid`,`ei`.`entityno` AS `entityno`,`ei`.`name` AS `name`,`ei`.`firstname` AS `firstname`,`ei`.`lastname` AS `lastname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`gender` AS `gender`,`er`.`relation_objid` AS `relationship` from (`entity_relation` `er` join `vw_entityindividual` `ei` on((`er`.`relateto_objid` = `ei`.`objid`))) union all select `er`.`objid` AS `objid`,`er`.`relateto_objid` AS `ownerid`,`ei`.`objid` AS `entityid`,`ei`.`entityno` AS `entityno`,`ei`.`name` AS `name`,`ei`.`firstname` AS `firstname`,`ei`.`lastname` AS `lastname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`gender` AS `gender`,(case when (`ei`.`gender` = 'M') then `et`.`inverse_male` when (`ei`.`gender` = 'F') then `et`.`inverse_female` else `et`.`inverse_any` end) AS `relationship` from ((`entity_relation` `er` join `vw_entityindividual` `ei` on((`er`.`entity_objid` = `ei`.`objid`))) join `entity_relation_type` `et` on((`er`.`relation_objid` = `et`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityindividual`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityindividual`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityindividual` AS select `ei`.`objid` AS `objid`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`birthdate` AS `birthdate`,`ei`.`birthplace` AS `birthplace`,`ei`.`citizenship` AS `citizenship`,`ei`.`gender` AS `gender`,`ei`.`civilstatus` AS `civilstatus`,`ei`.`profession` AS `profession`,`ei`.`tin` AS `tin`,`ei`.`sss` AS `sss`,`ei`.`height` AS `height`,`ei`.`weight` AS `weight`,`ei`.`acr` AS `acr`,`ei`.`religion` AS `religion`,`ei`.`photo` AS `photo`,`ei`.`thumbnail` AS `thumbnail`,`ei`.`profileid` AS `profileid`,`e`.`entityno` AS `entityno`,`e`.`type` AS `type`,`e`.`name` AS `name`,`e`.`entityname` AS `entityname`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno`,`e`.`address_objid` AS `address_objid`,`e`.`address_text` AS `address_text` from (`entityindividual` `ei` join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityindividual_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityindividual_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityindividual_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityindividual_lookup` AS select `e`.`objid` AS `objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `addresstext`,`e`.`type` AS `type`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`gender` AS `gender`,`ei`.`birthdate` AS `birthdate`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno` from (`entity` `e` join `entityindividual` `ei` on((`ei`.`objid` = `e`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entityrelation_lookup`
--

/*!50001 DROP TABLE IF EXISTS `vw_entityrelation_lookup`*/;
/*!50001 DROP VIEW IF EXISTS `vw_entityrelation_lookup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entityrelation_lookup` AS select `er`.`objid` AS `objid`,`er`.`entity_objid` AS `entity_objid`,`er`.`relateto_objid` AS `relateto_objid`,`er`.`relation_objid` AS `relation_objid`,`e`.`entityno` AS `entityno`,`e`.`name` AS `name`,`e`.`address_text` AS `addresstext`,`e`.`type` AS `type`,`ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`middlename` AS `middlename`,`ei`.`gender` AS `gender`,`ei`.`birthdate` AS `birthdate`,`e`.`mobileno` AS `mobileno`,`e`.`phoneno` AS `phoneno` from ((`entity_relation` `er` join `entityindividual` `ei` on((`ei`.`objid` = `er`.`relateto_objid`))) join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_fund`
--

/*!50001 DROP TABLE IF EXISTS `vw_fund`*/;
/*!50001 DROP VIEW IF EXISTS `vw_fund`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_fund` AS select `f`.`objid` AS `objid`,`f`.`parentid` AS `parentid`,`f`.`state` AS `state`,`f`.`code` AS `code`,`f`.`title` AS `title`,`f`.`type` AS `type`,`f`.`special` AS `special`,`f`.`system` AS `system`,`f`.`groupid` AS `groupid`,`f`.`depositoryfundid` AS `depositoryfundid`,`g`.`objid` AS `group_objid`,`g`.`title` AS `group_title`,`g`.`indexno` AS `group_indexno`,`d`.`objid` AS `depositoryfund_objid`,`d`.`state` AS `depositoryfund_state`,`d`.`code` AS `depositoryfund_code`,`d`.`title` AS `depositoryfund_title` from ((`fund` `f` left join `fundgroup` `g` on((`g`.`objid` = `f`.`groupid`))) left join `fund` `d` on((`d`.`objid` = `f`.`depositoryfundid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gender_count`
--

/*!50001 DROP TABLE IF EXISTS `vw_gender_count`*/;
/*!50001 DROP VIEW IF EXISTS `vw_gender_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gender_count` AS select `entityindividual`.`gender` AS `gender`,count(0) AS `icount` from `entityindividual` group by `entityindividual`.`gender` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_income_ledger`
--

/*!50001 DROP TABLE IF EXISTS `vw_income_ledger`*/;
/*!50001 DROP VIEW IF EXISTS `vw_income_ledger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income_ledger` AS select year(`jev`.`jevdate`) AS `year`,month(`jev`.`jevdate`) AS `month`,`jev`.`fundid` AS `fundid`,`l`.`itemacctid` AS `itemacctid`,`l`.`cr` AS `amount`,`l`.`jevid` AS `jevid`,`l`.`objid` AS `objid` from (`income_ledger` `l` join `jev` on((`jev`.`objid` = `l`.`jevid`))) union all select year(`jev`.`jevdate`) AS `year`,month(`jev`.`jevdate`) AS `month`,`jev`.`fundid` AS `fundid`,`l`.`refitemacctid` AS `itemacctid`,(`l`.`cr` - `l`.`dr`) AS `amount`,`l`.`jevid` AS `jevid`,`l`.`objid` AS `objid` from (`payable_ledger` `l` join `jev` on((`jev`.`objid` = `l`.`jevid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_income_summary`
--

/*!50001 DROP TABLE IF EXISTS `vw_income_summary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_income_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income_summary` AS select `inc`.`refid` AS `refid`,`inc`.`refdate` AS `refdate`,`inc`.`refno` AS `refno`,`inc`.`reftype` AS `reftype`,`inc`.`acctid` AS `acctid`,`inc`.`fundid` AS `fundid`,`inc`.`amount` AS `amount`,`inc`.`orgid` AS `orgid`,`inc`.`collectorid` AS `collectorid`,`inc`.`refyear` AS `refyear`,`inc`.`refmonth` AS `refmonth`,`inc`.`refqtr` AS `refqtr`,`inc`.`remittanceid` AS `remittanceid`,`inc`.`remittancedate` AS `remittancedate`,`inc`.`remittanceyear` AS `remittanceyear`,`inc`.`remittancemonth` AS `remittancemonth`,`inc`.`remittanceqtr` AS `remittanceqtr`,`inc`.`liquidationid` AS `liquidationid`,`inc`.`liquidationdate` AS `liquidationdate`,`inc`.`liquidationyear` AS `liquidationyear`,`inc`.`liquidationmonth` AS `liquidationmonth`,`inc`.`liquidationqtr` AS `liquidationqtr`,`fund`.`groupid` AS `fundgroupid`,`ia`.`objid` AS `itemid`,`ia`.`code` AS `itemcode`,`ia`.`title` AS `itemtitle`,`ia`.`type` AS `itemtype` from ((`income_summary` `inc` join `fund` on((`fund`.`objid` = `inc`.`fundid`))) join `itemaccount` `ia` on((`ia`.`objid` = `inc`.`acctid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_individualentity_list`
--

/*!50001 DROP TABLE IF EXISTS `vw_individualentity_list`*/;
/*!50001 DROP VIEW IF EXISTS `vw_individualentity_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_individualentity_list` AS select `ei`.`lastname` AS `lastname`,`ei`.`firstname` AS `firstname`,`ei`.`gender` AS `gender`,`e`.`address_text` AS `addresstext` from (`entityindividual` `ei` join `entity` `e` on((`e`.`objid` = `ei`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt` AS select `r`.`objid` AS `remittance_objid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`controlid` AS `controlid`,`af`.`formtype` AS `formtype`,(case when (`af`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindexno`,`c`.`formno` AS `formno`,`c`.`stub` AS `stubno`,`c`.`series` AS `series`,`c`.`receiptno` AS `receiptno`,`c`.`receiptdate` AS `receiptdate`,`c`.`amount` AS `amount`,`c`.`totalnoncash` AS `totalnoncash`,(`c`.`amount` - `c`.`totalnoncash`) AS `totalcash`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0 else `c`.`amount` end) AS `voidamount`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`payer_objid` AS `payer_objid`,`c`.`payer_name` AS `payer_name`,`c`.`collector_objid` AS `collector_objid`,`c`.`collector_name` AS `collector_name`,`c`.`collector_title` AS `collector_title`,`c`.`objid` AS `receiptid`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`org_objid` AS `org_objid` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `af` on((`af`.`objid` = `c`.`formno`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt_af`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt_af`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_af`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt_af` AS select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,min(`cr`.`receiptno`) AS `fromreceiptno`,max(`cr`.`receiptno`) AS `toreceiptno`,min(`cr`.`series`) AS `fromseries`,max(`cr`.`series`) AS `toseries`,count(`cr`.`objid`) AS `qty`,sum(`cr`.`amount`) AS `amount`,0 AS `qtyvoided`,0.0 AS `voidamt`,0 AS `qtycancelled`,0.0 AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from (((`cashreceipt` `cr` join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` union all select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,NULL AS `fromreceiptno`,NULL AS `toreceiptno`,NULL AS `fromseries`,NULL AS `toseries`,0 AS `qty`,0.0 AS `amount`,count(`cr`.`objid`) AS `qtyvoided`,sum(`cr`.`amount`) AS `voidamt`,0 AS `qtycancelled`,0.0 AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from ((((`cashreceipt` `cr` join `cashreceipt_void` `cv` on((`cv`.`receiptid` = `cr`.`objid`))) join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` union all select `cr`.`remittanceid` AS `remittanceid`,`cr`.`collector_objid` AS `collector_objid`,`cr`.`controlid` AS `controlid`,NULL AS `fromreceiptno`,NULL AS `toreceiptno`,NULL AS `fromseries`,NULL AS `toseries`,0 AS `qty`,0.0 AS `amount`,0 AS `qtyvoided`,0.0 AS `voidamt`,count(`cr`.`objid`) AS `qtycancelled`,sum(`cr`.`amount`) AS `cancelledamt`,`af`.`formtype` AS `formtype`,`af`.`serieslength` AS `serieslength`,`af`.`denomination` AS `denomination`,`cr`.`formno` AS `formno`,`afc`.`stubno` AS `stubno`,`afc`.`startseries` AS `startseries`,`afc`.`endseries` AS `endseries`,`afc`.`prefix` AS `prefix`,`afc`.`suffix` AS `suffix` from (((`cashreceipt` `cr` join `remittance` `rem` on((`rem`.`objid` = `cr`.`remittanceid`))) join `af_control` `afc` on((`cr`.`controlid` = `afc`.`objid`))) join `af` on((`afc`.`afid` = `af`.`objid`))) where (`cr`.`state` = 'CANCELLED') group by `cr`.`remittanceid`,`cr`.`collector_objid`,`cr`.`controlid`,`af`.`formtype`,`af`.`serieslength`,`af`.`denomination`,`cr`.`formno`,`afc`.`stubno`,`afc`.`startseries`,`afc`.`endseries`,`afc`.`prefix`,`afc`.`suffix` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceipt_afsummary`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceipt_afsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceipt_afsummary` AS select concat(`v`.`remittanceid`,'|',`v`.`collector_objid`,'|',`v`.`controlid`) AS `objid`,`v`.`remittanceid` AS `remittanceid`,`v`.`collector_objid` AS `collector_objid`,`v`.`controlid` AS `controlid`,min(`v`.`fromreceiptno`) AS `fromreceiptno`,max(`v`.`toreceiptno`) AS `toreceiptno`,min(`v`.`fromseries`) AS `fromseries`,max(`v`.`toseries`) AS `toseries`,sum(`v`.`qty`) AS `qty`,sum(`v`.`amount`) AS `amount`,sum(`v`.`qtyvoided`) AS `qtyvoided`,sum(`v`.`voidamt`) AS `voidamt`,sum(`v`.`qtycancelled`) AS `qtycancelled`,sum(`v`.`cancelledamt`) AS `cancelledamt`,`v`.`formtype` AS `formtype`,`v`.`serieslength` AS `serieslength`,`v`.`denomination` AS `denomination`,`v`.`formno` AS `formno`,`v`.`stubno` AS `stubno`,`v`.`startseries` AS `startseries`,`v`.`endseries` AS `endseries`,`v`.`prefix` AS `prefix`,`v`.`suffix` AS `suffix` from `vw_remittance_cashreceipt_af` `v` group by `v`.`remittanceid`,`v`.`collector_objid`,`v`.`controlid`,`v`.`formtype`,`v`.`serieslength`,`v`.`denomination`,`v`.`formno`,`v`.`stubno`,`v`.`startseries`,`v`.`endseries`,`v`.`prefix`,`v`.`suffix` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptitem`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptitem`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptitem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptitem` AS select `c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`collectiontype_name` AS `collectiontype_name`,`c`.`org_objid` AS `org_objid`,`c`.`org_name` AS `org_name`,`c`.`formtype` AS `formtype`,`c`.`formno` AS `formno`,`cri`.`receiptid` AS `receiptid`,`c`.`receiptdate` AS `receiptdate`,`c`.`receiptno` AS `receiptno`,`c`.`controlid` AS `controlid`,`c`.`series` AS `series`,`c`.`stub` AS `stubno`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`collector_objid` AS `collectorid`,`c`.`collector_name` AS `collectorname`,`c`.`collector_title` AS `collectortitle`,`cri`.`item_fund_objid` AS `fundid`,`cri`.`item_objid` AS `acctid`,`cri`.`item_code` AS `acctcode`,`cri`.`item_title` AS `acctname`,`cri`.`remarks` AS `remarks`,(case when isnull(`v`.`objid`) then `cri`.`amount` else 0.0 end) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `cri`.`amount` end) AS `voidamount`,(case when (`c`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex` from (((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptitem` `cri` on((`cri`.`receiptid` = `c`.`objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptpayment_noncash`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptpayment_noncash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptpayment_noncash` AS select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,`nc`.`reftype` AS `reftype`,`nc`.`particulars` AS `particulars`,`nc`.`fund_objid` AS `fundid`,`nc`.`refid` AS `refid`,`nc`.`amount` AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `nc`.`amount` end) AS `voidamount`,`cp`.`bankid` AS `bankid`,`cp`.`bank_name` AS `bank_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on(((`nc`.`receiptid` = `c`.`objid`) and (`nc`.`reftype` = 'CHECK')))) join `checkpayment` `cp` on((`cp`.`objid` = `nc`.`refid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) union all select `nc`.`objid` AS `objid`,`nc`.`receiptid` AS `receiptid`,`nc`.`refno` AS `refno`,`nc`.`refdate` AS `refdate`,'EFT' AS `reftype`,`nc`.`particulars` AS `particulars`,`nc`.`fund_objid` AS `fundid`,`nc`.`refid` AS `refid`,`nc`.`amount` AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `nc`.`amount` end) AS `voidamount`,`ba`.`bank_objid` AS `bankid`,`ba`.`bank_name` AS `bank_name`,`c`.`remittanceid` AS `remittanceid`,`r`.`collectionvoucherid` AS `collectionvoucherid` from (((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceiptpayment_noncash` `nc` on(((`nc`.`receiptid` = `c`.`objid`) and (`nc`.`reftype` = 'EFT')))) join `eftpayment` `eft` on((`eft`.`objid` = `nc`.`refid`))) join `bankaccount` `ba` on((`ba`.`objid` = `eft`.`bankacctid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_remittance_cashreceiptshare`
--

/*!50001 DROP TABLE IF EXISTS `vw_remittance_cashreceiptshare`*/;
/*!50001 DROP VIEW IF EXISTS `vw_remittance_cashreceiptshare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_remittance_cashreceiptshare` AS select `c`.`remittanceid` AS `remittanceid`,`r`.`controldate` AS `remittance_controldate`,`r`.`controlno` AS `remittance_controlno`,`r`.`collectionvoucherid` AS `collectionvoucherid`,`c`.`formno` AS `formno`,`c`.`formtype` AS `formtype`,`c`.`controlid` AS `controlid`,`cs`.`receiptid` AS `receiptid`,`c`.`receiptdate` AS `receiptdate`,`c`.`receiptno` AS `receiptno`,`c`.`paidby` AS `paidby`,`c`.`paidbyaddress` AS `paidbyaddress`,`c`.`org_objid` AS `org_objid`,`c`.`org_name` AS `org_name`,`c`.`collectiontype_objid` AS `collectiontype_objid`,`c`.`collectiontype_name` AS `collectiontype_name`,`c`.`collector_objid` AS `collectorid`,`c`.`collector_name` AS `collectorname`,`c`.`collector_title` AS `collectortitle`,`cs`.`refitem_objid` AS `refacctid`,`ia`.`fund_objid` AS `fundid`,`ia`.`objid` AS `acctid`,`ia`.`code` AS `acctcode`,`ia`.`title` AS `acctname`,(case when isnull(`v`.`objid`) then `cs`.`amount` else 0.0 end) AS `amount`,(case when isnull(`v`.`objid`) then 0 else 1 end) AS `voided`,(case when isnull(`v`.`objid`) then 0.0 else `cs`.`amount` end) AS `voidamount`,(case when (`c`.`formtype` = 'serial') then 0 else 1 end) AS `formtypeindex` from ((((`remittance` `r` join `cashreceipt` `c` on((`c`.`remittanceid` = `r`.`objid`))) join `cashreceipt_share` `cs` on((`cs`.`receiptid` = `c`.`objid`))) join `itemaccount` `ia` on((`ia`.`objid` = `cs`.`payableitem_objid`))) left join `cashreceipt_void` `v` on((`v`.`receiptid` = `c`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-24  7:10:20
