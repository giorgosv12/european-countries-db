DROP SCHEMA IF EXISTS `europeancountriesdb`;
CREATE SCHEMA `europeancountriesdb`;
USE `europeancountriesdb`;

-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: europeancountriesdb
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_code` char(3) NOT NULL,
  `airport_city` varchar(50) NOT NULL,
  `airport_name` varchar(50) NOT NULL,
  `num_airplanes_per_year_latest` int DEFAULT NULL,
  `num_passengers_per_year_latest` int DEFAULT NULL,
  `country_code` char(3) NOT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`airport_code`),
  UNIQUE KEY `airport_code_UNIQUE` (`airport_code`),
  KEY `fk_airport_european_country1_idx` (`country_code`),
  KEY `fk_airport_city_many_visitors1_idx` (`city_name`),
  CONSTRAINT `fk_airport_city_many_visitors1` FOREIGN KEY (`city_name`) REFERENCES `city_many_visitors` (`city_name`),
  CONSTRAINT `fk_airport_european_country1` FOREIGN KEY (`country_code`) REFERENCES `european_country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('ATH','Athens','Eleftherios Venizelos',131803,10022240,'GRC','Athens'),('BCN','Barcelona','Barcelona-El Prat',122675,12737543,'ESP','Barcelona'),('BER','Berlin','Berlin Branderburg',70873,7652143,'DEU','Berlin'),('FCO','Rome','Lenardo Da Vinci-Fiuminicino',103496,9830957,'ITA','Rome'),('IOA','Ioannina','Ioannina Airport- KING PYRROS',2122,134104,'GRC',NULL),('ORY','Paris','Orly',86424,10797105,'FRA','Paris');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `attraction`
--

DROP TABLE IF EXISTS `attraction`;
/*!50001 DROP VIEW IF EXISTS `attraction`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attraction` AS SELECT 
 1 AS `country_code`,
 1 AS `country_name`,
 1 AS `city_name`,
 1 AS `attraction_name`,
 1 AS `latitude`,
 1 AS `longitude`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `city_many_visitors`
--

DROP TABLE IF EXISTS `city_many_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_many_visitors` (
  `city_name` varchar(50) NOT NULL,
  `city_population` int DEFAULT NULL,
  `num_arrivals_per_year_latest` int DEFAULT NULL,
  `country_code` char(3) NOT NULL,
  `station_city` varchar(50) DEFAULT NULL,
  `port_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`city_name`),
  UNIQUE KEY `city_name_UNIQUE` (`city_name`),
  KEY `fk_city_many_visitors_european_country1_idx` (`country_code`),
  KEY `fk_city_many_visitors_high_speed_railway_station1_idx` (`station_city`),
  KEY `fk_city_many_visitors_port1_idx` (`port_name`),
  CONSTRAINT `fk_city_many_visitors_european_country1` FOREIGN KEY (`country_code`) REFERENCES `european_country` (`country_code`),
  CONSTRAINT `fk_city_many_visitors_high_speed_railway_station1` FOREIGN KEY (`station_city`) REFERENCES `high_speed_railway_station` (`station_city`),
  CONSTRAINT `fk_city_many_visitors_port1` FOREIGN KEY (`port_name`) REFERENCES `port` (`port_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_many_visitors`
--

LOCK TABLES `city_many_visitors` WRITE;
/*!40000 ALTER TABLE `city_many_visitors` DISABLE KEYS */;
INSERT INTO `city_many_visitors` VALUES ('Amsterdam',821752,7000000,'NLD','Amsterdam','Port of Amsterdam'),('Athens',3753783,6000000,'GRC','Athens','Port of Pireus'),('Barcelona',1620343,2100000,'ESP','Barcelona','Port of Barcelona'),('Berlin',3644826,5000000,'DEU','Berlin',NULL),('Istanbul',15460000,5000000,'TUR','Istanbul','Port of Istanbul'),('London',9002488,30000000,'GBR','London','Port of London'),('Madrid',3266126,6000000,'ESP','Madrid',NULL),('Paris',2185574,17500000,'FRA','Paris',NULL),('Pisa',91104,1632412,'ITA',NULL,NULL),('Rome',2873104,8500000,'ITA','Rome',NULL),('Thessaloniki',1012013,2500000,'GRC','Thessaloniki','Port of Thessaloniki');
/*!40000 ALTER TABLE `city_many_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connects_through_line`
--

DROP TABLE IF EXISTS `connects_through_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connects_through_line` (
  `line_name` varchar(50) NOT NULL,
  `line_length` float DEFAULT NULL,
  `speed_category` enum('less_200kmh','200_230kmh','240_260kmh','270_300kmh','310_320kmh') NOT NULL,
  `station_city` varchar(50) NOT NULL,
  PRIMARY KEY (`line_name`),
  KEY `fk_connects_through_line_high_speed_railway_station1_idx` (`station_city`),
  CONSTRAINT `fk_connects_through_line_high_speed_railway_station1` FOREIGN KEY (`station_city`) REFERENCES `high_speed_railway_station` (`station_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connects_through_line`
--

LOCK TABLES `connects_through_line` WRITE;
/*!40000 ALTER TABLE `connects_through_line` DISABLE KEYS */;
INSERT INTO `connects_through_line` VALUES ('Athens Airport-Patras railway',205.85,'200_230kmh','Athens'),('Athens-Thessaloniki railway',304.23,'200_230kmh','Thessaloniki'),('Palermo-Messina railway',194.32,'less_200kmh','Palermo'),('Paris-Est-Strasbourg-Ville railway',493,'310_320kmh','Paris'),('Skopje-Pristina railway',77.123,'less_200kmh','Pristina'),('Thessaloniki-Skopje railway',21.69,'less_200kmh','Skopje');
/*!40000 ALTER TABLE `connects_through_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covid19_cases`
--

DROP TABLE IF EXISTS `covid19_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid19_cases` (
  `num_daily_deaths` int DEFAULT NULL,
  `num_daily_cases` int DEFAULT NULL,
  `num_total_cases` int NOT NULL,
  `date` date NOT NULL,
  `country_code` char(3) NOT NULL,
  PRIMARY KEY (`country_code`,`date`),
  CONSTRAINT `fk_covid19_cases_european_country` FOREIGN KEY (`country_code`) REFERENCES `european_country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid19_cases`
--

LOCK TABLES `covid19_cases` WRITE;
/*!40000 ALTER TABLE `covid19_cases` DISABLE KEYS */;
INSERT INTO `covid19_cases` VALUES (59,25765,131340,'2021-11-24','BEL'),(0,437,131028,'2021-11-24','CYP'),(23,838,131957,'2021-11-25','CYP'),(335,66844,5497795,'2021-11-24','DEU'),(34,6777,5103315,'2021-11-24','ESP'),(98,30454,7450691,'2021-11-24','FRA'),(92,8348,894555,'2021-11-24','GRC'),(83,10044,4942135,'2021-11-24','ITA');
/*!40000 ALTER TABLE `covid19_cases` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `covid19_cases_BEFORE_INSERT` BEFORE INSERT ON `covid19_cases` FOR EACH ROW BEGIN

	IF (NEW.date <  '2019/11/01') THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `covid19_cases_BEFORE_UPDATE` BEFORE UPDATE ON `covid19_cases` FOR EACH ROW BEGIN

	IF (NEW.date <  '2019/11/01') THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `covid19_vaccinations`
--

DROP TABLE IF EXISTS `covid19_vaccinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid19_vaccinations` (
  `num_vaccinations_per_week` int DEFAULT NULL,
  `vaccination_percentage` float DEFAULT NULL,
  `vac_year` int NOT NULL,
  `vac_week` int NOT NULL,
  `country_code` char(3) NOT NULL,
  PRIMARY KEY (`vac_year`,`vac_week`,`country_code`),
  KEY `fk_covid19_vaccinations_european_country1_idx` (`country_code`),
  CONSTRAINT `fk_covid19_vaccinations_european_country1` FOREIGN KEY (`country_code`) REFERENCES `european_country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid19_vaccinations`
--

LOCK TABLES `covid19_vaccinations` WRITE;
/*!40000 ALTER TABLE `covid19_vaccinations` DISABLE KEYS */;
INSERT INTO `covid19_vaccinations` VALUES (1945,67.1,2021,47,'CYP'),(319039,68.1,2021,47,'DEU'),(48754,74.2,2021,47,'ESP'),(513888,69.4,2021,47,'FRA'),(52820,61.5,2021,47,'GRC'),(256617,72.9,2021,47,'ITA');
/*!40000 ALTER TABLE `covid19_vaccinations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `covid19_vaccinations_BEFORE_INSERT` BEFORE INSERT ON `covid19_vaccinations` FOR EACH ROW BEGIN

	IF (NEW.vac_year <  2020) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid year';

    END IF;

    

    IF (NEW.vac_week <= 0 AND NEW.vac_week > 53) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid week';

    END IF;

    

    IF (NEW.vaccination_percentage >  100) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid percentage';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `covid19_vaccinations_BEFORE_UPDATE` BEFORE UPDATE ON `covid19_vaccinations` FOR EACH ROW BEGIN

	IF (NEW.vac_year <  2020) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid year';

    END IF;

    

    IF (NEW.vac_week <= 0 AND NEW.vac_week > 53) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid week';

    END IF;

    

    IF (NEW.vaccination_percentage >  100) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid percentage';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `covid19information`
--

DROP TABLE IF EXISTS `covid19information`;
/*!50001 DROP VIEW IF EXISTS `covid19information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `covid19information` AS SELECT 
 1 AS `country_name`,
 1 AS `country_code`,
 1 AS `date`,
 1 AS `vaccination_percentage`,
 1 AS `num_daily_cases`,
 1 AS `num_daily_deaths`,
 1 AS `num_total_cases`,
 1 AS `country_population`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `european_country`
--

DROP TABLE IF EXISTS `european_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `european_country` (
  `country_code` char(3) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `area` float NOT NULL,
  `language` varchar(20) NOT NULL,
  `country_population` int NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `capital_city` varchar(50) NOT NULL,
  PRIMARY KEY (`country_code`),
  UNIQUE KEY `country_code_UNIQUE` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `european_country`
--

LOCK TABLES `european_country` WRITE;
/*!40000 ALTER TABLE `european_country` DISABLE KEYS */;
INSERT INTO `european_country` VALUES ('BEL','Euro',30528,'Dutch',11575520,'Belgium','Brussels'),('CHE','Swiss franc',41290,'German',7639961,'Switzerland','Bern'),('CYP','Euro',9251,'Greek',803200,'Cyprus','Nicosia'),('DEU','Euro',357021,'German',81440000,'Germany','Berlin'),('ESP','Euro',505990,'Spanish',47350000,'Spain','Madrid'),('FRA','Euro',547030,'French',63248000,'France','Paris'),('GBR','British pound',244820,'English',62300000,'United Kingdom','London'),('GRC','Euro',131940,'Greek',10760136,'Greece','Athens'),('ITA','Euro',301230,'Italian',60681514,'Italy','Rome'),('MCO','Euro',1.95,'French',30539,'Monaco','Monaco'),('MKD','Macedonian denar',25713,'Macedonian',1832696,'North Macedonia','Skopje'),('NLD','Euro',41543,'Dutch',17507126,'Netherlands','Amsterdam'),('PRT','Euro',92090,'Portugese',10347892,'Portugal','Lisbon'),('RUS','Russian ruble',1707400,'Russian',138739892,'Russia','Moscow'),('SRB','Serbian dinar',77474,'Serbian',7310555,'Serbia','Belgrade'),('TUR','Turkish lira',783562,'Turkish',83614362,'Turkey','Ankara'),('UNK','Euro',10887,'Serbian',1798188,'Kosovo','Pristina');
/*!40000 ALTER TABLE `european_country` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `european_country_BEFORE_INSERT` BEFORE INSERT ON `european_country` FOR EACH ROW BEGIN

	IF (NEW.area > 1800000) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid area';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `european_country_BEFORE_UPDATE` BEFORE UPDATE ON `european_country` FOR EACH ROW BEGIN

	IF (NEW.area > 1800000) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid area';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `high_speed_railway_station`
--

DROP TABLE IF EXISTS `high_speed_railway_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `high_speed_railway_station` (
  `station_city` varchar(50) NOT NULL,
  `opening_year` int DEFAULT NULL,
  `num_platforms` int DEFAULT NULL,
  `country_code` char(3) NOT NULL,
  PRIMARY KEY (`station_city`),
  UNIQUE KEY `station_city_UNIQUE` (`station_city`),
  KEY `fk_high_speed_railway_station_european_country1_idx` (`country_code`),
  CONSTRAINT `fk_high_speed_railway_station_european_country1` FOREIGN KEY (`country_code`) REFERENCES `european_country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `high_speed_railway_station`
--

LOCK TABLES `high_speed_railway_station` WRITE;
/*!40000 ALTER TABLE `high_speed_railway_station` DISABLE KEYS */;
INSERT INTO `high_speed_railway_station` VALUES ('Aigio',2020,3,'GRC'),('Amsterdam',1889,11,'NLD'),('Athens',2004,2,'GRC'),('Barcelona',1984,15,'ESP'),('Berlin',2006,8,'DEU'),('Istanbul',2009,14,'TUR'),('London',2007,4,'GBR'),('Madrid',2008,2,'ESP'),('Palermo',1886,10,'ITA'),('Paris',1852,5,'FRA'),('Pristina',1936,2,'UNK'),('Rome',1992,4,'ITA'),('Skopje',1940,2,'MKD'),('Thessaloniki',1969,6,'GRC');
/*!40000 ALTER TABLE `high_speed_railway_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monument`
--

DROP TABLE IF EXISTS `monument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monument` (
  `is_UNESCO` tinyint(1) NOT NULL,
  `start_construction_year` int DEFAULT NULL,
  `end_construction_year` int DEFAULT NULL,
  `attraction_name` varchar(50) NOT NULL,
  PRIMARY KEY (`attraction_name`),
  CONSTRAINT `fk_monument_tourist_attraction1` FOREIGN KEY (`attraction_name`) REFERENCES `tourist_attraction` (`attraction_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monument`
--

LOCK TABLES `monument` WRITE;
/*!40000 ALTER TABLE `monument` DISABLE KEYS */;
INSERT INTO `monument` VALUES (1,-447,-432,'Acropolis of Athens'),(1,72,80,'Colosseum'),(1,1887,1889,'Eiffel Tower'),(1,532,537,'Hagia Sophia'),(1,1173,1372,'Leaning Tower of Pisa'),(1,1163,1345,'Notre-Dame de Paris');
/*!40000 ALTER TABLE `monument` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monument_BEFORE_INSERT` BEFORE INSERT ON `monument` FOR EACH ROW BEGIN

	IF (NEW.is_UNESCO < 0 OR NEW.is_UNESCO > 1) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Input must be 0 or 1';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monument_BEFORE_INSERT_1` BEFORE INSERT ON `monument` FOR EACH ROW BEGIN

	IF (SELECT attraction_name FROM tourist_attraction WHERE NEW.attraction_name = tourist_attraction.attraction_name) = NULL THEN

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Monument not in tourist_attraction';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monument_BEFORE_UPDATE` BEFORE UPDATE ON `monument` FOR EACH ROW BEGIN

	IF (NEW.is_UNESCO < 0 OR NEW.is_UNESCO > 1) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Input must be 0 or 1';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monument_BEFORE_UPDATE_1` BEFORE UPDATE ON `monument` FOR EACH ROW BEGIN

	IF (SELECT attraction_name FROM tourist_attraction WHERE NEW.attraction_name = tourist_attraction.attraction_name) = NULL THEN

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Monument not in tourist_attraction';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `museum`
--

DROP TABLE IF EXISTS `museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum` (
  `num_visitors_per_year_latest` int DEFAULT NULL,
  `num_exhibits` int NOT NULL,
  `opening_year` int DEFAULT NULL,
  `museum_type` enum('general','natural_history','natural_science','science_technology','history','art') DEFAULT NULL,
  `attraction_name` varchar(50) NOT NULL,
  PRIMARY KEY (`attraction_name`),
  CONSTRAINT `fk_museum_tourist_attraction1` FOREIGN KEY (`attraction_name`) REFERENCES `tourist_attraction` (`attraction_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum`
--

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;
INSERT INTO `museum` VALUES (1666286,4250,2009,'history','Acropolis Museum'),(1275400,8000000,1753,'history','British Museum'),(500000,50000,1977,'art','Centre Georges-Pompidou'),(2700000,615797,1793,'history','Louvre Museum'),(852161,9300,1819,'art','Prado Museum'),(2680000,8000,1885,'art','Rijksmuseum');
/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `museum_BEFORE_INSERT` BEFORE INSERT ON `museum` FOR EACH ROW BEGIN

	IF (SELECT attraction_name FROM tourist_attraction WHERE NEW.attraction_name = tourist_attraction.attraction_name) = NULL THEN

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Museum not in tourist_attraction';

    END IF;

    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `museum_BEFORE_UPDATE` BEFORE UPDATE ON `museum` FOR EACH ROW BEGIN

	IF (SELECT attraction_name FROM tourist_attraction WHERE NEW.attraction_name = tourist_attraction.attraction_name) = NULL THEN

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Museum not in tourist_attraction';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port` (
  `port_name` varchar(50) NOT NULL,
  `port_location` varchar(50) DEFAULT NULL,
  `country_code` char(3) NOT NULL,
  PRIMARY KEY (`port_name`),
  UNIQUE KEY `port_name_UNIQUE` (`port_name`),
  KEY `fk_port_european_country1_idx` (`country_code`),
  CONSTRAINT `fk_port_european_country1` FOREIGN KEY (`country_code`) REFERENCES `european_country` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES ('Port of Amsterdam','Amsterdam','NLD'),('Port of Antwerp','Antwerp','BEL'),('Port of Barcelona','Barcelona','ESP'),('Port of Genoa','Genoa','ITA'),('Port of Hamburg','Hamburg','DEU'),('Port of Istanbul','Istanbul','TUR'),('Port of London','London','GBR'),('Port of Pireus','Pireus','GRC'),('Port of Rotterdam','Rotterdam','NLD'),('Port of Sines','Sines','PRT'),('Port of Thessaloniki','Thessaloniki','GRC'),('Port of Valencia','Valencia','ESP');
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist_attraction`
--

DROP TABLE IF EXISTS `tourist_attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist_attraction` (
  `attraction_name` varchar(50) NOT NULL,
  `ticket_price` float DEFAULT NULL,
  `city_name` varchar(50) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`attraction_name`),
  UNIQUE KEY `attraction_name_UNIQUE` (`attraction_name`),
  KEY `fk_tourist_attraction_city_many_visitors1_idx` (`city_name`),
  CONSTRAINT `fk_tourist_attraction_city_many_visitors1` FOREIGN KEY (`city_name`) REFERENCES `city_many_visitors` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist_attraction`
--

LOCK TABLES `tourist_attraction` WRITE;
/*!40000 ALTER TABLE `tourist_attraction` DISABLE KEYS */;
INSERT INTO `tourist_attraction` VALUES ('Acropolis Museum',5,'Athens',37.9684,23.7263),('Acropolis of Athens',20,'Athens',37.9719,23.7267),('British Museum',0,'London',51.5194,-0.126944),('Centre Georges-Pompidou',15,'Paris',48.8609,2.35055),('Colosseum',16,'Rome',41.8903,12.4922),('Eiffel Tower',26.1,'Paris',48.8583,2.29444),('Hagia Sophia',0,'Istanbul',41.0085,28.9803),('Leaning Tower of Pisa',0,'Pisa',43.7229,10.3944),('Louvre Museum',20,'Paris',48.8606,2.33545),('Notre-Dame de Paris',8.5,'Paris',48.853,2.3498),('Prado Museum',15,'Madrid',40.4138,-3.69431),('Rijksmuseum',20,'Amsterdam',52.36,4.88303);
/*!40000 ALTER TABLE `tourist_attraction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tourist_attraction_BEFORE_INSERT` BEFORE INSERT ON `tourist_attraction` FOR EACH ROW BEGIN

IF (NEW.ticket_price < 0 ) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tourist_attraction_BEFORE_UPDATE` BEFORE UPDATE ON `tourist_attraction` FOR EACH ROW BEGIN

IF (NEW.ticket_price < 0 ) THEN 

    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!50001 DROP VIEW IF EXISTS `transportation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transportation` AS SELECT 
 1 AS `country_name`,
 1 AS `country_code`,
 1 AS `airport_city`,
 1 AS `airport_name`,
 1 AS `station_city`,
 1 AS `port_name`,
 1 AS `port_location`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `attraction`
--

/*!50001 DROP VIEW IF EXISTS `attraction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attraction` AS select `eur`.`country_code` AS `country_code`,`eur`.`country_name` AS `country_name`,`b`.`city_name` AS `city_name`,`b`.`attraction_name` AS `attraction_name`,`b`.`latitude` AS `latitude`,`b`.`longitude` AS `longitude` from ((select `european_country`.`country_code` AS `country_code`,`european_country`.`country_name` AS `country_name` from `european_country`) `eur` join (select `a`.`city_name` AS `city_name`,`city_many_visitors`.`country_code` AS `country_code`,`a`.`attraction_name` AS `attraction_name`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude` from (`city_many_visitors` join (select `tourist_attraction`.`city_name` AS `city_name`,`tourist_attraction`.`attraction_name` AS `attraction_name`,`tourist_attraction`.`latitude` AS `latitude`,`tourist_attraction`.`longitude` AS `longitude` from `tourist_attraction`) `a` on((`city_many_visitors`.`city_name` = `a`.`city_name`)))) `b` on((`b`.`country_code` = `eur`.`country_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `covid19information`
--

/*!50001 DROP VIEW IF EXISTS `covid19information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `covid19information` AS select `eur`.`country_name` AS `country_name`,`eur`.`country_code` AS `country_code`,`cov`.`date` AS `date`,`cov`.`vaccination_percentage` AS `vaccination_percentage`,`cov`.`num_daily_cases` AS `num_daily_cases`,`cov`.`num_daily_deaths` AS `num_daily_deaths`,`cov`.`num_total_cases` AS `num_total_cases`,`eur`.`country_population` AS `country_population` from ((select `european_country`.`country_code` AS `country_code`,`european_country`.`country_name` AS `country_name`,`european_country`.`country_population` AS `country_population` from `european_country`) `eur` join (select `vac`.`vaccination_percentage` AS `vaccination_percentage`,`covid19_cases`.`num_daily_deaths` AS `num_daily_deaths`,`covid19_cases`.`num_daily_cases` AS `num_daily_cases`,`covid19_cases`.`num_total_cases` AS `num_total_cases`,`covid19_cases`.`date` AS `date`,`covid19_cases`.`country_code` AS `country_code` from ((select `covid19_vaccinations`.`vaccination_percentage` AS `vaccination_percentage`,`covid19_vaccinations`.`country_code` AS `country_code`,`covid19_vaccinations`.`vac_year` AS `vac_year`,`covid19_vaccinations`.`vac_week` AS `vac_week` from `covid19_vaccinations`) `vac` join `covid19_cases` on(((week(`covid19_cases`.`date`,0) = `vac`.`vac_week`) and (`vac`.`country_code` = `covid19_cases`.`country_code`) and (year(`covid19_cases`.`date`) = `vac`.`vac_year`))))) `cov` on((`eur`.`country_code` = `cov`.`country_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transportation`
--

/*!50001 DROP VIEW IF EXISTS `transportation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transportation` AS select `eur`.`c_name` AS `country_name`,`eur`.`c_code2` AS `country_code`,`final2`.`airport_city` AS `airport_city`,`final2`.`airport_name` AS `airport_name`,`final2`.`station_city` AS `station_city`,`final2`.`port_name` AS `port_name`,`final2`.`port_location` AS `port_location` from ((select `european_country`.`country_name` AS `c_name`,`european_country`.`country_code` AS `c_code2` from `european_country`) `eur` join (select `final`.`c_code` AS `c_code`,`final`.`country_name` AS `country_name`,`final`.`airport_city` AS `airport_city`,`final`.`airport_name` AS `airport_name`,`final`.`station_city` AS `station_city`,`port`.`port_name` AS `port_name`,`port`.`port_location` AS `port_location`,`port`.`country_code` AS `country_code` from ((select `eur`.`country_code` AS `c_code`,`eur`.`country_name` AS `country_name`,`eur_air_station`.`airport_city` AS `airport_city`,`eur_air_station`.`airport_name` AS `airport_name`,`eur_air_station`.`station_city` AS `station_city` from ((select `european_country`.`country_code` AS `country_code`,`european_country`.`country_name` AS `country_name` from `european_country`) `eur` join (select `high_speed_railway_station`.`country_code` AS `country_code2`,`eur_airport`.`country_code1` AS `country_code1`,`eur_airport`.`airport_city` AS `airport_city`,`eur_airport`.`airport_name` AS `airport_name`,`high_speed_railway_station`.`station_city` AS `station_city` from ((select `eur`.`country_code` AS `country_code1`,`eur`.`country_name` AS `country_name`,`airport`.`airport_city` AS `airport_city`,`airport`.`airport_name` AS `airport_name` from ((select `european_country`.`country_name` AS `country_name`,`european_country`.`country_code` AS `country_code` from `european_country`) `eur` join `airport` on((`airport`.`country_code` = `eur`.`country_code`)))) `eur_airport` left join `high_speed_railway_station` on(((`eur_airport`.`country_code1` = `high_speed_railway_station`.`country_code`) and (`eur_airport`.`airport_city` = `high_speed_railway_station`.`station_city`)))) union select `high_speed_railway_station`.`country_code` AS `country_code2`,`eur_airport`.`country_code1` AS `country_code1`,`eur_airport`.`airport_city` AS `airport_city`,`eur_airport`.`airport_name` AS `airport_name`,`high_speed_railway_station`.`station_city` AS `station_city` from (`high_speed_railway_station` left join (select `eur`.`country_code` AS `country_code1`,`eur`.`country_name` AS `country_name`,`airport`.`airport_city` AS `airport_city`,`airport`.`airport_name` AS `airport_name` from ((select `european_country`.`country_name` AS `country_name`,`european_country`.`country_code` AS `country_code` from `european_country`) `eur` join `airport` on((`airport`.`country_code` = `eur`.`country_code`)))) `eur_airport` on(((`eur_airport`.`country_code1` = `high_speed_railway_station`.`country_code`) and (`eur_airport`.`airport_city` = `high_speed_railway_station`.`station_city`))))) `eur_air_station` on(((`eur`.`country_code` = `eur_air_station`.`country_code1`) or (`eur`.`country_code` = `eur_air_station`.`country_code2`))))) `final` left join `port` on(((`port`.`country_code` = `final`.`c_code`) and ((`port`.`port_location` = `final`.`station_city`) or (`port`.`port_location` = `final`.`airport_city`))))) union select `final`.`c_code` AS `c_code`,`final`.`country_name` AS `country_name`,`final`.`airport_city` AS `airport_city`,`final`.`airport_name` AS `airport_name`,`final`.`station_city` AS `station_city`,`port`.`port_name` AS `port_name`,`port`.`port_location` AS `port_location`,`port`.`country_code` AS `country_code` from (`port` left join (select `eur`.`country_code` AS `c_code`,`eur`.`country_name` AS `country_name`,`eur_air_station`.`airport_city` AS `airport_city`,`eur_air_station`.`airport_name` AS `airport_name`,`eur_air_station`.`station_city` AS `station_city` from ((select `european_country`.`country_code` AS `country_code`,`european_country`.`country_name` AS `country_name` from `european_country`) `eur` join (select `high_speed_railway_station`.`country_code` AS `country_code2`,`eur_airport`.`country_code1` AS `country_code1`,`eur_airport`.`airport_city` AS `airport_city`,`eur_airport`.`airport_name` AS `airport_name`,`high_speed_railway_station`.`station_city` AS `station_city` from ((select `eur`.`country_code` AS `country_code1`,`eur`.`country_name` AS `country_name`,`airport`.`airport_city` AS `airport_city`,`airport`.`airport_name` AS `airport_name` from ((select `european_country`.`country_name` AS `country_name`,`european_country`.`country_code` AS `country_code` from `european_country`) `eur` join `airport` on((`airport`.`country_code` = `eur`.`country_code`)))) `eur_airport` left join `high_speed_railway_station` on(((`eur_airport`.`country_code1` = `high_speed_railway_station`.`country_code`) and (`eur_airport`.`airport_city` = `high_speed_railway_station`.`station_city`)))) union select `high_speed_railway_station`.`country_code` AS `country_code2`,`eur_airport`.`country_code1` AS `country_code1`,`eur_airport`.`airport_city` AS `airport_city`,`eur_airport`.`airport_name` AS `airport_name`,`high_speed_railway_station`.`station_city` AS `station_city` from (`high_speed_railway_station` left join (select `eur`.`country_code` AS `country_code1`,`eur`.`country_name` AS `country_name`,`airport`.`airport_city` AS `airport_city`,`airport`.`airport_name` AS `airport_name` from ((select `european_country`.`country_name` AS `country_name`,`european_country`.`country_code` AS `country_code` from `european_country`) `eur` join `airport` on((`airport`.`country_code` = `eur`.`country_code`)))) `eur_airport` on(((`eur_airport`.`country_code1` = `high_speed_railway_station`.`country_code`) and (`eur_airport`.`airport_city` = `high_speed_railway_station`.`station_city`))))) `eur_air_station` on(((`eur`.`country_code` = `eur_air_station`.`country_code1`) or (`eur`.`country_code` = `eur_air_station`.`country_code2`))))) `final` on(((`port`.`country_code` = `final`.`c_code`) and ((`port`.`port_location` = `final`.`station_city`) or (`port`.`port_location` = `final`.`airport_city`)))))) `final2` on(((`final2`.`c_code` = `eur`.`c_code2`) or (`final2`.`country_code` = `eur`.`c_code2`)))) */;
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

-- Dump completed on 2021-12-14 20:23:10
