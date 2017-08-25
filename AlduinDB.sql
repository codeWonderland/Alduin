-- MySQL dump 10.13  Distrib 5.7.18, for osx10.12 (x86_64)
--
-- Host: localhost    Database: AlduinDB
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Artifact`
--

DROP TABLE IF EXISTS `Artifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artifact` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Universe_Id` int(11) NOT NULL,
  `About` varchar(500) NOT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Universe_Id` (`Universe_Id`),
  CONSTRAINT `artifact_ibfk_1` FOREIGN KEY (`Universe_Id`) REFERENCES `Universe` (`_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artifact`
--

LOCK TABLES `Artifact` WRITE;
/*!40000 ALTER TABLE `Artifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Artifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campaign`
--

DROP TABLE IF EXISTS `Campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaign` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  `Admin` int(11) NOT NULL,
  `User1` int(11) DEFAULT NULL,
  `User2` int(11) DEFAULT NULL,
  `User3` int(11) DEFAULT NULL,
  `User4` int(11) DEFAULT NULL,
  `User5` int(11) DEFAULT NULL,
  `User6` int(11) DEFAULT NULL,
  `User7` int(11) DEFAULT NULL,
  `User8` int(11) DEFAULT NULL,
  `User9` int(11) DEFAULT NULL,
  `User10` int(11) DEFAULT NULL,
  `Universe_Id` int(11) NOT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Universe_Id` (`Universe_Id`),
  KEY `Admin` (`Admin`),
  KEY `User1` (`User1`),
  KEY `User2` (`User2`),
  KEY `User3` (`User3`),
  KEY `User4` (`User4`),
  KEY `User5` (`User5`),
  KEY `User6` (`User6`),
  KEY `User7` (`User7`),
  KEY `User8` (`User8`),
  KEY `User9` (`User9`),
  KEY `User10` (`User10`),
  CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`Universe_Id`) REFERENCES `Universe` (`_Id`) ON DELETE CASCADE,
  CONSTRAINT `campaign_ibfk_10` FOREIGN KEY (`User8`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_11` FOREIGN KEY (`User9`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_12` FOREIGN KEY (`User10`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_2` FOREIGN KEY (`Admin`) REFERENCES `User` (`_Id`) ON DELETE CASCADE,
  CONSTRAINT `campaign_ibfk_3` FOREIGN KEY (`User1`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_4` FOREIGN KEY (`User2`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_5` FOREIGN KEY (`User3`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_6` FOREIGN KEY (`User4`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_7` FOREIGN KEY (`User5`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_8` FOREIGN KEY (`User6`) REFERENCES `User` (`_Id`),
  CONSTRAINT `campaign_ibfk_9` FOREIGN KEY (`User7`) REFERENCES `User` (`_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campaign`
--

LOCK TABLES `Campaign` WRITE;
/*!40000 ALTER TABLE `Campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `Campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `DBLocation` varchar(44) NOT NULL,
  `ViewNumber` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Universe_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `UploadDate` bigint(16) NOT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Universe_Id` (`Universe_Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`Universe_Id`) REFERENCES `Universe` (`_Id`) ON DELETE CASCADE,
  CONSTRAINT `image_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `User` (`_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `Universe_Id` int(11) NOT NULL,
  `About` varchar(500) NOT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Universe_Id` (`Universe_Id`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`Universe_Id`) REFERENCES `Universe` (`_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Story`
--

DROP TABLE IF EXISTS `Story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Story` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Campaign_Id` int(11) NOT NULL,
  `LastUpdated` int(11) NOT NULL,
  `StoryContent` varchar(25000) NOT NULL,
  `About` varchar(500) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Campaign_Id` (`Campaign_Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `story_ibfk_1` FOREIGN KEY (`Campaign_Id`) REFERENCES `Campaign` (`_Id`) ON DELETE CASCADE,
  CONSTRAINT `story_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `User` (`_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Story`
--

LOCK TABLES `Story` WRITE;
/*!40000 ALTER TABLE `Story` DISABLE KEYS */;
/*!40000 ALTER TABLE `Story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Town`
--

DROP TABLE IF EXISTS `Town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Town` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Universe_Id` int(11) NOT NULL,
  `About` varchar(500) NOT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Universe_Id` (`Universe_Id`),
  CONSTRAINT `town_ibfk_1` FOREIGN KEY (`Universe_Id`) REFERENCES `Universe` (`_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Town`
--

LOCK TABLES `Town` WRITE;
/*!40000 ALTER TABLE `Town` DISABLE KEYS */;
/*!40000 ALTER TABLE `Town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Universe`
--

DROP TABLE IF EXISTS `Universe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Universe` (
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  `Admin` int(11) NOT NULL,
  `User1` int(11) DEFAULT NULL,
  `User2` int(11) DEFAULT NULL,
  `User3` int(11) DEFAULT NULL,
  `User4` int(11) DEFAULT NULL,
  `User5` int(11) DEFAULT NULL,
  `User6` int(11) DEFAULT NULL,
  `User7` int(11) DEFAULT NULL,
  `User8` int(11) DEFAULT NULL,
  `User9` int(11) DEFAULT NULL,
  `User10` int(11) DEFAULT NULL,
  PRIMARY KEY (`_Id`),
  KEY `Admin` (`Admin`),
  KEY `User1` (`User1`),
  KEY `User2` (`User2`),
  KEY `User3` (`User3`),
  KEY `User4` (`User4`),
  KEY `User5` (`User5`),
  KEY `User6` (`User6`),
  KEY `User7` (`User7`),
  KEY `User8` (`User8`),
  KEY `User9` (`User9`),
  KEY `User10` (`User10`),
  CONSTRAINT `universe_ibfk_1` FOREIGN KEY (`Admin`) REFERENCES `User` (`_Id`) ON DELETE CASCADE,
  CONSTRAINT `universe_ibfk_10` FOREIGN KEY (`User9`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_11` FOREIGN KEY (`User10`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_2` FOREIGN KEY (`User1`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_3` FOREIGN KEY (`User2`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_4` FOREIGN KEY (`User3`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_5` FOREIGN KEY (`User4`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_6` FOREIGN KEY (`User5`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_7` FOREIGN KEY (`User6`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_8` FOREIGN KEY (`User7`) REFERENCES `User` (`_Id`),
  CONSTRAINT `universe_ibfk_9` FOREIGN KEY (`User8`) REFERENCES `User` (`_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Universe`
--

LOCK TABLES `Universe` WRITE;
/*!40000 ALTER TABLE `Universe` DISABLE KEYS */;
/*!40000 ALTER TABLE `Universe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserName` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `DisplayName` varchar(25) NOT NULL,
  `DOB` bigint(16) NOT NULL,
  `_Id` int(11) NOT NULL AUTO_INCREMENT,
  `City` varchar(20) NOT NULL,
  `PrimaryGame` varchar(15) NOT NULL,
  `SecondaryGame` varchar(15) DEFAULT NULL,
  `Bio` varchar(1000) NOT NULL,
  `LastLoggedIn` bigint(16) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `ProfilePicture` varchar(40) NOT NULL,
  `Visits` int(6) NOT NULL,
  PRIMARY KEY (`_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('codeWonderland','tacos1234','Alice Easter',890974800000,1,'Burlington, VT','DnD 5e','Pathfinder','Oh hey, it seems like you have found my about page, cute. For those of you who are new to DnD or my games in particular, I welcome you. For those who are familiar with my campaigns, I deeply apologize. I am one of Quarterstaff’s regular DMs and I run everything from horror, to whimsy, to grandiose adventure.',1502683200000,'alice.easterdevelops@gmail.com','/images/avatars/alice-easter.jpg',0),('I.Irizarry2','tacos1235','Ivan Irizarry',599634000000,2,'Burlington, VT','DnD 5e',NULL,'Oh hey',1502683200000,'i.irizarry2@yahoo.com','/images/avatars/default.png',0),('emtb1992','tacos1236','Prarie Lefebvre',694414800000,3,'Burlington, VT','DnD 5e',NULL,'I have a bachelors in Neuroscience from the University of Vermont. I am currently an LNA at a hospital. I never got into video games or fandoms. D&D caught me though and I love the social aspect. I&#39;ve been playing D&D since 2013 and DMing since 2015.',1502683200000,'prairielefebvre@gmail.com','/images/avatars/prarie-lefebvre.jpg',0),('YungFupaLord','tacos1237','Will Angier',694414800000,4,'Burlington, VT','DnD 5e',NULL,'Will was born in southeastern Indonesia to a poor family of mudcrab farmers. He spent most of his childhood fighting off bullies who&#39;d ridicule him for his large effeminate badonkadonk. Because of this, he grew up very strong and was quickly put to work as a rickshaw driver. There was little entertainment in his small village aside from a single VHS copy of Pretty in Pink. He would watch this movie hundreds of times, mesmerized by the beauty of Molly Ringwald. Determined to find this woman, he traveled to the nearest city with dial-up internet and was disappointed by Molly Ringwald&#39;s wikipedia page to see that she had aged considerably since her 1986 film. Distraught, Will attempted to find a way to escape this bleak reality. He found his answer in Dungeons & Dragons. Unfortunately, the local villagers did not appreciate this game of high fantasy, so he moved to the nerd capital of the world... Burlington, Vermont.',1502683200000,'william.c.angier@gmail.com','/images/avatars/will-angier.jpg',0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-25 15:06:34
