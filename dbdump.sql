-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activitiy_id` int NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `activities` enum('Go to school','Work meeting','Dog feeding','Afternoon walk','Morning exercise','Karate lesson','Yoga lesson','Football training','Dinner with family','Wake up') NOT NULL,
  PRIMARY KEY (`activitiy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'2024-11-28 06:00:00','2024-11-28 12:00:00','Go to school'),(2,'2024-11-28 08:00:00','2024-11-28 09:00:00','Morning exercise'),(3,'2024-11-28 12:00:00','2024-11-28 13:30:00','Work meeting'),(4,'2024-11-28 14:00:00','2024-11-28 14:30:00','Dog feeding'),(5,'2024-11-28 16:00:00','2024-11-28 17:00:00','Afternoon walk'),(6,'2024-11-28 18:00:00','2024-11-28 19:30:00','Dinner with family'),(7,'2024-11-28 15:00:00','2024-11-28 17:00:00','Karate lesson');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Activities_BEFORE_INSERT` BEFORE INSERT ON `activities` FOR EACH ROW BEGIN
     IF NEW.end_time<=NEW.start_time THEN
          SIGNAL SQLSTATE '45000'
		  SET MESSAGE_TEXT= 'The end_time must be greater than the start_time';
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Activities_BEFORE_UPDATE` BEFORE UPDATE ON `activities` FOR EACH ROW BEGIN
     IF NEW.end_time<=NEW.start_time THEN
          SIGNAL SQLSTATE '45000'
		  SET MESSAGE_TEXT= 'The end_time must be greater than the start_time';
	 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `actuators`
--

DROP TABLE IF EXISTS `actuators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actuators` (
  `actuator_id` int NOT NULL,
  `device_category` enum('Lights','Heating','Tv','Lock','Gardening','userInfo') NOT NULL,
  `energy_consumed` int unsigned DEFAULT NULL,
  `action` enum('turnOnLights','increaseHeating','turnOnTv','activateLock','startGardening','turnOffLights','decreaseHeating','turnOffTv','disactivateLock','stopGardening') NOT NULL,
  `device_id` int DEFAULT NULL,
  PRIMARY KEY (`actuator_id`),
  KEY `device_id_idx` (`device_id`),
  CONSTRAINT `act_device_id` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actuators`
--

LOCK TABLES `actuators` WRITE;
/*!40000 ALTER TABLE `actuators` DISABLE KEYS */;
INSERT INTO `actuators` VALUES (1,'Lock',15,'activateLock',1),(2,'Lights',60,'turnOnLights',2),(3,'Gardening',50,'startGardening',3),(4,'Heating',100,'increaseHeating',4),(5,'Lights',30,'turnOffLights',3),(6,'Heating',65,'decreaseHeating',4),(7,'Lock',20,'disactivateLock',2);
/*!40000 ALTER TABLE `actuators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `role_id` int NOT NULL,
  `device_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`device_id`),
  KEY `device_id_idx` (`device_id`),
  KEY `comm_role_id_idx` (`role_id`),
  CONSTRAINT `comm_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `device_id` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,2),(2,3),(3,3),(1,4),(2,4),(1,9),(4,9),(3,10),(2,11);
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `device_id` int NOT NULL,
  `device_category` enum('Lights','Heating','Tv','Lock','Gardening','userInfo') NOT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'Lock'),(2,'Lights'),(3,'Gardening'),(4,'Heating'),(5,'Heating'),(6,'Lights'),(7,'Lock'),(8,'Lock'),(9,'userInfo'),(10,'userInfo'),(11,'userInfo');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `does`
--

DROP TABLE IF EXISTS `does`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `does` (
  `duration` int unsigned DEFAULT NULL,
  `user_id` int NOT NULL,
  `activity_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`activity_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activitiy_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `does`
--

LOCK TABLES `does` WRITE;
/*!40000 ALTER TABLE `does` DISABLE KEYS */;
INSERT INTO `does` VALUES (60,1,2),(90,1,3),(90,1,6),(90,2,5),(3600,3,1),(30,7,4);
/*!40000 ALTER TABLE `does` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `haspermission`
--

DROP TABLE IF EXISTS `haspermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `haspermission` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id_idx` (`permission_id`),
  CONSTRAINT `hasp_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `haspermission`
--

LOCK TABLES `haspermission` WRITE;
/*!40000 ALTER TABLE `haspermission` DISABLE KEYS */;
INSERT INTO `haspermission` VALUES (1,1),(1,2),(2,2),(3,2),(4,2),(1,3),(2,3),(1,4),(2,4),(3,4),(1,5),(1,6);
/*!40000 ALTER TABLE `haspermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `non_child_control_devices`
--

DROP TABLE IF EXISTS `non_child_control_devices`;
/*!50001 DROP VIEW IF EXISTS `non_child_control_devices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `non_child_control_devices` AS SELECT 
 1 AS `device_id`,
 1 AS `device_category`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL,
  `notification_message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Time to check your pulses!'),(2,'Check your distance walked!'),(3,'Check the weather forecast to stay prepared!'),(4,'Batterly low !!!'),(5,'You are close to your km goal!'),(6,'Keep walking!'),(7,'You have surpassed your own limits----keep shining!');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifies`
--

DROP TABLE IF EXISTS `notifies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifies` (
  `sw_id` int NOT NULL,
  `notification_id` int NOT NULL,
  PRIMARY KEY (`sw_id`,`notification_id`),
  KEY `notification_id_idx` (`notification_id`),
  CONSTRAINT `notif_sw_id` FOREIGN KEY (`sw_id`) REFERENCES `smartwatch` (`sw_id`),
  CONSTRAINT `notification_id` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifies`
--

LOCK TABLES `notifies` WRITE;
/*!40000 ALTER TABLE `notifies` DISABLE KEYS */;
INSERT INTO `notifies` VALUES (5,1),(1,2),(3,3),(6,4),(2,5),(4,6),(7,7);
/*!40000 ALTER TABLE `notifies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL,
  `permission_name` enum('controlLights','controlHeating','controlTv','controlLock','controlGardening','controlSensors') DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'controlLock'),(2,'controlLights'),(3,'controlHeating'),(4,'controlTv'),(5,'controlGardening'),(6,'controlSensors');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminds`
--

DROP TABLE IF EXISTS `reminds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminds` (
  `sw_id` int NOT NULL,
  `activity_id` int NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sw_id`,`activity_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `rem_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activitiy_id`),
  CONSTRAINT `sw_id` FOREIGN KEY (`sw_id`) REFERENCES `smartwatch` (`sw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminds`
--

LOCK TABLES `reminds` WRITE;
/*!40000 ALTER TABLE `reminds` DISABLE KEYS */;
INSERT INTO `reminds` VALUES (1,2,'2024-11-28 07:30:00','Time to exercise!'),(1,4,'2024-11-28 13:30:00','The dog is hungry!'),(1,7,'2024-11-28 14:30:00','Karate is waiting!'),(3,1,'2024-11-28 05:30:00','Get ready for school!'),(3,5,'2024-11-28 15:30:00','Let\'s complete our distance goal for today!'),(4,3,'2024-11-28 11:30:00','Your meeting is approaching!'),(4,6,'2024-11-28 17:30:00','FAMILY TIME!');
/*!40000 ALTER TABLE `reminds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` enum('admin','familyMember','child','guest') DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'familyMember'),(3,'child'),(4,'guest'),(5,'guest'),(6,'child'),(7,'familyMember');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `roles_and_permissions`
--

DROP TABLE IF EXISTS `roles_and_permissions`;
/*!50001 DROP VIEW IF EXISTS `roles_and_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `roles_and_permissions` AS SELECT 
 1 AS `role_name`,
 1 AS `permission_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensors` (
  `sensor_id` int NOT NULL,
  `trigger_condition` varchar(45) DEFAULT NULL,
  `device_category` enum('Lights','Heating','Tv','Lock','Gardening','userInfo') NOT NULL,
  `device_id` int NOT NULL,
  `actuator_id` int DEFAULT NULL,
  PRIMARY KEY (`sensor_id`),
  KEY `deivice_id_idx` (`device_id`),
  KEY `actuator_id_idx` (`actuator_id`),
  CONSTRAINT `actuator_id` FOREIGN KEY (`actuator_id`) REFERENCES `actuators` (`actuator_id`),
  CONSTRAINT `sens_device_id` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors`
--

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
INSERT INTO `sensors` VALUES (1,'If temperature <18','Heating',5,4),(2,'If temperature >30','Heating',5,6),(3,'If double clap','Lights',6,5),(4,'If single clap','Lights',6,2),(5,'If \'lock\'','Lock',7,7),(6,'If \'unlock\'','Lock',8,1);
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartwatch`
--

DROP TABLE IF EXISTS `smartwatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartwatch` (
  `sw_id` int NOT NULL,
  `celsius_degrees` int DEFAULT NULL,
  `pulses` int unsigned DEFAULT NULL,
  `current_time` timestamp NULL DEFAULT NULL,
  `battery_level` int unsigned DEFAULT NULL,
  `device_category` enum('Lights','Heating','Tv','Lock','Gardening','userInfo') NOT NULL,
  `device_id` int NOT NULL,
  `distance_walked` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sw_id`),
  KEY `device_id_idx` (`device_id`),
  CONSTRAINT `sw_device_id` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartwatch`
--

LOCK TABLES `smartwatch` WRITE;
/*!40000 ALTER TABLE `smartwatch` DISABLE KEYS */;
INSERT INTO `smartwatch` VALUES (1,10,72,'2024-11-27 16:30:00',85,'userInfo',9,4),(2,10,90,'2024-11-27 16:35:00',80,'userInfo',9,4),(3,9,92,'2024-11-27 17:35:00',60,'userInfo',10,5),(4,15,65,'2024-11-27 13:35:00',95,'userInfo',11,1),(5,8,85,'2024-11-27 18:15:00',50,'userInfo',10,1),(6,6,79,'2024-11-27 18:55:00',15,'userInfo',10,2),(7,12,100,'2024-11-27 15:35:00',75,'userInfo',11,8);
/*!40000 ALTER TABLE `smartwatch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Smartwatch_BEFORE_INSERT` BEFORE INSERT ON `smartwatch` FOR EACH ROW BEGIN
	IF NEW.battery_level>100 THEN
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Battery level cant be greater than 100 ';
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Smartwatch_BEFORE_INSERT_1` BEFORE INSERT ON `smartwatch` FOR EACH ROW BEGIN
	IF NEW.pulses > 300 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pulses cant be larger than 230 ' ;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Smartwatch_BEFORE_INSERT_2` BEFORE INSERT ON `smartwatch` FOR EACH ROW BEGIN
	IF NEW.celsius_degrees>100 THEN
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Degrees cant be larger than 100 ';
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Smartwatch_BEFORE_UPDATE` BEFORE UPDATE ON `smartwatch` FOR EACH ROW BEGIN
	IF NEW.battery_level>100 THEN
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Battery level cant be greater than 100 ';
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Smartwatch_BEFORE_UPDATE_1` BEFORE UPDATE ON `smartwatch` FOR EACH ROW BEGIN
	IF NEW.pulses > 300 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pulses cant be larger than 230 ' ;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Smartwatch_BEFORE_UPDATE_2` BEFORE UPDATE ON `smartwatch` FOR EACH ROW BEGIN
	IF NEW.celsius_degrees>100 THEN
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Degrees cant be larger than 100 ';
    END IF;     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` bigint unsigned DEFAULT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jhon Smith','john.smith@example.com',6931234567,1),(2,'Mary Johnson','mary.johnson@example.com',6987654321,2),(3,'Robert Smith','robert.smith@example.com',6901239876,3),(4,'Sarah Brown','sarah.brown@example.com',6976543210,4),(5,'James Davis','james.davis@example.com',6945678901,5),(6,'Emily Smith','emily.smith@example.com',6998765432,6),(7,'William Lee','william.lee@example.com',6923456789,7);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `non_child_control_devices`
--

/*!50001 DROP VIEW IF EXISTS `non_child_control_devices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `non_child_control_devices` AS select `device`.`device_id` AS `device_id`,`device`.`device_category` AS `device_category` from `device` where (`device`.`device_id`,`device`.`device_category`) in (select `commands`.`device_id`,`device`.`device_category` from (((`roles` join `user` on((`roles`.`role_id` = `user`.`role_id`))) join `commands` on((`user`.`user_id` = `commands`.`role_id`))) join `device` on((`commands`.`device_id` = `device`.`device_id`))) where (`roles`.`role_name` = 'child')) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `roles_and_permissions`
--

/*!50001 DROP VIEW IF EXISTS `roles_and_permissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roles_and_permissions` AS select `roles`.`role_name` AS `role_name`,`permission`.`permission_name` AS `permission_name` from ((`roles` join `haspermission` on((`roles`.`role_id` = `haspermission`.`role_id`))) join `permission` on((`haspermission`.`permission_id` = `permission`.`permission_id`))) */;
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

-- Dump completed on 2024-12-26  0:32:14
