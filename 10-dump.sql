-- MySQL dump 10.13  Distrib 5.7.8-rc, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	5.7.8-rc

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

-- Drop database
DROP DATABASE IF EXISTS hbnb_dev_db;

-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost';
SET PASSWORD FOR 'hbnb_dev'@'localhost' = 'hbnb_dev_pwd';
GRANT ALL ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';
FLUSH PRIVILEGES;

USE hbnb_dev_db;

--
-- Table structure for table `amenities`
--
DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--
LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES ('821a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:44:42','2017-03-25 19:44:42','Wifi'),('821a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Pets friendly'),('821a55f4-7d82-47d9-b54c-a76916479553','2017-03-25 19:44:42','2017-03-25 19:44:42','Elevator in building'),('821a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:44:42','2017-03-25 19:44:42','Doorman'),('821a55f4-7d82-47d9-b54c-a76916479555','2017-03-25 19:44:42','2017-03-25 19:44:42','Cable TV'),('821a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:44:42','2017-03-25 19:44:42','Dryer'),('821a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:44:42','2017-03-25 19:44:42','Hair dryer'),('821a55f4-7d82-47d9-b54c-a76916479558','2017-03-25 19:44:42','2017-03-25 19:44:42','Iron'),('821a55f4-7d82-47d9-b54c-a76916479559','2017-03-25 19:44:42','2017-03-25 19:44:42','Washer'),('821a55f4-7d82-47d9-b54c-a76916479560','2017-03-25 19:44:42','2017-03-25 19:44:42','Laundry room'),('821a55f4-7d82-47d9-b54c-a76916479561','2017-03-25 19:44:42','2017-03-25 19:44:42','Air conditioning'),('821a55f4-7d82-47d9-b54c-a76916479562','2017-03-25 19:44:42','2017-03-25 19:44:42','Hot tub'),('821a55f4-7d82-47d9-b54c-a76916479563','2017-03-25 19:44:42','2017-03-25 19:44:42','Smoking allowed');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firt_name` varchar(60),
  `last_name` varchar(60)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `user`
--
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('899a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:44:42','2017-03-25 19:44:42', 'jj@j.com', '123');
UNLOCK TABLES;

--
-- Table structure for table `place_amenities`
--
DROP TABLE IF EXISTS `place_amenity`;
CREATE TABLE `place_amenity` (
  `amenity_id` varchar(60) NOT NULL,
  `place_id` varchar(60) NOT NULL,
  CONSTRAINT `place_amenityfk_1` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`),
  CONSTRAINT `place_amenityfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `cities`
--
LOCK TABLES `place_amenity` WRITE;
INSERT INTO `place_amenity` VALUES ('821a55f4-7d82-47d9-b54c-a76916479551','921a55f4-7d82-47d9-b54c-a7691647551'),('821a55f4-7d82-47d9-b54c-a76916479552','921a55f4-7d82-47d9-b54c-a7691647551');
UNLOCK TABLES;
--
-- Table structure for table `place`
--
DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL PRIMARY KEY,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `city_id` varchar(60) NOT NULL,
  `descrption` varchar(150),
  `number_rooms` int DEFAULT 0,
  `number_bathrooms` int DEFAULT 0,
  `max_guest` int DEFAULT 0,
  `price_by_night` int DEFAULT 0,
  `latitude` float,
  `longitude` float,
  CONSTRAINT `placesfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `placesfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `places`
--
LOCK TABLES `places` WRITE;
INSERT INTO `places` VALUES ('921a55f4-7d82-47d9-b54c-a7691647551', '2017-03-25 19:44:42','2017-03-25 19:44:42', '899a55f4-7d82-47d9-b54c-a76916479551','el pital', '521a55f4-7d82-47d9-b54c-a76916479545' );
UNLOCK TABLES;

--
-- Table structure for table `cities`
--
DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--
LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('521a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:44:42','2017-03-25 19:44:42','Akron','421a55f4-7d82-47d9-b54c-a76916479545'),('521a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:44:42','2017-03-25 19:44:42','Douglas','421a55f4-7d82-47d9-b54c-a76916479546'),('521a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:44:42','2017-03-25 19:44:42','San Francisco','421a55f4-7d82-47d9-b54c-a76916479547'),('521a55f4-7d82-47d9-b54c-a76916479548','2017-03-25 19:44:42','2017-03-25 19:44:42','Denver','421a55f4-7d82-47d9-b54c-a76916479548'),('521a55f4-7d82-47d9-b54c-a76916479549','2017-03-25 19:44:42','2017-03-25 19:44:42','Miami','421a55f4-7d82-47d9-b54c-a76916479549'),('521a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:44:42','2017-03-25 19:44:42','Honolulu','421a55f4-7d82-47d9-b54c-a76916479551'),('521a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Chicago','421a55f4-7d82-47d9-b54c-a76916479552'),('521a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:44:42','2017-03-25 19:44:42','New Orleans','421a55f4-7d82-47d9-b54c-a76916479554'),('521a55f4-7d82-47d9-b54c-a76916479555','2017-03-25 19:44:42','2017-03-25 19:44:42','Saint Paul','421a55f4-7d82-47d9-b54c-a76916479555'),('521a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:44:42','2017-03-25 19:44:42','Jackson','421a55f4-7d82-47d9-b54c-a76916479556'),('521a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:44:42','2017-03-25 19:44:42','Portland','421a55f4-7d82-47d9-b54c-a76916479557'),('531a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:44:42','2017-03-25 19:44:42','Babbie','421a55f4-7d82-47d9-b54c-a76916479545'),('531a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:44:42','2017-03-25 19:44:42','Kearny','421a55f4-7d82-47d9-b54c-a76916479546'),('531a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:44:42','2017-03-25 19:44:42','San Jose','421a55f4-7d82-47d9-b54c-a76916479547'),('531a55f4-7d82-47d9-b54c-a76916479549','2017-03-25 19:44:42','2017-03-25 19:44:42','Orlando','421a55f4-7d82-47d9-b54c-a76916479549'),('531a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:44:42','2017-03-25 19:44:42','Kailua','421a55f4-7d82-47d9-b54c-a76916479551'),('531a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Peoria','421a55f4-7d82-47d9-b54c-a76916479552'),('531a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:44:42','2017-03-25 19:44:42','Baton rouge','421a55f4-7d82-47d9-b54c-a76916479554'),('531a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:44:42','2017-03-25 19:44:42','Tupelo','421a55f4-7d82-47d9-b54c-a76916479556'),('531a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:44:42','2017-03-25 19:44:42','Eugene','421a55f4-7d82-47d9-b54c-a76916479557'),('541a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:44:42','2017-03-25 19:44:42','Calera','421a55f4-7d82-47d9-b54c-a76916479545'),('541a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:44:42','2017-03-25 19:44:42','Tempe','421a55f4-7d82-47d9-b54c-a76916479546'),('541a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:44:42','2017-03-25 19:44:42','Fremont','421a55f4-7d82-47d9-b54c-a76916479547'),('541a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:44:42','2017-03-25 19:44:42','Pearl city','421a55f4-7d82-47d9-b54c-a76916479551'),('541a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Naperville','421a55f4-7d82-47d9-b54c-a76916479552'),('541a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:44:42','2017-03-25 19:44:42','Lafayette','421a55f4-7d82-47d9-b54c-a76916479554'),('541a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:44:42','2017-03-25 19:44:42','Meridian','421a55f4-7d82-47d9-b54c-a76916479556'),('551a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:44:42','2017-03-25 19:44:42','Fairfield','421a55f4-7d82-47d9-b54c-a76916479545'),('551a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:44:42','2017-03-25 19:44:42','Napa','421a55f4-7d82-47d9-b54c-a76916479547'),('551a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Urbana','421a55f4-7d82-47d9-b54c-a76916479552'),('561a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:44:42','2017-03-25 19:44:42','Sonoma','421a55f4-7d82-47d9-b54c-a76916479547'),('561a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Joliet','421a55f4-7d82-47d9-b54c-a76916479552');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--
DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--
LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('421a55f4-7d82-47d9-b54c-a76916479545','2017-03-25 19:44:42','2017-03-25 19:44:42','Alabama'),('421a55f4-7d82-47d9-b54c-a76916479546','2017-03-25 19:44:42','2017-03-25 19:44:42','Arizona'),('421a55f4-7d82-47d9-b54c-a76916479547','2017-03-25 19:44:42','2017-03-25 19:44:42','California'),('421a55f4-7d82-47d9-b54c-a76916479548','2017-03-25 19:44:42','2017-03-25 19:44:42','Colorado'),('421a55f4-7d82-47d9-b54c-a76916479549','2017-03-25 19:44:42','2017-03-25 19:44:42','Florida'),('421a55f4-7d82-47d9-b54c-a76916479550','2017-03-25 19:44:42','2017-03-25 19:44:42','Georgia'),('421a55f4-7d82-47d9-b54c-a76916479551','2017-03-25 19:44:42','2017-03-25 19:44:42','Hawaii'),('421a55f4-7d82-47d9-b54c-a76916479552','2017-03-25 19:44:42','2017-03-25 19:44:42','Illinois'),('421a55f4-7d82-47d9-b54c-a76916479553','2017-03-25 19:44:42','2017-03-25 19:44:42','Indiana'),('421a55f4-7d82-47d9-b54c-a76916479554','2017-03-25 19:44:42','2017-03-25 19:44:42','Louisiana'),('421a55f4-7d82-47d9-b54c-a76916479555','2017-03-25 19:44:42','2017-03-25 19:44:42','Minnesota'),('421a55f4-7d82-47d9-b54c-a76916479556','2017-03-25 19:44:42','2017-03-25 19:44:42','Mississippi'),('421a55f4-7d82-47d9-b54c-a76916479557','2017-03-25 19:44:42','2017-03-25 19:44:42','Oregon');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-25 19:44:44
