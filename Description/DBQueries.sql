-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: moviesheep
-- ------------------------------------------------------
-- Server version	5.6.39-log

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
-- Table structure for table `guestbookinghistory`
--

DROP TABLE IF EXISTS `guestbookinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestbookinghistory` (
  `TicketId` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(100) DEFAULT NULL,
  `MovieId` int(11) DEFAULT NULL,
  `BookingTime` varchar(100) DEFAULT NULL,
  `BookingShow` varchar(100) DEFAULT NULL,
  `BookingDate` varchar(100) DEFAULT NULL,
  `TotalSeats` int(11) DEFAULT NULL,
  `TotalFare` double DEFAULT NULL,
  `isCancelled` int(11) DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `UserId_ForeignKey_idx` (`EmailId`),
  KEY `MovieId_ForeignKey` (`MovieId`),
  CONSTRAINT `MovieId_ForeignKey` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbookinghistory`
--

LOCK TABLES `guestbookinghistory` WRITE;
/*!40000 ALTER TABLE `guestbookinghistory` DISABLE KEYS */;
INSERT INTO `guestbookinghistory` VALUES (23,'sudhakar.tillapudi@gmail.com',5,'06-20-2018 22:10','6:30 - 9:00 PM','06-21-2018',1,400,1),(24,'sudhakar.tillapudi@gmail.com',7,'06-20-2018 22:45','6:30 - 9:00 PM','06-23-2018',2,500,1),(25,'shivaji.dm@gmail.com',1,'06-21-2018 11:43','6:30 - 9:00 PM','06-22-2018',2,300,0),(26,'sudhakar.tillapudi@gmail.com',2,'07-03-2018 11:16','6:30 - 9:00 PM','07-04-2018',1,350,1),(27,'sudhakar.tillapudi@gmail.com',3,'07-05-2018 11:08','6:30 - 9:00 PM','07-08-2018',2,600,1),(28,'sudhakar.tillapudi@gmail.com',4,'07-05-2018 12:32','6:30 - 9:00 PM','07-09-2018',4,1000,1),(29,'sudhakar.tillapudi@gmail.com',7,'07-05-2018 14:25','6:30 - 9:00 PM','07-10-2018',4,1000,0),(30,'sudhakar.tillapudi@gmail.com',1,'07-05-2018 14:35','6:30 - 9:00 PM','07-10-2018',1,150,0),(31,'shama.hegde@gmail.com',8,'07-05-2018 16:15','6:30 - 9:00 PM','07-08-2018',2,400,0);
/*!40000 ALTER TABLE `guestbookinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `duration_in_min` int(11) DEFAULT NULL,
  `cast_and_crew` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image_path` varchar(1100) DEFAULT NULL,
  `Language` varchar(45) DEFAULT NULL,
  `Rating` double DEFAULT NULL,
  `Certificate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Jurassic World: Fallen Kingdom',140,'Chris Pratt, Bryce Dallas Howard','A theme park showcasing genetically dinosaurs','501','English',4.5,'UA'),(2,'Mahanati',150,'xyz','xyz','502','Telugu',4.9,'U'),(3,'Avengers: Infinity War',160,NULL,NULL,'503','English',NULL,'UA'),(4,'Kaala',150,NULL,NULL,'504','Telugu',NULL,'UA'),(5,'Sammohanam',150,NULL,NULL,'505','Telugu',NULL,'U'),(6,'Naa Nuvve',150,NULL,NULL,'506','Telugu',NULL,'UA'),(7,'Parmanu: The Story of Pokhran',140,'xyz',NULL,'507','Hindi',NULL,'A'),(8,'Peter Rabbit',150,'xyz',NULL,'508','English',NULL,'U'),(9,'Ferdinand',160,'xyz',NULL,'509','English',NULL,'U');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_old`
--

DROP TABLE IF EXISTS `movies_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_old` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Actor` varchar(200) DEFAULT NULL,
  `Actress` varchar(200) DEFAULT NULL,
  `Director` varchar(200) DEFAULT NULL,
  `Producer` varchar(200) DEFAULT NULL,
  `Music` varchar(200) DEFAULT NULL,
  `Rating` varchar(45) DEFAULT NULL,
  `Reviews` varchar(200) DEFAULT NULL,
  `AvailableTickets` int(11) DEFAULT NULL,
  `RunningStatus` bit(1) DEFAULT NULL,
  `Fare` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_old`
--

LOCK TABLES `movies_old` WRITE;
/*!40000 ALTER TABLE `movies_old` DISABLE KEYS */;
INSERT INTO `movies_old` VALUES (1,'Avengers','Robert Downey','Scarlett Johansson','Joss Whedon','Kevin Feige','Brian Tyler','3.5','------',60,'',40),(2,'Annie','Jamie Foxx','Cameron Diaz','Will Gluck','Will Smith','Charles Strouse','5','Very good',60,'',50);
/*!40000 ALTER TABLE `movies_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ShowName` varchar(100) DEFAULT NULL,
  `ShowTimings` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,'Morning Show','10 AM - 1 PM'),(2,'Matnee Show','2 PM - 5 PM'),(3,'Evening Show','6 PM - 9 PM'),(4,'Second Show','9:30 PM - 12:30 AM');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatres`
--

DROP TABLE IF EXISTS `theatres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theatres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `seating_capacity` int(11) DEFAULT NULL,
  `runningmovie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `runningmovie_id_FK_idx` (`runningmovie_id`),
  CONSTRAINT `runningmovie_id_FK` FOREIGN KEY (`runningmovie_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatres`
--

LOCK TABLES `theatres` WRITE;
/*!40000 ALTER TABLE `theatres` DISABLE KEYS */;
INSERT INTO `theatres` VALUES (1,'Tulsi Digital 4k Marathahalli','Marathahalli, Bengaluru, Karnataka',560037,150,95,1),(2,'Phenoix market City Mall Whitefeild','Whitefield Main Road, Mahadevpura, Bengaluru',560048,350,40,2),(3,'INOX: Forum Neighbourhood Mall Whitetfield','Prestige Ozone, Whitefield, Bengaluru',560063,300,50,3),(4,'MSR Elements Mall Thanisandra Main Road','MS Ramaiah North City,Nagavara Village,Bengaluru',560067,250,75,4),(5,'Gopalan Grand Mall: Old Madras Road','Gopalan Signature Mall, Old Madras Road, Bengaluru',560016,400,50,5),(6,'PVR: Forum Mall Koramangala','Adugodi Main Rd, Kormangala, Adugodi, Bengaluru',560045,550,40,6),(7,'Cinepolis: Orion East Mall, Banaswadi','Orion East Mall, Sathya Nagar, Bengaluru',560044,250,100,7),(8,'Bhumika Digital 2K Cinema: Gandhinagar','Kempe Gowda Road,Gandhi Nagar, Bengaluru',560033,200,150,8),(9,'Sandhya Digital 4K Projection Dolby Atmos: Madiwala','BTM Layout, 1st Stage, Chikka Madivala, Bengaluru',560004,180,128,9);
/*!40000 ALTER TABLE `theatres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(100) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `MobileNo` varchar(45) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (50,'sudhakar.tillapudi@gmail.com','Sudhakar','Tillapudi','8971820508','1'),(51,'sudhakar1.tillapudi@gmail.com','Tillapudi','Sudhakar','8971820508','356a192b7913b04c54574d18c28d46e6395428ab'),(52,'shama.hegde@gmail.com','Shama','Hegde','8971829508','2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-05 17:12:41
