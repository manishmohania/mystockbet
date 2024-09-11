-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: nse
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bhavcopy_nse_fo`
--

DROP TABLE IF EXISTS `bhavcopy_nse_fo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhavcopy_nse_fo` (
  `TradDt` date NOT NULL,
  `BizDt` date NOT NULL,
  `Sgmt` char(2) DEFAULT NULL,
  `Src` char(3) DEFAULT NULL,
  `FinInstrmTp` char(3) DEFAULT NULL,
  `FinInstrmId` int(11) DEFAULT NULL,
  `ISIN` varchar(255) DEFAULT NULL,
  `TckrSymb` varchar(255) DEFAULT NULL,
  `SctySrs` varchar(255) DEFAULT NULL,
  `XpryDt` date DEFAULT NULL,
  `FininstrmActlXpryDt` date DEFAULT NULL,
  `StrkPric` decimal(18,2) DEFAULT NULL,
  `OptnTp` varchar(2) DEFAULT NULL,
  `FinInstrmNm` varchar(255) NOT NULL,
  `OpnPric` decimal(18,2) DEFAULT NULL,
  `HghPric` decimal(18,2) DEFAULT NULL,
  `LwPric` decimal(18,2) DEFAULT NULL,
  `ClsPric` decimal(18,2) DEFAULT NULL,
  `LastPric` decimal(18,2) DEFAULT NULL,
  `PrvsClsgPric` decimal(18,2) DEFAULT NULL,
  `UndrlygPric` decimal(18,2) DEFAULT NULL,
  `SttlmPric` decimal(18,2) DEFAULT NULL,
  `OpnIntrst` decimal(25,0) DEFAULT NULL,
  `ChngInOpnIntrst` decimal(25,0) DEFAULT NULL,
  `TtlTradgVol` decimal(25,0) DEFAULT NULL,
  `TtlTrfVal` decimal(28,2) DEFAULT NULL,
  `TtlNbOfTxsExctd` decimal(25,0) DEFAULT NULL,
  `SsnId` varchar(2) DEFAULT NULL,
  `NewBrdLotQty` decimal(25,0) DEFAULT NULL,
  `Rmks` varchar(255) DEFAULT NULL,
  `Rsvd1` varchar(255) DEFAULT NULL,
  `Rsvd2` varchar(255) DEFAULT NULL,
  `Rsvd3` varchar(255) DEFAULT NULL,
  `Rsvd4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TradDt`,`BizDt`,`FinInstrmNm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_52_wk_high_low`
--

DROP TABLE IF EXISTS `cm_52_wk_high_low`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_52_wk_high_low` (
  `ddate` date NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `series` char(2) NOT NULL,
  `adjusted_52_week_high` decimal(18,2) DEFAULT NULL,
  `52_week_high_date` date DEFAULT NULL,
  `adjusted_52_week_low` decimal(18,2) DEFAULT NULL,
  `52_week_low_dt` date DEFAULT NULL,
  PRIMARY KEY (`ddate`,`symbol`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmvolt`
--

DROP TABLE IF EXISTS `cmvolt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmvolt` (
  `ddate` date NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `underlying_close_price_a` double(18,2) DEFAULT NULL,
  `underlying_previous_day_close_price_b` double(18,2) DEFAULT NULL,
  `underlying_log_returns_c` double(18,4) DEFAULT NULL,
  `previous_day_underlying_volatility_d` double(18,4) DEFAULT NULL,
  `current_day_underlying_daily_volatility_e` double(18,4) DEFAULT NULL,
  `underlying_annualised_volatility_f` double(18,4) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_fcm_intrm_bc_be_eq_w_close`
--

DROP TABLE IF EXISTS `ema_fcm_intrm_bc_be_eq_w_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_fcm_intrm_bc_be_eq_w_close` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_sec_bhavdata_full_be_eq_w_close`
--

DROP TABLE IF EXISTS `ema_sec_bhavdata_full_be_eq_w_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_sec_bhavdata_full_be_eq_w_close` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`
--

DROP TABLE IF EXISTS `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_fcm_intrm_bc_be_eq_close`
--

DROP TABLE IF EXISTS `ema_v_fcm_intrm_bc_be_eq_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_fcm_intrm_bc_be_eq_close` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd`
--

DROP TABLE IF EXISTS `ema_v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_sec_bhavdata_full_be_eq_close`
--

DROP TABLE IF EXISTS `ema_v_sec_bhavdata_full_be_eq_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_sec_bhavdata_full_be_eq_close` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_sec_bhavdata_full_be_eq_deliv_per_deliv_per`
--

DROP TABLE IF EXISTS `ema_v_sec_bhavdata_full_be_eq_deliv_per_deliv_per`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_sec_bhavdata_full_be_eq_deliv_per_deliv_per` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_sec_bhavdata_full_be_eq_deliv_qty_deliv_qty`
--

DROP TABLE IF EXISTS `ema_v_sec_bhavdata_full_be_eq_deliv_qty_deliv_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_sec_bhavdata_full_be_eq_deliv_qty_deliv_qty` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`
--

DROP TABLE IF EXISTS `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_sec_bhavdata_full_be_eq_w_deliv_per_deliv_per`
--

DROP TABLE IF EXISTS `ema_v_sec_bhavdata_full_be_eq_w_deliv_per_deliv_per`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_sec_bhavdata_full_be_eq_w_deliv_per_deliv_per` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ema_v_sec_bhavdata_full_be_eq_w_deliv_qty_deliv_qty`
--

DROP TABLE IF EXISTS `ema_v_sec_bhavdata_full_be_eq_w_deliv_qty_deliv_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ema_v_sec_bhavdata_full_be_eq_w_deliv_qty_deliv_qty` (
  `symbol` varchar(50) NOT NULL,
  `ddatetime` datetime NOT NULL,
  `ema_1` decimal(28,2) DEFAULT NULL,
  `ema_2` decimal(28,2) DEFAULT NULL,
  `ema_3` decimal(28,2) DEFAULT NULL,
  `ema_5` decimal(28,2) DEFAULT NULL,
  `ema_8` decimal(28,2) DEFAULT NULL,
  `ema_9` decimal(28,2) DEFAULT NULL,
  `ema_10` decimal(28,2) DEFAULT NULL,
  `ema_11` decimal(28,2) DEFAULT NULL,
  `ema_12` decimal(28,2) DEFAULT NULL,
  `ema_13` decimal(28,2) DEFAULT NULL,
  `ema_14` decimal(28,2) DEFAULT NULL,
  `ema_20` decimal(28,2) DEFAULT NULL,
  `ema_21` decimal(28,2) DEFAULT NULL,
  `ema_26` decimal(28,2) DEFAULT NULL,
  `ema_34` decimal(28,2) DEFAULT NULL,
  `ema_50` decimal(28,2) DEFAULT NULL,
  `ema_55` decimal(28,2) DEFAULT NULL,
  `ema_89` decimal(28,2) DEFAULT NULL,
  `ema_100` decimal(28,2) DEFAULT NULL,
  `ema_144` decimal(28,2) DEFAULT NULL,
  `ema_200` decimal(28,2) DEFAULT NULL,
  `ema_233` decimal(28,2) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`symbol`,`id`),
  UNIQUE KEY `symbol` (`symbol`,`ddatetime`),
  KEY `symbol_2` (`symbol`,`ddatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fcm_intrm_bc`
--

DROP TABLE IF EXISTS `fcm_intrm_bc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fcm_intrm_bc` (
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `var1` varchar(1) DEFAULT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `open` decimal(18,2) DEFAULT NULL,
  `high` decimal(18,2) DEFAULT NULL,
  `low` decimal(18,2) DEFAULT NULL,
  `close` decimal(18,2) DEFAULT NULL,
  `var2` varchar(1) DEFAULT NULL,
  `var3` varchar(1) DEFAULT NULL,
  `var4` varchar(1) DEFAULT NULL,
  `var5` varchar(1) DEFAULT NULL,
  `var6` varchar(1) DEFAULT NULL,
  `ddate` date NOT NULL,
  `var7` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`symbol`,`series`,`ddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fcm_intrm_bc_be_eq_w`
--

DROP TABLE IF EXISTS `fcm_intrm_bc_be_eq_w`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fcm_intrm_bc_be_eq_w` (
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `open` decimal(18,2) DEFAULT NULL,
  `high` decimal(18,2) DEFAULT NULL,
  `low` decimal(18,2) DEFAULT NULL,
  `close` decimal(18,2) DEFAULT NULL,
  `ddate` date NOT NULL,
  `ddatetime` datetime NOT NULL,
  `sd` date DEFAULT NULL,
  `ed` date DEFAULT NULL,
  `wy` int(11) NOT NULL,
  `ww` int(11) NOT NULL,
  PRIMARY KEY (`symbol`,`series`,`ddate`,`wy`,`ww`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fo_bhav`
--

DROP TABLE IF EXISTS `fo_bhav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fo_bhav` (
  `instrument` varchar(10) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `expiry_dt` date NOT NULL,
  `strike_pr` decimal(18,2) NOT NULL,
  `option_typ` varchar(3) NOT NULL,
  `open` decimal(18,2) DEFAULT NULL,
  `high` decimal(18,2) DEFAULT NULL,
  `low` decimal(18,2) DEFAULT NULL,
  `close` decimal(18,2) DEFAULT NULL,
  `settle_pr` decimal(18,2) DEFAULT NULL,
  `contracts` decimal(25,0) DEFAULT NULL,
  `val_inlakh` decimal(28,2) DEFAULT NULL,
  `open_int` decimal(25,0) DEFAULT NULL,
  `chg_in_oi` decimal(25,0) DEFAULT NULL,
  `ddate` date NOT NULL,
  PRIMARY KEY (`symbol`,`instrument`,`ddate`,`expiry_dt`,`option_typ`,`strike_pr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `fo_symbols`
--

DROP TABLE IF EXISTS `fo_symbols`;
/*!50001 DROP VIEW IF EXISTS `fo_symbols`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `fo_symbols` AS SELECT
 1 AS `FinInstrmNm` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ma_advance_decline`
--

DROP TABLE IF EXISTS `ma_advance_decline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_advance_decline` (
  `ddate` date NOT NULL,
  `advances` int(11) DEFAULT NULL,
  `declines` int(11) DEFAULT NULL,
  `unchanged` int(11) DEFAULT NULL,
  `securities_price_band_hit_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ma_nifty_index`
--

DROP TABLE IF EXISTS `ma_nifty_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_nifty_index` (
  `ddate` date NOT NULL,
  `index_name` varchar(255) NOT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `open` decimal(18,2) DEFAULT NULL,
  `high` decimal(18,2) DEFAULT NULL,
  `low` decimal(18,2) DEFAULT NULL,
  `close` decimal(18,2) DEFAULT NULL,
  `gain_or_loss` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ma_securities_price_volume_data`
--

DROP TABLE IF EXISTS `ma_securities_price_volume_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_securities_price_volume_data` (
  `ddate` date NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `traded_value` decimal(28,2) DEFAULT NULL,
  `traded_quantity` decimal(25,0) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`symbol`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ma_summary`
--

DROP TABLE IF EXISTS `ma_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_summary` (
  `ddate` date NOT NULL,
  `summary_dt` date DEFAULT NULL,
  `summary_stmt` varchar(255) DEFAULT NULL,
  `traded_value_in_cr` decimal(28,2) DEFAULT NULL,
  `traded_quantity_in_lakhs` decimal(28,2) DEFAULT NULL,
  `number_of_trades` decimal(25,0) DEFAULT NULL,
  `total_mkt_capitalisation_in_cr` decimal(28,2) DEFAULT NULL,
  PRIMARY KEY (`ddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ma_top_25_securities_today`
--

DROP TABLE IF EXISTS `ma_top_25_securities_today`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_top_25_securities_today` (
  `ddate` date NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `var_in_percent` decimal(18,2) DEFAULT NULL,
  `value_in_cr` decimal(28,2) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`symbol`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ma_top_5_nifty_50_gainers`
--

DROP TABLE IF EXISTS `ma_top_5_nifty_50_gainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_top_5_nifty_50_gainers` (
  `ddate` date NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `change_in_percent` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`symbol`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ma_top_5_nifty_50_losers`
--

DROP TABLE IF EXISTS `ma_top_5_nifty_50_losers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ma_top_5_nifty_50_losers` (
  `ddate` date NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `close_price` decimal(18,2) DEFAULT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `change_in_percent` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`symbol`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `market_data_all_indices`
--

DROP TABLE IF EXISTS `market_data_all_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_data_all_indices` (
  `ddate` date NOT NULL DEFAULT current_timestamp(),
  `jsonDoc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`jsonDoc`)),
  PRIMARY KEY (`ddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `md_all_indices_advance_decline`
--

DROP TABLE IF EXISTS `md_all_indices_advance_decline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_all_indices_advance_decline` (
  `ddate` date NOT NULL,
  `index_name` varchar(255) NOT NULL,
  `advances` int(11) DEFAULT NULL,
  `declines` int(11) DEFAULT NULL,
  `unchanged` int(11) DEFAULT NULL,
  PRIMARY KEY (`ddate`,`index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nifty_100`
--

DROP TABLE IF EXISTS `nifty_100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nifty_100` (
  `symbol` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `isincode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nifty_200`
--

DROP TABLE IF EXISTS `nifty_200`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nifty_200` (
  `symbol` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `isincode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nifty_50`
--

DROP TABLE IF EXISTS `nifty_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nifty_50` (
  `symbol` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `isincode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nifty_500`
--

DROP TABLE IF EXISTS `nifty_500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nifty_500` (
  `symbol` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `isincode` varchar(255) DEFAULT NULL,
  `series` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nifty_next_50`
--

DROP TABLE IF EXISTS `nifty_next_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nifty_next_50` (
  `symbol` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `isincode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sec_bhavdata_full`
--

DROP TABLE IF EXISTS `sec_bhavdata_full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_bhavdata_full` (
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `ddate` date NOT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `open_price` decimal(18,2) NOT NULL,
  `high_price` decimal(18,2) NOT NULL,
  `low_price` decimal(18,2) NOT NULL,
  `last_price` decimal(18,2) DEFAULT NULL,
  `close_price` decimal(18,2) NOT NULL,
  `avg_price` decimal(18,2) NOT NULL,
  `ttl_trd_qnty` decimal(25,0) NOT NULL,
  `turnover_lacs` decimal(28,2) NOT NULL,
  `no_of_trades` decimal(25,0) NOT NULL,
  `deliv_qty` decimal(25,0) DEFAULT NULL,
  `deliv_per` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`symbol`,`series`,`ddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sec_bhavdata_full_be_eq_w`
--

DROP TABLE IF EXISTS `sec_bhavdata_full_be_eq_w`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_bhavdata_full_be_eq_w` (
  `symbol` varchar(255) NOT NULL,
  `series` varchar(2) NOT NULL,
  `ddate` date NOT NULL,
  `ddatetime` datetime NOT NULL,
  `prev_close` decimal(18,2) DEFAULT NULL,
  `open` decimal(18,2) NOT NULL,
  `high` decimal(18,2) NOT NULL,
  `low` decimal(18,2) NOT NULL,
  `last_price` decimal(18,2) DEFAULT NULL,
  `close` decimal(18,2) NOT NULL,
  `avg_price` decimal(18,2) NOT NULL,
  `ttl_trd_qnty` decimal(25,0) NOT NULL,
  `turnover_lacs` decimal(28,2) NOT NULL,
  `no_of_trades` decimal(25,0) NOT NULL,
  `deliv_qty` decimal(25,0) DEFAULT NULL,
  `deliv_per` decimal(6,2) DEFAULT NULL,
  `sd` date DEFAULT NULL,
  `ed` date DEFAULT NULL,
  `wy` int(11) NOT NULL,
  `ww` int(11) NOT NULL,
  PRIMARY KEY (`symbol`,`series`,`ddate`,`wy`,`ww`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensex_30`
--

DROP TABLE IF EXISTS `sensex_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensex_30` (
  `symbol` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`symbol`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_fcm_intrm_bc_be_eq`
--

DROP TABLE IF EXISTS `v_fcm_intrm_bc_be_eq`;
/*!50001 DROP VIEW IF EXISTS `v_fcm_intrm_bc_be_eq`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_fcm_intrm_bc_be_eq` AS SELECT
 1 AS `name`,
  1 AS `symbol`,
  1 AS `series`,
  1 AS `prev_close`,
  1 AS `open`,
  1 AS `high`,
  1 AS `low`,
  1 AS `close`,
  1 AS `ddate`,
  1 AS `ddatetime` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close`
--

DROP TABLE IF EXISTS `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close`;
/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`
--

DROP TABLE IF EXISTS `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`;
/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close`
--

DROP TABLE IF EXISTS `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close`;
/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`
--

DROP TABLE IF EXISTS `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`;
/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close`
--

DROP TABLE IF EXISTS `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close`;
/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`
--

DROP TABLE IF EXISTS `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`;
/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close`
--

DROP TABLE IF EXISTS `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close`;
/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`
--

DROP TABLE IF EXISTS `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`;
/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` AS SELECT
 1 AS `symbol`,
  1 AS `ddatetime`,
  1 AS `macd` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_md_all_indices_advance_decline`
--

DROP TABLE IF EXISTS `v_md_all_indices_advance_decline`;
/*!50001 DROP VIEW IF EXISTS `v_md_all_indices_advance_decline`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_md_all_indices_advance_decline` AS SELECT
 1 AS `ddate`,
  1 AS `index_name`,
  1 AS `advances`,
  1 AS `declines`,
  1 AS `unchanged` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sec_bhavdata_full_be_eq`
--

DROP TABLE IF EXISTS `v_sec_bhavdata_full_be_eq`;
/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sec_bhavdata_full_be_eq` AS SELECT
 1 AS `symbol`,
  1 AS `series`,
  1 AS `ddate`,
  1 AS `ddatetime`,
  1 AS `prev_close`,
  1 AS `open`,
  1 AS `high`,
  1 AS `low`,
  1 AS `last_price`,
  1 AS `close`,
  1 AS `avg_price`,
  1 AS `ttl_trd_qnty`,
  1 AS `turnover_lacs`,
  1 AS `no_of_trades`,
  1 AS `deliv_qty`,
  1 AS `deliv_per` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sec_bhavdata_full_be_eq_deliv_per`
--

DROP TABLE IF EXISTS `v_sec_bhavdata_full_be_eq_deliv_per`;
/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_deliv_per`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sec_bhavdata_full_be_eq_deliv_per` AS SELECT
 1 AS `symbol`,
  1 AS `series`,
  1 AS `ddate`,
  1 AS `ddatetime`,
  1 AS `prev_close`,
  1 AS `open`,
  1 AS `high`,
  1 AS `low`,
  1 AS `last_price`,
  1 AS `close`,
  1 AS `avg_price`,
  1 AS `ttl_trd_qnty`,
  1 AS `turnover_lacs`,
  1 AS `no_of_trades`,
  1 AS `deliv_qty`,
  1 AS `deliv_per` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sec_bhavdata_full_be_eq_deliv_qty`
--

DROP TABLE IF EXISTS `v_sec_bhavdata_full_be_eq_deliv_qty`;
/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_deliv_qty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sec_bhavdata_full_be_eq_deliv_qty` AS SELECT
 1 AS `symbol`,
  1 AS `series`,
  1 AS `ddate`,
  1 AS `ddatetime`,
  1 AS `prev_close`,
  1 AS `open`,
  1 AS `high`,
  1 AS `low`,
  1 AS `last_price`,
  1 AS `close`,
  1 AS `avg_price`,
  1 AS `ttl_trd_qnty`,
  1 AS `turnover_lacs`,
  1 AS `no_of_trades`,
  1 AS `deliv_qty`,
  1 AS `deliv_per` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sec_bhavdata_full_be_eq_w_deliv_per`
--

DROP TABLE IF EXISTS `v_sec_bhavdata_full_be_eq_w_deliv_per`;
/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_w_deliv_per`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sec_bhavdata_full_be_eq_w_deliv_per` AS SELECT
 1 AS `symbol`,
  1 AS `series`,
  1 AS `ddate`,
  1 AS `ddatetime`,
  1 AS `prev_close`,
  1 AS `open`,
  1 AS `high`,
  1 AS `low`,
  1 AS `last_price`,
  1 AS `close`,
  1 AS `avg_price`,
  1 AS `ttl_trd_qnty`,
  1 AS `turnover_lacs`,
  1 AS `no_of_trades`,
  1 AS `deliv_qty`,
  1 AS `deliv_per`,
  1 AS `sd`,
  1 AS `ed`,
  1 AS `wy`,
  1 AS `ww` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sec_bhavdata_full_be_eq_w_deliv_qty`
--

DROP TABLE IF EXISTS `v_sec_bhavdata_full_be_eq_w_deliv_qty`;
/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_w_deliv_qty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sec_bhavdata_full_be_eq_w_deliv_qty` AS SELECT
 1 AS `symbol`,
  1 AS `series`,
  1 AS `ddate`,
  1 AS `ddatetime`,
  1 AS `prev_close`,
  1 AS `open`,
  1 AS `high`,
  1 AS `low`,
  1 AS `last_price`,
  1 AS `close`,
  1 AS `avg_price`,
  1 AS `ttl_trd_qnty`,
  1 AS `turnover_lacs`,
  1 AS `no_of_trades`,
  1 AS `deliv_qty`,
  1 AS `deliv_per`,
  1 AS `sd`,
  1 AS `ed`,
  1 AS `wy`,
  1 AS `ww` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vp_1_atr`
--

DROP TABLE IF EXISTS `vp_1_atr`;
/*!50001 DROP VIEW IF EXISTS `vp_1_atr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vp_1_atr` AS SELECT
 1 AS `symbol`,
  1 AS `mn`,
  1 AS `mx`,
  1 AS `atr`,
  1 AS `n`,
  1 AS `p1`,
  1 AS `p2`,
  1 AS `v`,
  1 AS `zl`,
  1 AS `zh` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vp_w_1_atr`
--

DROP TABLE IF EXISTS `vp_w_1_atr`;
/*!50001 DROP VIEW IF EXISTS `vp_w_1_atr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vp_w_1_atr` AS SELECT
 1 AS `symbol`,
  1 AS `mn`,
  1 AS `mx`,
  1 AS `atr`,
  1 AS `n`,
  1 AS `p1`,
  1 AS `p2`,
  1 AS `v`,
  1 AS `zl`,
  1 AS `zh` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'nse'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `dtparamf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` FUNCTION `dtparamf`() RETURNS date
    NO SQL
    DETERMINISTIC
return @dtparam ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `emaf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` FUNCTION `emaf`(c decimal(28,2),  p SMALLINT, prev_ema decimal(28,2)) RETURNS decimal(28,2)
    DETERMINISTIC
BEGIN
DECLARE v_k decimal(28,26);
DECLARE v_s decimal(28,2);
SET v_s = 2.0;

SET v_k = v_s / (1.0 + p);
RETURN (c * v_k) + (prev_ema * (1.0-v_k));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_and_load_ema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` PROCEDURE `calculate_and_load_ema`(IN vtn varchar(255), IN vfn varchar(255))
begin
DECLARE done BOOL DEFAULT false;
DECLARE vs varchar(255);
DECLARE vn decimal(28,2);
DECLARE vddatetime datetime;


DECLARE cur CURSOR FOR select symbol, ddatetime, n FROM tmp_ema_target_to_process order by symbol,ddatetime asc; 

DECLARE CONTINUE HANDLER
FOR NOT FOUND SET done = true;

SET @ema_tn_fn:=CONCAT('ema_',vtn,'_',vfn);

DROP TABLE IF EXISTS tmp_ema_target_to_process;

SET @q1:=CONCAT('CREATE TEMPORARY TABLE tmp_ema_target_to_process as SELECT t.symbol, t.ddatetime, t.',vfn,' as n from ', vtn, ' t left join ', @ema_tn_fn , ' e on t.symbol=e.symbol and t.ddatetime = e.ddatetime where e.symbol is null');

PREPARE stmt1 FROM @q1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;



SET @v_prev_ema_id := NULL;
    SET @v_prev_ema_symbol := NULL;
    SET @v_prev_ema_ddatetime := NULL;
    SET @v_prev_ema_1 := NULL;
    SET @v_prev_ema_2 := NULL;
    SET @v_prev_ema_3 := NULL;
    SET @v_prev_ema_5 := NULL;
    SET @v_prev_ema_8 := NULL;
    SET @v_prev_ema_9 := NULL;
    SET @v_prev_ema_10 := NULL;
    SET @v_prev_ema_11 := NULL;
    SET @v_prev_ema_12 := NULL;
    SET @v_prev_ema_13 := NULL;
    SET @v_prev_ema_14 := NULL;
    SET @v_prev_ema_20 := NULL;
    SET @v_prev_ema_21 := NULL;
    SET @v_prev_ema_26 := NULL;
    SET @v_prev_ema_34 := NULL;
    SET @v_prev_ema_50 := NULL;
    SET @v_prev_ema_55 := NULL;
    SET @v_prev_ema_89 := NULL;
    SET @v_prev_ema_100 := NULL;
    SET @v_prev_ema_144 := NULL;
    SET @v_prev_ema_200 := NULL;
    SET @v_prev_ema_233 := NULL;





OPEN cur;

letmr: LOOP
    SET done=false;
    FETCH cur INTO vs, vddatetime, vn;

    IF done = true THEN
        LEAVE letmr;
    END IF;

    IF (@v_prev_ema_id IS NULL OR @v_prev_ema_symbol IS NULL OR @v_prev_ema_ddatetime IS NULL OR @v_prev_ema_symbol <> vs) THEN
    SET @v_prev_ema_id := NULL;
    SET @v_prev_ema_symbol := NULL;
    SET @v_prev_ema_ddatetime := NULL;
    SET @v_prev_ema_1 := NULL;
    SET @v_prev_ema_2 := NULL;
    SET @v_prev_ema_3 := NULL;
    SET @v_prev_ema_5 := NULL;
    SET @v_prev_ema_8 := NULL;
    SET @v_prev_ema_9 := NULL;
    SET @v_prev_ema_10 := NULL;
    SET @v_prev_ema_11 := NULL;
    SET @v_prev_ema_12 := NULL;
    SET @v_prev_ema_13 := NULL;
    SET @v_prev_ema_14 := NULL;
    SET @v_prev_ema_20 := NULL;
    SET @v_prev_ema_21 := NULL;
    SET @v_prev_ema_26 := NULL;
    SET @v_prev_ema_34 := NULL;
    SET @v_prev_ema_50 := NULL;
    SET @v_prev_ema_55 := NULL;
    SET @v_prev_ema_89 := NULL;
    SET @v_prev_ema_100 := NULL;
    SET @v_prev_ema_144 := NULL;
    SET @v_prev_ema_200 := NULL;
    SET @v_prev_ema_233 := NULL;


    SET @q2:=CONCAT('select id,symbol,ddatetime,ema_1,ema_2,ema_3,ema_5,ema_8,ema_9,ema_10,ema_11,ema_12,ema_13,ema_14,ema_20,ema_21,ema_26,ema_34,ema_50,ema_55,ema_89,ema_100,ema_144,ema_200,ema_233 into @v_prev_ema_id,@v_prev_ema_symbol,@v_prev_ema_ddatetime,@v_prev_ema_1,@v_prev_ema_2,@v_prev_ema_3,@v_prev_ema_5,@v_prev_ema_8,@v_prev_ema_9,@v_prev_ema_10,@v_prev_ema_11,@v_prev_ema_12,@v_prev_ema_13,@v_prev_ema_14,@v_prev_ema_20,@v_prev_ema_21,@v_prev_ema_26,@v_prev_ema_34,@v_prev_ema_50,@v_prev_ema_55,@v_prev_ema_89,@v_prev_ema_100,@v_prev_ema_144,@v_prev_ema_200,@v_prev_ema_233 from ', @ema_tn_fn, ' where symbol = ? and ddatetime < ? order by ddatetime desc LIMIT 1');
PREPARE stmt2 FROM @q2;
EXECUTE stmt2 USING vs, vddatetime;
DEALLOCATE PREPARE stmt2;

ELSEIF (@v_prev_ema_id IS NOT NULL and @v_prev_ema_ddatetime IS NOT NULL and @v_prev_ema_symbol = vs) THEN
    SET @v_prev_ema_1 := NULL;
    SET @v_prev_ema_2 := NULL;
    SET @v_prev_ema_3 := NULL;
    SET @v_prev_ema_5 := NULL;
    SET @v_prev_ema_8 := NULL;
    SET @v_prev_ema_9 := NULL;
    SET @v_prev_ema_10 := NULL;
    SET @v_prev_ema_11 := NULL;
    SET @v_prev_ema_12 := NULL;
    SET @v_prev_ema_13 := NULL;
    SET @v_prev_ema_14 := NULL;
    SET @v_prev_ema_20 := NULL;
    SET @v_prev_ema_21 := NULL;
    SET @v_prev_ema_26 := NULL;
    SET @v_prev_ema_34 := NULL;
    SET @v_prev_ema_50 := NULL;
    SET @v_prev_ema_55 := NULL;
    SET @v_prev_ema_89 := NULL;
    SET @v_prev_ema_100 := NULL;
    SET @v_prev_ema_144 := NULL;
    SET @v_prev_ema_200 := NULL;
    SET @v_prev_ema_233 := NULL;

SET @q2:=CONCAT('select id,symbol,ddatetime,ema_1,ema_2,ema_3,ema_5,ema_8,ema_9,ema_10,ema_11,ema_12,ema_13,ema_14,ema_20,ema_21,ema_26,ema_34,ema_50,ema_55,ema_89,ema_100,ema_144,ema_200,ema_233 into @v_prev_ema_id,@v_prev_ema_symbol,@v_prev_ema_ddatetime,@v_prev_ema_1,@v_prev_ema_2,@v_prev_ema_3,@v_prev_ema_5,@v_prev_ema_8,@v_prev_ema_9,@v_prev_ema_10,@v_prev_ema_11,@v_prev_ema_12,@v_prev_ema_13,@v_prev_ema_14,@v_prev_ema_20,@v_prev_ema_21,@v_prev_ema_26,@v_prev_ema_34,@v_prev_ema_50,@v_prev_ema_55,@v_prev_ema_89,@v_prev_ema_100,@v_prev_ema_144,@v_prev_ema_200,@v_prev_ema_233 from ', @ema_tn_fn, ' where symbol = ? and ddatetime = ? and id = ? order by ddatetime desc LIMIT 1');
PREPARE stmt2 FROM @q2;
EXECUTE stmt2 USING vs, @v_prev_ema_ddatetime,@v_prev_ema_id;
DEALLOCATE PREPARE stmt2;


END IF;


IF @v_prev_ema_id IS NULL THEN
    SET @q3:=CONCAT('INSERT INTO ',@ema_tn_fn,' SELECT ? as symbol, ? as ddatetime,? as ema_1, NULL as ema_2, NULL as ema_3, NULL as ema_5, NULL as ema_8, NULL as ema_9, NULL as ema_10, NULL as ema_11, NULL as ema_12, NULL as ema_13, NULL as ema_14,NULL as ema_20, NULL as ema_21, NULL as ema_26, NULL as ema_34, NULL as ema_50, NULL as ema_55, NULL as ema_89, NULL as ema_100, NULL as ema_144, NULL as ema_200, NULL as ema_233, NULL as id WHERE NOT EXISTS (SELECT 1 FROM ',@ema_tn_fn,' t WHERE t.ddatetime=? and t.symbol=?)');
    
PREPARE stmt3 FROM @q3;

EXECUTE stmt3 USING vs, vddatetime, vn, vddatetime, vs  ;
SELECT LAST_INSERT_ID() INTO @v_prev_ema_id;
SET @v_prev_ema_symbol:=vs;
SET @v_prev_ema_ddatetime:=vddatetime;

DEALLOCATE PREPARE stmt3;


ELSE

    SET @q4:=CONCAT('INSERT INTO ',@ema_tn_fn,' SELECT ? as symbol, ? as ddatetime, ', IF((@v_prev_ema_id+1) = 1, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_1'), IF(@v_prev_ema_1 IS NULL, 'NULL as ema_1', concat('(SELECT emaf(',vn,', 1, @v_prev_ema_1)) as ema_1') )  )



,',', IF((@v_prev_ema_id+1) = 2, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_2'), IF(@v_prev_ema_2 IS NULL, 'NULL as ema_2', concat('(SELECT emaf(',vn,', 2, @v_prev_ema_2)) as ema_2') )  )
,',', IF((@v_prev_ema_id+1) = 3, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_3'), IF(@v_prev_ema_3 IS NULL, 'NULL as ema_3', concat('(SELECT emaf(',vn,', 3, @v_prev_ema_3)) as ema_3') )  )


,',', IF((@v_prev_ema_id+1) = 5, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_5'), IF(@v_prev_ema_5 IS NULL, 'NULL as ema_5', concat('(SELECT emaf(',vn,', 5, @v_prev_ema_5)) as ema_5') )  )
,',', IF((@v_prev_ema_id+1) = 8, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_8'), IF(@v_prev_ema_8 IS NULL, 'NULL as ema_8', concat('(SELECT emaf(',vn,', 8, @v_prev_ema_8)) as ema_8') )  )
,',', IF((@v_prev_ema_id+1) = 9, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_9'), IF(@v_prev_ema_9 IS NULL, 'NULL as ema_9', concat('(SELECT emaf(',vn,', 9, @v_prev_ema_9)) as ema_9') )  )
,',', IF((@v_prev_ema_id+1) = 10, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_10'), IF(@v_prev_ema_10 IS NULL, 'NULL as ema_10', concat('(SELECT emaf(',vn,', 10, @v_prev_ema_10)) as ema_10') )  )
,',', IF((@v_prev_ema_id+1) = 11, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_11'), IF(@v_prev_ema_11 IS NULL, 'NULL as ema_11', concat('(SELECT emaf(',vn,', 11, @v_prev_ema_11)) as ema_11') )  )
,',', IF((@v_prev_ema_id+1) = 12, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_12'), IF(@v_prev_ema_12 IS NULL, 'NULL as ema_12', concat('(SELECT emaf(',vn,', 12, @v_prev_ema_12)) as ema_12') )  )
,',', IF((@v_prev_ema_id+1) = 13, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_13'), IF(@v_prev_ema_13 IS NULL, 'NULL as ema_13', concat('(SELECT emaf(',vn,', 13, @v_prev_ema_13)) as ema_13') )  )
,',', IF((@v_prev_ema_id+1) = 14, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_14'), IF(@v_prev_ema_14 IS NULL, 'NULL as ema_14', concat('(SELECT emaf(',vn,', 14, @v_prev_ema_14)) as ema_14') )  )
,',', IF((@v_prev_ema_id+1) = 20, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_20'), IF(@v_prev_ema_20 IS NULL, 'NULL as ema_20', concat('(SELECT emaf(',vn,', 20, @v_prev_ema_20)) as ema_20') )  )
,',', IF((@v_prev_ema_id+1) = 21, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_21'), IF(@v_prev_ema_21 IS NULL, 'NULL as ema_21', concat('(SELECT emaf(',vn,', 21, @v_prev_ema_21)) as ema_21') )  )
,',', IF((@v_prev_ema_id+1) = 26, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_26'), IF(@v_prev_ema_26 IS NULL, 'NULL as ema_26', concat('(SELECT emaf(',vn,', 26, @v_prev_ema_26)) as ema_26') )  )
,',', IF((@v_prev_ema_id+1) = 34, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_34'), IF(@v_prev_ema_34 IS NULL, 'NULL as ema_34', concat('(SELECT emaf(',vn,', 34, @v_prev_ema_34)) as ema_34') )  )
,',', IF((@v_prev_ema_id+1) = 50, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_50'), IF(@v_prev_ema_50 IS NULL, 'NULL as ema_50', concat('(SELECT emaf(',vn,', 50, @v_prev_ema_50)) as ema_50') )  )
,',', IF((@v_prev_ema_id+1) = 55, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_55'), IF(@v_prev_ema_55 IS NULL, 'NULL as ema_55', concat('(SELECT emaf(',vn,', 55, @v_prev_ema_55)) as ema_55') )  )
,',', IF((@v_prev_ema_id+1) = 89, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_89'), IF(@v_prev_ema_89 IS NULL, 'NULL as ema_89', concat('(SELECT emaf(',vn,', 89, @v_prev_ema_89)) as ema_89') )  )
,',', IF((@v_prev_ema_id+1) = 100, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_100'), IF(@v_prev_ema_100 IS NULL, 'NULL as ema_100', concat('(SELECT emaf(',vn,', 100, @v_prev_ema_100)) as ema_100') )  )
,',', IF((@v_prev_ema_id+1) = 144, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_144'), IF(@v_prev_ema_144 IS NULL, 'NULL as ema_144', concat('(SELECT emaf(',vn,', 144, @v_prev_ema_144)) as ema_144') )  )
,',', IF((@v_prev_ema_id+1) = 200, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_200'), IF(@v_prev_ema_200 IS NULL, 'NULL as ema_200', concat('(SELECT emaf(',vn,', 200, @v_prev_ema_200)) as ema_200') )  )
,',', IF((@v_prev_ema_id+1) = 233, CONCAT('(SELECT avg(',vfn,') from ',vtn, ' t where t.symbol = ? and t.ddatetime <= ? order by t.ddatetime desc LIMIT ? ) as ema_233'), IF(@v_prev_ema_233 IS NULL, 'NULL as ema_233', concat('(SELECT emaf(',vn,', 233, @v_prev_ema_233)) as ema_233') )  )
, ', NULL as id WHERE NOT EXISTS (SELECT 1 FROM ',@ema_tn_fn,' t WHERE t.ddatetime=? and t.symbol=?)'


    ); 

PREPARE stmt4 FROM @q4;
       IF ((@v_prev_ema_id+1) = 1 OR 
(@v_prev_ema_id+1) = 2 OR 
(@v_prev_ema_id+1) = 3 OR 
(@v_prev_ema_id+1) = 5 OR 
(@v_prev_ema_id+1) = 8 OR 
(@v_prev_ema_id+1) = 9 OR 
(@v_prev_ema_id+1) = 10 OR 
(@v_prev_ema_id+1) = 11 OR 
(@v_prev_ema_id+1) = 12 OR 
(@v_prev_ema_id+1) = 13 OR 
(@v_prev_ema_id+1) = 14 OR 
(@v_prev_ema_id+1) = 20 OR 
(@v_prev_ema_id+1) = 21 OR 
(@v_prev_ema_id+1) = 26 OR 
(@v_prev_ema_id+1) = 34 OR 
(@v_prev_ema_id+1) = 50 OR 
(@v_prev_ema_id+1) = 55 OR 
(@v_prev_ema_id+1) = 89 OR 
(@v_prev_ema_id+1) = 100 OR 
(@v_prev_ema_id+1) = 144 OR 
(@v_prev_ema_id+1) = 200 OR (@v_prev_ema_id+1) = 233) THEN


EXECUTE stmt4 USING vs, vddatetime, vs, vddatetime, (@v_prev_ema_id+1) ,vddatetime, vs  ;
SELECT  LAST_INSERT_ID() INTO @v_prev_ema_id;
SET @v_prev_ema_symbol:=vs;
SET @v_prev_ema_ddatetime:=vddatetime;

ELSE

EXECUTE stmt4 USING vs, vddatetime ,vddatetime, vs  ;
SELECT LAST_INSERT_ID() INTO @v_prev_ema_id;
SET @v_prev_ema_symbol:=vs;
SET @v_prev_ema_ddatetime:=vddatetime;

END IF;
DEALLOCATE PREPARE stmt4;



END IF;


END LOOP;




end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_and_load_fcm_intrm_bc_be_eq_w` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` PROCEDURE `calculate_and_load_fcm_intrm_bc_be_eq_w`(vy int, vw int)
begin

INSERT INTO fcm_intrm_bc_be_eq_w
WITH
w_ohlc as (
select symbol, series, prev_close, open, high, low, close, ddate, ddatetime from v_fcm_intrm_bc_be_eq i
 where series IN ('BE','EQ')
and week(ddate) = vw and year(ddate)=vy )
select tw_hl.symbol as symbol, tw_o.series as `series`, (select close from v_fcm_intrm_bc_be_eq d where d.symbol=tw_hl.symbol and d.series IN ('BE','EQ') and d.ddate >= subdate(sd, INTERVAL 1 WEEK) and  d.ddate < sd order by d.ddate desc LIMIT 1) as prev_close, open, high, low, close, sd as ddate, sd as ddatetime, sd, ed, year(sd) as wy, week(sd) as ww  from (select symbol, max(high) as `high`, min(low) as `low` from w_ohlc whl group by symbol) tw_hl inner join
(select symbol, series, ddate as sd, open as `open` from
(select symbol, series, ddate, open, ROW_NUMBER() OVER (PARTITION BY symbol ORDER BY ddate asc) row_num from w_ohlc) two where two.row_num=1 ) tw_o on tw_o.symbol = tw_hl.symbol
inner join
(select symbol, ddate as ed, close as `close` from
(select symbol, ddate, close, ROW_NUMBER() OVER (PARTITION BY symbol ORDER BY ddate desc) row_num from w_ohlc) twc where twc.row_num=1) tw_c on tw_c.symbol=tw_hl.symbol  
WHERE NOT EXISTS (SELECT 1 FROM fcm_intrm_bc_be_eq_w dit where dit.symbol=tw_hl.symbol and dit.ddate=tw_o.sd and dit.series=tw_o.series and dit.wy=year(tw_o.sd) and dit.ww=week(tw_o.sd));


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_and_load_sec_bhavdata_full_be_eq_w` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` PROCEDURE `calculate_and_load_sec_bhavdata_full_be_eq_w`(vy int, vw int)
begin

INSERT INTO sec_bhavdata_full_be_eq_w
WITH
w_ohlc as (
select symbol, series, ddate, prev_close, open, high, low, last_price, close, avg_price, ttl_trd_qnty, turnover_lacs, no_of_trades,deliv_qty,deliv_per  from v_sec_bhavdata_full_be_eq i
 where series IN ('BE','EQ')
and week(ddate) = vw and year(ddate)=vy )
select tw_hl.symbol as symbol, tw_o.series as `series`, sd as ddate, sd as ddatetime, (select close from v_sec_bhavdata_full_be_eq d where d.symbol=tw_hl.symbol and d.series IN ('BE','EQ') and d.ddate >= subdate(sd, INTERVAL 1 WEEK) and  d.ddate < sd order by d.ddate desc LIMIT 1) as `prev_close`, open, high, low, last_price, close,  avg_price, ttl_trd_qnty, turnover_lacs, no_of_trades, deliv_qty, deliv_per, sd, ed, year(sd) as wy, week(sd) as ww  from (select symbol, max(high) as `high`, min(low) as `low`, avg(avg_price) as `avg_price`, sum(ttl_trd_qnty) as `ttl_trd_qnty` , sum(turnover_lacs) as `turnover_lacs`, sum(no_of_trades) as `no_of_trades`, sum(deliv_qty) as `deliv_qty`,  ((sum(deliv_qty)/sum(ttl_trd_qnty))*100) as `deliv_per`   from w_ohlc whl group by symbol) tw_hl inner join
(select symbol, series, ddate as sd, open as `open` from
(select symbol, series, ddate, open , ROW_NUMBER() OVER (PARTITION BY symbol ORDER BY ddate asc) row_num from w_ohlc) two where two.row_num=1 ) tw_o on tw_o.symbol = tw_hl.symbol
inner join
(select symbol, ddate as ed, close as `close`, last_price as `last_price` from
(select symbol, ddate, close , last_price, ROW_NUMBER() OVER (PARTITION BY symbol ORDER BY ddate desc) row_num from w_ohlc) twc where twc.row_num=1) tw_c on tw_c.symbol=tw_hl.symbol  
WHERE NOT EXISTS(SELECT 1 FROM sec_bhavdata_full_be_eq_w dit where dit.symbol=tw_hl.symbol and dit.ddate=tw_o.sd and dit.series=tw_o.series and dit.wy=year(tw_o.sd) and dit.ww=week(tw_o.sd));

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tmp_load_bc_eq_w` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` PROCEDURE `tmp_load_bc_eq_w`()
begin
DECLARE done BOOL DEFAULT false;
DECLARE vy int;
DECLARE vw int;
DECLARE cur CURSOR FOR SELECT   year(a.ddate) as y, week(a.ddate) as w FROM v_fcm_intrm_bc_be_eq a group by year(a.ddate),week(a.ddate)   order by  year(a.ddate) asc, week(a.ddate) asc;

DECLARE CONTINUE HANDLER
FOR NOT FOUND SET done = true;

OPEN cur;
lbceq: LOOP
FETCH cur INTO vy, vw;
IF done = true THEN
LEAVE lbceq;
END IF;

call calculate_and_load_fcm_intrm_bc_be_eq_w(vy, vw);

END LOOP;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tmp_load_bdf_eq_w` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` PROCEDURE `tmp_load_bdf_eq_w`()
begin
DECLARE done BOOL DEFAULT false;
DECLARE vy int;
DECLARE vw int;
DECLARE cur CURSOR FOR SELECT   year(a.ddate) as y, week(a.ddate) as w FROM v_sec_bhavdata_full_be_eq a group by year(a.ddate),week(a.ddate)   order by  year(a.ddate) asc, week(a.ddate) asc;

DECLARE CONTINUE HANDLER
FOR NOT FOUND SET done = true;

OPEN cur;
lbceq: LOOP
FETCH cur INTO vy, vw;
IF done = true THEN
LEAVE lbceq;
END IF;

call calculate_and_load_sec_bhavdata_full_be_eq_w(vy, vw);

END LOOP;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tmp_load_ema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`manish`@`localhost` PROCEDURE `tmp_load_ema`()
begin
DECLARE done BOOL DEFAULT false;
DECLARE vdd datetime;
DECLARE cur CURSOR FOR SELECT distinct a.ddatetime as vd FROM v_fcm_intrm_bc_be_eq a order by a.ddatetime asc ;

DECLARE CONTINUE HANDLER
FOR NOT FOUND SET done = true;

OPEN cur;
lema: LOOP
FETCH cur INTO vdd;
IF done = true THEN
LEAVE lema;
END IF;

call calculate_and_load_ema(vdd, 'v_fcm_intrm_bc_be_eq', 'close');

END LOOP;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `fo_symbols`
--

/*!50001 DROP VIEW IF EXISTS `fo_symbols`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fo_symbols` AS select `p`.`FinInstrmNm` AS `FinInstrmNm` from (select `fo`.`FinInstrmNm` AS `FinInstrmNm`,`fo`.`FinInstrmTp` AS `FinInstrmTp`,`fo`.`OptnTp` AS `OptnTp`,row_number() over ( partition by `fo`.`TradDt`,`fo`.`TckrSymb`,`fo`.`XpryDt`,`fo`.`OptnTp` order by `fo`.`StrkPric`) AS `rn` from (`bhavcopy_nse_fo` `fo` join (select max(`bhavcopy_nse_fo`.`TradDt`) AS `mtdt` from `bhavcopy_nse_fo`) `t` on(`t`.`mtdt` = `fo`.`TradDt`)) where `fo`.`XpryDt` > `fo`.`TradDt` and `fo`.`StrkPric` >= `fo`.`UndrlygPric` and `fo`.`FinInstrmTp` in ('STO','IDO') order by `fo`.`StrkPric`) `p` where `p`.`rn` <= 8 union select `p`.`FinInstrmNm` AS `FinInstrmNm` from (select `fo`.`FinInstrmNm` AS `FinInstrmNm`,`fo`.`FinInstrmTp` AS `FinInstrmTp`,`fo`.`OptnTp` AS `OptnTp`,row_number() over ( partition by `fo`.`TradDt`,`fo`.`TckrSymb`,`fo`.`XpryDt`,`fo`.`OptnTp` order by `fo`.`StrkPric` desc) AS `rn` from (`bhavcopy_nse_fo` `fo` join (select max(`bhavcopy_nse_fo`.`TradDt`) AS `mtdt` from `bhavcopy_nse_fo`) `t` on(`t`.`mtdt` = `fo`.`TradDt`)) where `fo`.`XpryDt` > `fo`.`TradDt` and `fo`.`StrkPric` < `fo`.`UndrlygPric` and `fo`.`FinInstrmTp` in ('STO','IDO') order by `fo`.`StrkPric`) `p` where `p`.`rn` <= 8 union select `fo`.`FinInstrmNm` AS `FinInstrmNm` from (`bhavcopy_nse_fo` `fo` join (select max(`bhavcopy_nse_fo`.`TradDt`) AS `mtdt` from `bhavcopy_nse_fo`) `t` on(`t`.`mtdt` = `fo`.`TradDt`)) where `fo`.`FinInstrmTp` in ('STF','IDF') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fcm_intrm_bc_be_eq`
--

/*!50001 DROP VIEW IF EXISTS `v_fcm_intrm_bc_be_eq`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fcm_intrm_bc_be_eq` AS select `a`.`name` AS `name`,`a`.`symbol` AS `symbol`,`a`.`series` AS `series`,`a`.`prev_close` AS `prev_close`,`a`.`open` AS `open`,`a`.`high` AS `high`,`a`.`low` AS `low`,`a`.`close` AS `close`,`a`.`ddate` AS `ddate`,`a`.`ddate` AS `ddatetime` from `fcm_intrm_bc` `a` where `a`.`series` in ('BE','EQ') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close` AS (select `ema_fcm_intrm_bc_be_eq_w_close`.`symbol` AS `symbol`,`ema_fcm_intrm_bc_be_eq_w_close`.`ddatetime` AS `ddatetime`,`ema_fcm_intrm_bc_be_eq_w_close`.`ema_12` - `ema_fcm_intrm_bc_be_eq_w_close`.`ema_26` AS `macd` from `ema_fcm_intrm_bc_be_eq_w_close` where `ema_fcm_intrm_bc_be_eq_w_close`.`ema_26` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` AS (select `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`symbol` AS `symbol`,`ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ddatetime` AS `ddatetime`,`ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ema_12` - `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ema_26` AS `macd` from `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` where `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ema_26` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close` AS (select `ema_v_fcm_intrm_bc_be_eq_close`.`symbol` AS `symbol`,`ema_v_fcm_intrm_bc_be_eq_close`.`ddatetime` AS `ddatetime`,`ema_v_fcm_intrm_bc_be_eq_close`.`ema_12` - `ema_v_fcm_intrm_bc_be_eq_close`.`ema_26` AS `macd` from `ema_v_fcm_intrm_bc_be_eq_close` where `ema_v_fcm_intrm_bc_be_eq_close`.`ema_26` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` AS (select `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`symbol` AS `symbol`,`ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ddatetime` AS `ddatetime`,`ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ema_12` - `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ema_26` AS `macd` from `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` where `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ema_26` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close` AS (select `ema_fcm_intrm_bc_be_eq_w_close`.`symbol` AS `symbol`,`ema_fcm_intrm_bc_be_eq_w_close`.`ddatetime` AS `ddatetime`,`ema_fcm_intrm_bc_be_eq_w_close`.`ema_5` - `ema_fcm_intrm_bc_be_eq_w_close`.`ema_8` AS `macd` from `ema_fcm_intrm_bc_be_eq_w_close` where `ema_fcm_intrm_bc_be_eq_w_close`.`ema_8` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` AS (select `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`symbol` AS `symbol`,`ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ddatetime` AS `ddatetime`,`ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ema_5` - `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ema_8` AS `macd` from `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty` where `ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty`.`ema_8` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close` AS (select `ema_v_fcm_intrm_bc_be_eq_close`.`symbol` AS `symbol`,`ema_v_fcm_intrm_bc_be_eq_close`.`ddatetime` AS `ddatetime`,`ema_v_fcm_intrm_bc_be_eq_close`.`ema_5` - `ema_v_fcm_intrm_bc_be_eq_close`.`ema_8` AS `macd` from `ema_v_fcm_intrm_bc_be_eq_close` where `ema_v_fcm_intrm_bc_be_eq_close`.`ema_8` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`
--

/*!50001 DROP VIEW IF EXISTS `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` AS (select `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`symbol` AS `symbol`,`ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ddatetime` AS `ddatetime`,`ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ema_5` - `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ema_8` AS `macd` from `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty` where `ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty`.`ema_8` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_md_all_indices_advance_decline`
--

/*!50001 DROP VIEW IF EXISTS `v_md_all_indices_advance_decline`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_md_all_indices_advance_decline` AS (select `t`.`ddate` AS `ddate`,`t`.`index_name` AS `index_name`,`t`.`advances` AS `advances`,`t`.`declines` AS `declines`,`t`.`unchanged` AS `unchanged` from `md_all_indices_advance_decline` `t` where `t`.`index_name` not in ('INDIA VIX','NIFTY GS 10YR','NIFTY GS 10YR CLN','NIFTY GS 11 15YR','NIFTY GS 15YRPLUS','NIFTY GS 4 8YR','NIFTY GS 8 13YR','NIFTY GS COMPSITE','NIFTY100ESGSECLDR','NIFTY50 DIV POINT','NIFTY50 PR 1X INV','NIFTY50 PR 2X LEV','NIFTY50 TR 1X INV','NIFTY50 TR 2X LEV')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sec_bhavdata_full_be_eq`
--

/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sec_bhavdata_full_be_eq` AS select `a`.`symbol` AS `symbol`,`a`.`series` AS `series`,`a`.`ddate` AS `ddate`,`a`.`ddate` AS `ddatetime`,`a`.`prev_close` AS `prev_close`,`a`.`open_price` AS `open`,`a`.`high_price` AS `high`,`a`.`low_price` AS `low`,`a`.`last_price` AS `last_price`,`a`.`close_price` AS `close`,`a`.`avg_price` AS `avg_price`,`a`.`ttl_trd_qnty` AS `ttl_trd_qnty`,`a`.`turnover_lacs` AS `turnover_lacs`,`a`.`no_of_trades` AS `no_of_trades`,`a`.`deliv_qty` AS `deliv_qty`,`a`.`deliv_per` AS `deliv_per` from `sec_bhavdata_full` `a` where `a`.`series` in ('BE','EQ') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sec_bhavdata_full_be_eq_deliv_per`
--

/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_deliv_per`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sec_bhavdata_full_be_eq_deliv_per` AS select `t`.`symbol` AS `symbol`,`t`.`series` AS `series`,`t`.`ddate` AS `ddate`,`t`.`ddatetime` AS `ddatetime`,`t`.`prev_close` AS `prev_close`,`t`.`open` AS `open`,`t`.`high` AS `high`,`t`.`low` AS `low`,`t`.`last_price` AS `last_price`,`t`.`close` AS `close`,`t`.`avg_price` AS `avg_price`,`t`.`ttl_trd_qnty` AS `ttl_trd_qnty`,`t`.`turnover_lacs` AS `turnover_lacs`,`t`.`no_of_trades` AS `no_of_trades`,`t`.`deliv_qty` AS `deliv_qty`,`t`.`deliv_per` AS `deliv_per` from `v_sec_bhavdata_full_be_eq` `t` where `t`.`deliv_per` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sec_bhavdata_full_be_eq_deliv_qty`
--

/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_deliv_qty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sec_bhavdata_full_be_eq_deliv_qty` AS select `t`.`symbol` AS `symbol`,`t`.`series` AS `series`,`t`.`ddate` AS `ddate`,`t`.`ddatetime` AS `ddatetime`,`t`.`prev_close` AS `prev_close`,`t`.`open` AS `open`,`t`.`high` AS `high`,`t`.`low` AS `low`,`t`.`last_price` AS `last_price`,`t`.`close` AS `close`,`t`.`avg_price` AS `avg_price`,`t`.`ttl_trd_qnty` AS `ttl_trd_qnty`,`t`.`turnover_lacs` AS `turnover_lacs`,`t`.`no_of_trades` AS `no_of_trades`,`t`.`deliv_qty` AS `deliv_qty`,`t`.`deliv_per` AS `deliv_per` from `v_sec_bhavdata_full_be_eq` `t` where `t`.`deliv_qty` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sec_bhavdata_full_be_eq_w_deliv_per`
--

/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_w_deliv_per`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sec_bhavdata_full_be_eq_w_deliv_per` AS select `t`.`symbol` AS `symbol`,`t`.`series` AS `series`,`t`.`ddate` AS `ddate`,`t`.`ddatetime` AS `ddatetime`,`t`.`prev_close` AS `prev_close`,`t`.`open` AS `open`,`t`.`high` AS `high`,`t`.`low` AS `low`,`t`.`last_price` AS `last_price`,`t`.`close` AS `close`,`t`.`avg_price` AS `avg_price`,`t`.`ttl_trd_qnty` AS `ttl_trd_qnty`,`t`.`turnover_lacs` AS `turnover_lacs`,`t`.`no_of_trades` AS `no_of_trades`,`t`.`deliv_qty` AS `deliv_qty`,`t`.`deliv_per` AS `deliv_per`,`t`.`sd` AS `sd`,`t`.`ed` AS `ed`,`t`.`wy` AS `wy`,`t`.`ww` AS `ww` from `sec_bhavdata_full_be_eq_w` `t` where `t`.`deliv_per` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sec_bhavdata_full_be_eq_w_deliv_qty`
--

/*!50001 DROP VIEW IF EXISTS `v_sec_bhavdata_full_be_eq_w_deliv_qty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sec_bhavdata_full_be_eq_w_deliv_qty` AS select `t`.`symbol` AS `symbol`,`t`.`series` AS `series`,`t`.`ddate` AS `ddate`,`t`.`ddatetime` AS `ddatetime`,`t`.`prev_close` AS `prev_close`,`t`.`open` AS `open`,`t`.`high` AS `high`,`t`.`low` AS `low`,`t`.`last_price` AS `last_price`,`t`.`close` AS `close`,`t`.`avg_price` AS `avg_price`,`t`.`ttl_trd_qnty` AS `ttl_trd_qnty`,`t`.`turnover_lacs` AS `turnover_lacs`,`t`.`no_of_trades` AS `no_of_trades`,`t`.`deliv_qty` AS `deliv_qty`,`t`.`deliv_per` AS `deliv_per`,`t`.`sd` AS `sd`,`t`.`ed` AS `ed`,`t`.`wy` AS `wy`,`t`.`ww` AS `ww` from `sec_bhavdata_full_be_eq_w` `t` where `t`.`deliv_qty` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vp_1_atr`
--

/*!50001 DROP VIEW IF EXISTS `vp_1_atr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vp_1_atr` AS (select `u`.`symbol` AS `symbol`,`u`.`mn` AS `mn`,`u`.`mx` AS `mx`,`u`.`atr` AS `atr`,`u`.`n` AS `n`,`u`.`p1` AS `p1`,`u`.`p2` AS `p2`,sum(case when `u`.`open` >= `u`.`p1` and `u`.`open` < `u`.`p2` or `u`.`high` >= `u`.`p1` and `u`.`high` < `u`.`p2` or `u`.`low` >= `u`.`p1` and `u`.`low` < `u`.`p2` or `u`.`close` >= `u`.`p1` and `u`.`close` < `u`.`p2` or `u`.`last_price` >= `u`.`p1` and `u`.`last_price` < `u`.`p2` or `u`.`avg_price` >= `u`.`p1` and `u`.`avg_price` < `u`.`p2` then `u`.`ttl_trd_qnty` else 0 end) AS `v`,min(case when `u`.`open` >= `u`.`p1` and `u`.`open` < `u`.`p2` or `u`.`high` >= `u`.`p1` and `u`.`high` < `u`.`p2` or `u`.`low` >= `u`.`p1` and `u`.`low` < `u`.`p2` or `u`.`close` >= `u`.`p1` and `u`.`close` < `u`.`p2` or `u`.`last_price` >= `u`.`p1` and `u`.`last_price` < `u`.`p2` or `u`.`avg_price` >= `u`.`p1` and `u`.`avg_price` < `u`.`p2` then `u`.`low` else `u`.`p2` end) AS `zl`,max(case when `u`.`open` >= `u`.`p1` and `u`.`open` < `u`.`p2` or `u`.`high` >= `u`.`p1` and `u`.`high` < `u`.`p2` or `u`.`low` >= `u`.`p1` and `u`.`low` < `u`.`p2` or `u`.`close` >= `u`.`p1` and `u`.`close` < `u`.`p2` or `u`.`last_price` >= `u`.`p1` and `u`.`last_price` < `u`.`p2` or `u`.`avg_price` >= `u`.`p1` and `u`.`avg_price` < `u`.`p2` then `u`.`high` else `u`.`p1` end) AS `zh` from (select `p`.`symbol` AS `symbol`,`p`.`mn` AS `mn`,`p`.`mx` AS `mx`,`p`.`atr` AS `atr`,`q`.`n` AS `n`,`p`.`mn` + (`q`.`n` - 1) * `p`.`atr` AS `p1`,`p`.`mn` + `q`.`n` * `p`.`atr` AS `p2`,`s`.`open` AS `open`,`s`.`high` AS `high`,`s`.`low` AS `low`,`s`.`close` AS `close`,`s`.`last_price` AS `last_price`,`s`.`avg_price` AS `avg_price`,`s`.`ttl_trd_qnty` AS `ttl_trd_qnty` from (((select `g`.`symbol` AS `symbol`,min(`g`.`low`) AS `mn`,max(`g`.`high`) AS `mx`,avg(`g`.`high` - `g`.`low`) AS `atr` from `v_sec_bhavdata_full_be_eq` `g` where `g`.`ddate` > curdate() - interval 1825 day group by `g`.`symbol`) `p` join (select `r`.`symbol` AS `symbol`,row_number() over ( partition by `r`.`symbol`) AS `n` from `v_sec_bhavdata_full_be_eq` `r` where `r`.`ddate` > curdate() - interval 1825 day) `q`) join (select `v_sec_bhavdata_full_be_eq`.`symbol` AS `symbol`,`v_sec_bhavdata_full_be_eq`.`open` AS `open`,`v_sec_bhavdata_full_be_eq`.`high` AS `high`,`v_sec_bhavdata_full_be_eq`.`low` AS `low`,`v_sec_bhavdata_full_be_eq`.`close` AS `close`,`v_sec_bhavdata_full_be_eq`.`last_price` AS `last_price`,`v_sec_bhavdata_full_be_eq`.`avg_price` AS `avg_price`,`v_sec_bhavdata_full_be_eq`.`ttl_trd_qnty` AS `ttl_trd_qnty` from `v_sec_bhavdata_full_be_eq` where `v_sec_bhavdata_full_be_eq`.`ddate` > curdate() - interval 1825 day) `s`) where `p`.`symbol` = `q`.`symbol` and `q`.`symbol` = `s`.`symbol` and `p`.`mn` + (`q`.`n` - 1) * `p`.`atr` <= `p`.`mx`) `u` group by `u`.`symbol`,`u`.`mn`,`u`.`mx`,`u`.`atr`,`u`.`n`,`u`.`p1`,`u`.`p2`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vp_w_1_atr`
--

/*!50001 DROP VIEW IF EXISTS `vp_w_1_atr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manish`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vp_w_1_atr` AS (select `u`.`symbol` AS `symbol`,`u`.`mn` AS `mn`,`u`.`mx` AS `mx`,`u`.`atr` AS `atr`,`u`.`n` AS `n`,`u`.`p1` AS `p1`,`u`.`p2` AS `p2`,sum(case when `u`.`open` >= `u`.`p1` and `u`.`open` < `u`.`p2` or `u`.`high` >= `u`.`p1` and `u`.`high` < `u`.`p2` or `u`.`low` >= `u`.`p1` and `u`.`low` < `u`.`p2` or `u`.`close` >= `u`.`p1` and `u`.`close` < `u`.`p2` or `u`.`last_price` >= `u`.`p1` and `u`.`last_price` < `u`.`p2` or `u`.`avg_price` >= `u`.`p1` and `u`.`avg_price` < `u`.`p2` then `u`.`ttl_trd_qnty` else 0 end) AS `v`,min(case when `u`.`open` >= `u`.`p1` and `u`.`open` < `u`.`p2` or `u`.`high` >= `u`.`p1` and `u`.`high` < `u`.`p2` or `u`.`low` >= `u`.`p1` and `u`.`low` < `u`.`p2` or `u`.`close` >= `u`.`p1` and `u`.`close` < `u`.`p2` or `u`.`last_price` >= `u`.`p1` and `u`.`last_price` < `u`.`p2` or `u`.`avg_price` >= `u`.`p1` and `u`.`avg_price` < `u`.`p2` then `u`.`low` else `u`.`p2` end) AS `zl`,max(case when `u`.`open` >= `u`.`p1` and `u`.`open` < `u`.`p2` or `u`.`high` >= `u`.`p1` and `u`.`high` < `u`.`p2` or `u`.`low` >= `u`.`p1` and `u`.`low` < `u`.`p2` or `u`.`close` >= `u`.`p1` and `u`.`close` < `u`.`p2` or `u`.`last_price` >= `u`.`p1` and `u`.`last_price` < `u`.`p2` or `u`.`avg_price` >= `u`.`p1` and `u`.`avg_price` < `u`.`p2` then `u`.`high` else `u`.`p1` end) AS `zh` from (select `p`.`symbol` AS `symbol`,`p`.`mn` AS `mn`,`p`.`mx` AS `mx`,`p`.`atr` AS `atr`,`q`.`n` AS `n`,`p`.`mn` + (`q`.`n` - 1) * `p`.`atr` AS `p1`,`p`.`mn` + `q`.`n` * `p`.`atr` AS `p2`,`s`.`open` AS `open`,`s`.`high` AS `high`,`s`.`low` AS `low`,`s`.`close` AS `close`,`s`.`last_price` AS `last_price`,`s`.`avg_price` AS `avg_price`,`s`.`ttl_trd_qnty` AS `ttl_trd_qnty` from (((select `g`.`symbol` AS `symbol`,min(`g`.`low`) AS `mn`,max(`g`.`high`) AS `mx`,avg(`g`.`high` - `g`.`low`) AS `atr` from `sec_bhavdata_full_be_eq_w` `g` where `g`.`ddate` > curdate() - interval 1825 day group by `g`.`symbol`) `p` join (select `r`.`symbol` AS `symbol`,row_number() over ( partition by `r`.`symbol`) AS `n` from `sec_bhavdata_full_be_eq_w` `r` where `r`.`ddate` > curdate() - interval 1825 day) `q`) join (select `sec_bhavdata_full_be_eq_w`.`symbol` AS `symbol`,`sec_bhavdata_full_be_eq_w`.`open` AS `open`,`sec_bhavdata_full_be_eq_w`.`high` AS `high`,`sec_bhavdata_full_be_eq_w`.`low` AS `low`,`sec_bhavdata_full_be_eq_w`.`close` AS `close`,`sec_bhavdata_full_be_eq_w`.`last_price` AS `last_price`,`sec_bhavdata_full_be_eq_w`.`avg_price` AS `avg_price`,`sec_bhavdata_full_be_eq_w`.`ttl_trd_qnty` AS `ttl_trd_qnty` from `sec_bhavdata_full_be_eq_w` where `sec_bhavdata_full_be_eq_w`.`ddate` > curdate() - interval 1825 day) `s`) where `p`.`symbol` = `q`.`symbol` and `q`.`symbol` = `s`.`symbol` and `p`.`mn` + (`q`.`n` - 1) * `p`.`atr` <= `p`.`mx`) `u` group by `u`.`symbol`,`u`.`mn`,`u`.`mx`,`u`.`atr`,`u`.`n`,`u`.`p1`,`u`.`p2`) */;
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

-- Dump completed on 2024-09-11 20:23:06
