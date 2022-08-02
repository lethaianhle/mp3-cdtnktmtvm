-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thebeats
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'tunganh','assets/images/placeholder.png','assets/images/placeholder.png',_binary '','paypal@gmail.com',0,4),(2,'lee@gmail.com','assets/images/placeholder.png','assets/images/placeholder.png',_binary '','paypal@gmail.com',0,6),(3,'artist_test@gmail.com','assets/images/placeholder.png','assets/images/placeholder.png',_binary '','paypal@gmail.com',0,9);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `artist_invoice`
--

LOCK TABLES `artist_invoice` WRITE;
/*!40000 ALTER TABLE `artist_invoice` DISABLE KEYS */;
INSERT INTO `artist_invoice` VALUES (3,2,'1657219271789','444','4444',0,30),(4,2,'2022-08-02',NULL,'sb-qmk1k19766798@business.example.com',0,0),(5,1,'2022-08-03',NULL,'sb-qmk1k19766798@business.example.com',198,158.4),(6,3,'2022-08-03',NULL,'sb-qmk1k19766798@business.example.com',0,0),(7,3,'2022-08-03',NULL,'sb-qmk1k19766798@business.example.com',20,16),(8,3,'2022-08-03',NULL,'sb-qmk1k19766798@business.example.com',30,24);
/*!40000 ALTER TABLE `artist_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `artist_invoice_item`
--

LOCK TABLES `artist_invoice_item` WRITE;
/*!40000 ALTER TABLE `artist_invoice_item` DISABLE KEYS */;
INSERT INTO `artist_invoice_item` VALUES (1,12,30,'Leeeeee',60,3),(2,12,30,'Leeeeee',60,3),(3,12,30,'Leeeeee',60,3),(4,1,30,'Songgggg',30,5),(5,2,30,'THIEUBAOTRAMSONG',60,5),(6,2,12,'Song01',24,5),(7,1,12,'Song02',12,5),(8,1,12,'Song03',12,5),(9,2,12,'Song04',24,5),(10,1,12,'Song05',12,5),(11,2,12,'Song06',24,5),(12,1,20,'this is not final test',20,7),(13,1,30,'ttt1',30,8);
/*!40000 ALTER TABLE `artist_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bought_song`
--

LOCK TABLES `bought_song` WRITE;
/*!40000 ALTER TABLE `bought_song` DISABLE KEYS */;
INSERT INTO `bought_song` VALUES (1,1,3,1657219271789,_binary '',12,8),(2,1,3,1657469442403,_binary '',12,7),(3,1,3,1657469442517,_binary '',12,6),(4,1,5,1659445991368,_binary '',30,2),(5,1,5,1659445991412,_binary '',12,3),(6,2,5,1659446285041,_binary '\0',30,9),(7,2,7,1659452654765,_binary '\0',30,9),(8,2,8,1659453408620,_binary '\0',30,9),(9,1,8,1659453755498,_binary '',12,6),(10,1,8,1659453981169,_binary '',30,1),(11,1,8,1659454238196,_binary '',12,3),(12,1,8,1659454598999,_binary '',12,5),(13,1,8,1659454969251,_binary '',30,2),(14,1,8,1659455416617,_binary '',12,4),(15,1,5,1659457722971,_binary '',12,8),(28,1,7,1659466250780,_binary '\0',12,6),(29,1,7,1659466250845,_binary '\0',12,5),(30,3,10,1659467030198,_binary '',10,10),(31,3,10,1659467779164,_binary '',20,11),(32,3,10,1659469696780,_binary '',30,12);
/*!40000 ALTER TABLE `bought_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (2);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `image_file`
--

LOCK TABLES `image_file` WRITE;
/*!40000 ALTER TABLE `image_file` DISABLE KEYS */;
INSERT INTO `image_file` VALUES (1,0,1,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(2,0,2,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(3,0,3,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(4,0,4,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(5,0,5,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(6,0,6,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(7,0,7,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(8,0,8,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png'),(9,0,9,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/275741359_703459674018862_7688472007370046109_n.jpg'),(10,0,10,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/SV_L%C3%AA%20Th%C3%A1i%20Anh.png'),(11,0,11,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/SV_L%C3%AA%20Th%C3%A1i%20Anh.png'),(12,0,12,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/SV_L%C3%AA%20Th%C3%A1i%20Anh.png');
/*!40000 ALTER TABLE `image_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `placed_order`
--

LOCK TABLES `placed_order` WRITE;
/*!40000 ALTER TABLE `placed_order` DISABLE KEYS */;
INSERT INTO `placed_order` VALUES (1,'07/08/2022','sb-43gsoj3559342@business.example.com','PAYID-MLDSQEY118869417A2801344',12,3,'thaianh'),(2,'07/10/2022','sb-43gsoj3559342@business.example.com','PAYID-MLFPSNQ4RS011157A290453X',24,3,'thaianh@gmail.com'),(3,'08/02/2022','sb-43gsoj3559342@business.example.com','PAYID-MLUSETA4W5831829D947105Y',42,5,'test@gmail.com'),(4,'08/02/2022','sb-43gsoj3559342@business.example.com','PAYID-MLUSG4Q48A124432G472205A',30,5,'test@gmail.com'),(5,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUTYHQ5PE72071E79270142',30,7,'testuser@gmail.com'),(6,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUT4YI8DE13715P85118640',30,8,'test1@gmail.com'),(7,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUUCGI8B269632CE963315D',12,8,'test1@gmail.com'),(8,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUUD6I72227418FY6337807',30,8,'test1@gmail.com'),(9,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUUFRA9GN90253JT655171C',12,8,'test1@gmail.com'),(10,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUUHFY5V149169962452253',12,8,'test1@gmail.com'),(11,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUULXQ0TA00530X95311939',30,8,'test1@gmail.com'),(12,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUUO6Y5YN65689SE113801Y',12,8,'test1@gmail.com'),(13,'08/02/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUVAWY97H58375Y7797245Y',12,5,'test@gmail.com'),(14,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUWQ6Q2R860180AX539791W',24,3,'thaianh@gmail.com'),(15,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUWWQI5CX99633AG7020139',60,3,'thaianh@gmail.com'),(16,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUW2YQ3AF93654AM723163Y',42,3,'thaianh@gmail.com'),(17,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUW34Y09F58094EN991212P',24,8,'test1@gmail.com'),(18,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUW6UA058783215M358900H',42,7,'testuser@gmail.com'),(19,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUXCAQ30F71615UT8913535',42,7,'testuser@gmail.com'),(20,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUXD6Y1LN30901GG766671N',24,7,'testuser@gmail.com'),(21,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUXKBI5X569082B4921094V',10,10,'user_test@gmail.com'),(22,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUXP3Y5WH66744H1810262F',20,10,'user_test@gmail.com'),(23,'08/03/2022','sb-qmk1k19766798@business.example.com','PAYID-MLUX63Q0B540778T8730251E',30,10,'user_test@gmail.com');
/*!40000 ALTER TABLE `placed_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'TestPlaylist',4);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist_song`
--

LOCK TABLES `playlist_song` WRITE;
/*!40000 ALTER TABLE `playlist_song` DISABLE KEYS */;
INSERT INTO `playlist_song` VALUES (1,3);
/*!40000 ALTER TABLE `playlist_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MODERATOR'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'tunganh','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',_binary '\0',30,'Songgggg','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(2,'tunganh','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',_binary '\0',30,'THIEUBAOTRAMSONG','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(3,'tunganh','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',_binary '\0',12,'Song01','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(4,'tunganh','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',_binary '\0',12,'Song02','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(5,'tunganh','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',_binary '\0',12,'Song03','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(6,'tunganh','https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png',_binary '\0',12,'Song04','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(7,'tunganh','https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png',_binary '\0',12,'Song05','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(8,'tunganh','https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/zyro-image.png',_binary '\0',12,'Song06','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/TruocTienAnhHayNoiChiaTayEmDi-ThieuBaoTramAndiez-7370326.mp3',1),(9,'lee@gmail.com','https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/275741359_703459674018862_7688472007370046109_n.jpg',_binary '\0',30,'Leeeeee','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/WakeUp-SooHyunUKISS-7664840.mp3',2),(10,NULL,'https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/SV_L%C3%AA%20Th%C3%A1i%20Anh.png',_binary '\0',10,'this is final test','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/WakeUp-SooHyunUKISS-7664840.mp3',3),(11,'artist_test@gmail.com','https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/SV_L%C3%AA%20Th%C3%A1i%20Anh.png',_binary '\0',20,'this is not final test','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/WakeUp-SooHyunUKISS-7664840.mp3',3),(12,'artist_test@gmail.com','https://mp3-images-bucket.s3.ap-southeast-1.amazonaws.com/SV_L%C3%AA%20Th%C3%A1i%20Anh.png',_binary '\0',30,'ttt1','https://mp3-songs-bucket.s3.ap-southeast-1.amazonaws.com/WakeUp-SooHyunUKISS-7664840.mp3',3);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `song_tags`
--

LOCK TABLES `song_tags` WRITE;
/*!40000 ALTER TABLE `song_tags` DISABLE KEYS */;
INSERT INTO `song_tags` VALUES (1,1),(2,1),(12,1),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2);
/*!40000 ALTER TABLE `song_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Trending'),(2,'Rock'),(3,'Dance'),(4,'Balad'),(5,'Lofi'),(6,'Random');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (3,1),(5,1),(7,1),(8,1),(10,1),(4,2),(6,2),(9,2),(2,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_song`
--

LOCK TABLES `user_song` WRITE;
/*!40000 ALTER TABLE `user_song` DISABLE KEYS */;
INSERT INTO `user_song` VALUES (3,1),(7,1),(8,1),(3,2),(5,2),(7,2),(8,2),(3,3),(5,3),(7,3),(8,3),(3,4),(7,4),(8,4),(3,5),(7,5),(8,5),(3,6),(7,6),(8,6),(3,7),(8,7),(3,8),(5,8),(8,8),(3,9),(5,9),(7,9),(8,9),(10,10),(10,11),(10,12);
/*!40000 ALTER TABLE `user_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'124','admin@gmail.com','$2a$10$7P1H.TrOTUgoIBs7Kcaym.yvm3kJ0YskaJE6fRodbtZqOwpG477fG','admin@gmail.com'),(3,NULL,'thaianh@gmail.com','$2a$10$UWWqhwaVUO6B2yj7dzHjSeyk1K58ZGJIy2DeD4MBLV8QgxGxFJJCi','thaianh@gmail.com'),(4,NULL,'tunganh@gmail.com','$2a$10$f9XNi2QVYVPBnALaTvnRb.KS9j1CdT2L2iJiYK93ILNKSmPE.Ja1W','tunganh@gmail.com'),(5,NULL,'test@gmail.com','$2a$10$kj6ZOcfq3fzAQcyf1kBGAO3L9vHgUpYIaLQXwJeZA6WlvZmWbcmsi','test@gmail.com'),(6,NULL,'lee@gmail.com','$2a$10$kuvmCUWz3s4pCwzT7R0cAegJYem/T8I2OZ/roKblmCi9EomF0NhyK','lee@gmail.com'),(7,NULL,'testuser@gmail.com','$2a$10$3uvWhtAews94Ce8uDYfPv.YRc8Y1PV0K5VsSKF.kKZEBrTfCbBmGi','testuser@gmail.com'),(8,NULL,'test1@gmail.com','$2a$10$eMBd.aDa.RCR6we9v.PrDu8dTJBCbaKL4Q8j16JMEK.hUp5U7K9Mu','test1@gmail.com'),(9,NULL,'artist_test@gmail.com','$2a$10$MU8Olnwz1tdWFGfLaNPqTumTOj6decuTYOwy8qA/x2RszF5LNKFRi','artist_test@gmail.com'),(10,NULL,'user_test@gmail.com','$2a$10$mGDtnASyyB/i7cE7SVK67u17UvHtHTIsWEFCFt/nrYenxGu14epBu','user_test@gmail.com');
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

-- Dump completed on 2022-08-03  3:27:50
