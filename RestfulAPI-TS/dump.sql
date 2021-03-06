-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: kakao_talk
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB

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
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `friendId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Friend_userId_friendId_unique` (`userId`,`friendId`),
  KEY `friendId` (`friendId`),
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`friendId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `friendId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,1,2,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(2,1,3,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(3,2,1,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(4,2,3,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(5,3,1,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(29,1,4,'2019-06-11 13:16:21','2019-06-11 13:16:21');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20190114055131-create-user.js'),('20190114060857-create-friend.js'),('20190129115723-create-talk_room.js'),('20190129132303-create-talk.js'),('20190214081156-create-user-talk-rooms.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk`
--

DROP TABLE IF EXISTS `talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `talkRoomId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `talkRoomId` (`talkRoomId`),
  CONSTRAINT `talk_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `talk_ibfk_2` FOREIGN KEY (`talkRoomId`) REFERENCES `talkroom` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk`
--

LOCK TABLES `talk` WRITE;
/*!40000 ALTER TABLE `talk` DISABLE KEYS */;
/*!40000 ALTER TABLE `talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talkroom`
--

DROP TABLE IF EXISTS `talkroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talkroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talkroom`
--

LOCK TABLES `talkroom` WRITE;
/*!40000 ALTER TABLE `talkroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `talkroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talkrooms`
--

DROP TABLE IF EXISTS `talkrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talkrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talkrooms`
--

LOCK TABLES `talkrooms` WRITE;
/*!40000 ALTER TABLE `talkrooms` DISABLE KEYS */;
INSERT INTO `talkrooms` VALUES (1,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(2,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(3,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(4,'2019-02-16 12:28:00','2019-02-16 12:28:00');
/*!40000 ALTER TABLE `talkrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talks`
--

DROP TABLE IF EXISTS `talks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `talkRoomId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talks`
--

LOCK TABLES `talks` WRITE;
/*!40000 ALTER TABLE `talks` DISABLE KEYS */;
/*!40000 ALTER TABLE `talks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platformName` varchar(255) DEFAULT NULL,
  `socialId` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'google','tjdans174@gmail.com',NULL,NULL,'2019-07-11 10:44:37','2019-07-11 10:44:37');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platformName` varchar(255) DEFAULT NULL,
  `socialId` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'google','tjdans174@gmail.com','媛뺤꽦臾?,'https://lh3.googleusercontent.com/-CM57SJbKGEE/AAAAAAAAAAI/AAAAAAAAAAA/AKxrwcaiCCOhELETUdml3bdnYYf56nIv3A/s96-c/photo.jpg','2019-02-16 12:28:00','2019-02-16 12:28:00'),(2,'facebook','tjdans174@naver.com','媛뺤꽦臾?,'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1088024871359658&height=50&width=50&ext=1549607711&hash=AeQq1fMUlwIYRahP','2019-02-16 12:28:00','2019-02-16 12:28:00'),(3,'google','dkrak174@gmail.com','媛뺤꽦臾?,'https://lh4.googleusercontent.com/-PfFszwf5seY/AAAAAAAAAAI/AAAAAAAAAAA/AKxrwcYyWHTOrGBE042hzQsvX4DkYwD_hg/s96-c/photo.jpg','2019-02-16 12:28:00','2019-02-16 12:28:00'),(4,'google','kimdongmingo@gmail.com','DongMin Kim','https://lh6.googleusercontent.com/-L2LbVOfz65k/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rdCCPOaguJATQKTk4XtdJgjMV2etg/s96-c/photo.jpg','2019-04-17 05:07:14','2019-04-17 05:07:14'),(5,'google','kimdongmin.korea@gmail.com','源?숇?','https://lh4.googleusercontent.com/-nbdoKeTW-TU/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3refw1VE3CR6OvZvrq2folsYtzC0xw/s96-c/photo.jpg','2019-04-17 05:10:48','2019-04-17 05:10:48'),(6,'google','kdm_korea@naver.com','源?숇?','https://lh4.googleusercontent.com/-ry43eDQCYdI/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3reWuul0AIw9hgGfcqHc6GBCgJWD-w/s96-c/photo.jpg','2019-04-17 05:12:06','2019-04-17 05:12:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertalkroom`
--

DROP TABLE IF EXISTS `usertalkroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertalkroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `talkRoomId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `friendId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserTalkRoom_userId_friendId_unique` (`userId`,`friendId`),
  UNIQUE KEY `UserTalkRoom_talkRoomId_userId_unique` (`talkRoomId`),
  KEY `friendId` (`friendId`),
  CONSTRAINT `usertalkroom_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usertalkroom_ibfk_2` FOREIGN KEY (`talkRoomId`) REFERENCES `talkroom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usertalkroom_ibfk_3` FOREIGN KEY (`friendId`) REFERENCES `talkroom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertalkroom`
--

LOCK TABLES `usertalkroom` WRITE;
/*!40000 ALTER TABLE `usertalkroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertalkroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertalkrooms`
--

DROP TABLE IF EXISTS `usertalkrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertalkrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talkId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertalkrooms`
--

LOCK TABLES `usertalkrooms` WRITE;
/*!40000 ALTER TABLE `usertalkrooms` DISABLE KEYS */;
INSERT INTO `usertalkrooms` VALUES (1,1,1,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(2,1,2,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(4,2,2,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(5,2,3,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(6,3,1,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(7,3,2,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(8,4,1,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(9,4,3,'2019-02-16 12:28:00','2019-02-16 12:28:00'),(88,1,3,'2019-03-04 10:33:10','2019-03-04 10:33:10');
/*!40000 ALTER TABLE `usertalkrooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-11 20:17:07
