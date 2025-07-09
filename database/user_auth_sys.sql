-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: users_auth_sys
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS users;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE users (
  user_id int NOT NULL AUTO_INCREMENT,
  username varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  password_hash varchar(250) NOT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id),
  UNIQUE KEY username (username),
  UNIQUE KEY email (email)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES users WRITE;
/*!40000 ALTER TABLE users DISABLE KEYS */;
INSERT INTO users VALUES (1,'testuser','testuser@gmail.com','$2b$12$/2mmHlbKeQHf53tiUDuFxekzQM6AmB37o9H37oS5Y2QkQ2X9ilcWC','2025-07-08 09:53:35','2025-07-08 09:53:35'),(2,'mikey','mikey@gmail.com','$2b$12$d7bMmJs7gs.oTRAJwrdSWuv678jj5IOCBoOZrc2ef4UJu1MyAauMu','2025-07-08 12:33:47','2025-07-08 12:33:47'),(3,'bilal','bilal@gmail.com','$2b$12$5Oe8ywukfaPgJrqHTgFEr.yMY8yi.ENR21QJPyrwbcBxCIEdpNGJm','2025-07-08 15:49:15','2025-07-08 15:49:15'),(5,'hamza','hamza@gmail.com','$2b$12$/o0NsWXvm.V9p1SxF1Sqr.dVu/EP303Ja6k70TGHaZYu.dbia.ZCO','2025-07-08 15:51:17','2025-07-08 15:51:17'),(6,'takimichi','takimichi@gmail.com','$2b$12$K360kKcsaJKAOudFUkAYreQfCXuiT5OwHAHPsswaTs0Fe47Aij3ai','2025-07-08 15:52:38','2025-07-08 15:52:38'),(7,'draken','draken@gmail.com','$2b$12$5f9cLajfEviuxWY5A/Nn1uU..XhpziK1nJH4CTS1yXw7zIZy7890C','2025-07-09 09:29:36','2025-07-09 09:29:36');
/*!40000 ALTER TABLE users ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09  9:55:32
