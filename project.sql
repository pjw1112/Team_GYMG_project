-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `ctg_no` int NOT NULL,
  `user_no` int NOT NULL,
  `board_title` varchar(400) NOT NULL,
  `board_content` text NOT NULL,
  `board_nick` varchar(30) NOT NULL,
  `board_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `board_hit` int NOT NULL DEFAULT '0',
  `board_ip` varchar(50) NOT NULL,
  PRIMARY KEY (`board_no`),
  KEY `ctg_no` (`ctg_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`ctg_no`) REFERENCES `board_category` (`CTG_NO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (31,3,1,'가봄 맛봄 자유게시판 이용 안내 (2024년 01월 28일 기준)','<p><span style=\"font-family: Arial;\">﻿</span><font face=\"Arial\"><span style=\"background-color: var(--bs-body-bg); text-align: var(--bs-body-text-align); font-family: Arial;\">안녕하세요, 가봄 맛봄 사용자 여러분!</span><br></font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">매일같이 많은 분들이 이용하는 맛집검색 웹사이트에 오신 것을 환영합니다. 여러분의 의견을 소중히 여기고 항상 더 나은 서비스를 제공하기 위해 노력하고 있습니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">1. 새로운 기능 추가 안내</font></p><p><font face=\"Arial\">최근 업데이트로 인해 검색 기능이 더욱 향상되었습니다. 이제 더 다양한 조건으로 맛집을 찾을 수 있게 되었으니 적극적으로 활용해보세요!</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">2. 이용 규칙 및 에티켓</font></p><p><font face=\"Arial\">맛집 공유는 즐거운 경험을 나누는 좋은 방법입니다. 그러나 모두가 편안하게 사용할 수 있도록 다음 규칙을 준수해주세요.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">상업적인 광고 및 홍보 글 작성은 금지됩니다.</font></p><p><font face=\"Arial\">음란물이나 미풍양속에 반하는 내용은 엄격히 금지되며, 적발 시 즉시 삭제될 수 있습니다.</font></p><p><font face=\"Arial\">다른 사용자에게 불쾌감을 줄 수 있는 욕설 및 비방은 삼가주세요.</font></p><p><font face=\"Arial\">3. 버그 신고 및 개선 제안</font></p><p><font face=\"Arial\">웹사이트 이용 중 문제를 발견하거나 개선 아이디어가 있다면 언제든지 고객 지원팀에 연락해주세요. 여러분의 의견은 저희에게 큰 도움이 됩니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">4. 이용자 간 소통의 중요성</font></p><p><font face=\"Arial\">자유 게시판은 여러분끼리 정보를 나누고 소통하는 장소입니다. 서로에게 예의를 지키며 즐거운 대화를 이어가주시기 바랍니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">맛집검색 웹사이트를 더 편리하게 이용할 수 있도록 노력하겠습니다. 감사합니다!</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">더 나은 서비스로 찾아뵙겠습니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">감사합니다.</font></p>','관리자','2024-01-28 11:04:52',2,'192.168.1.1'),(32,4,1,'가봄 맛봄 맛집게시판 이용 안내 (2024년 01월 28일 기준)','<p><span style=\"font-family: Arial;\">﻿</span><font face=\"Arial\"><span style=\"background-color: var(--bs-body-bg); text-align: var(--bs-body-text-align); font-family: Arial;\">안녕하세요, 가봄 맛봄 사용자 여러분!</span><br></font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">매일같이 많은 분들이 이용하는 맛집검색 웹사이트에 오신 것을 환영합니다. 여러분의 의견을 소중히 여기고 항상 더 나은 서비스를 제공하기 위해 노력하고 있습니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">1. 새로운 기능 추가 안내</font></p><p><font face=\"Arial\">최근 업데이트로 인해 검색 기능이 더욱 향상되었습니다. 이제 더 다양한 조건으로 맛집을 찾을 수 있게 되었으니 적극적으로 활용해보세요!</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">2. 이용 규칙 및 에티켓</font></p><p><font face=\"Arial\">맛집 공유는 즐거운 경험을 나누는 좋은 방법입니다. 그러나 모두가 편안하게 사용할 수 있도록 다음 규칙을 준수해주세요.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">상업적인 광고 및 홍보 글 작성은 금지됩니다.</font></p><p><font face=\"Arial\">음란물이나 미풍양속에 반하는 내용은 엄격히 금지되며, 적발 시 즉시 삭제될 수 있습니다.</font></p><p><font face=\"Arial\">다른 사용자에게 불쾌감을 줄 수 있는 욕설 및 비방은 삼가주세요.</font></p><p><font face=\"Arial\">3. 버그 신고 및 개선 제안</font></p><p><font face=\"Arial\">웹사이트 이용 중 문제를 발견하거나 개선 아이디어가 있다면 언제든지 고객 지원팀에 연락해주세요. 여러분의 의견은 저희에게 큰 도움이 됩니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">4. 이용자 간 소통의 중요성</font></p><p><font face=\"Arial\">자유 게시판은 여러분끼리 정보를 나누고 소통하는 장소입니다. 서로에게 예의를 지키며 즐거운 대화를 이어가주시기 바랍니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">맛집검색 웹사이트를 더 편리하게 이용할 수 있도록 노력하겠습니다. 감사합니다!</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">더 나은 서비스로 찾아뵙겠습니다.</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\">감사합니다.</font></p>','관리자','2024-01-28 11:04:54',0,'192.168.1.1'),(33,2,2,'안녕하세요','안녕하세요 여러분! 오늘부터 맛집을 소개해보려고 합니다. 많은 추천 부탁드려요!','파란용91','2024-01-28 11:04:58',0,'192.168.1.2'),(34,2,3,'맛집 공유합니다!','안녕하세요 맛집 공유합니다. 요즘 핫한 곳이에요. 가보신 분들은 댓글로 소감 남겨주세요!','별빛지은88','2024-01-28 11:04:58',0,'192.168.1.3'),(35,2,4,'이 지역 맛집 알려주세요!','이 지역에 좋은 맛집 아시는 분 계신가요? 추천 부탁드려요!','MoonBunny','2024-01-28 11:04:58',0,'192.168.1.4'),(36,2,5,'오늘의 특별한 맛집 추천!','오늘 다녀온 맛집이 정말 특별했어요. 여러분도 꼭 가보세요!','천둥파워','2024-01-28 11:04:58',0,'192.168.1.5'),(37,2,51,'맛집 탐험','오늘은 지도를 기반으로 새로운 맛집을 탐험했습니다. 경험 공유해요!','RiverFlow','2024-01-28 11:04:58',0,'192.168.1.51'),(38,2,52,'이곳은 가볼만해!','다녀온 곳 중에서 정말 가볼만한 곳을 찾았습니다. 추천합니다!','CosmicDancer','2024-01-28 11:04:58',0,'192.168.1.52'),(39,2,53,'맛있는 디저트 맛집','오늘은 달콤한 디저트를 즐길 수 있는 맛집을 찾았어요. 다들 가보세요!','MountainKing','2024-01-28 11:04:58',1,'192.168.1.53'),(40,2,54,'새로운 음료 시도','다양한 음료를 시도해보고 싶어서 새로운 음료 맛집을 찾았어요. 추천드려요!','ValleyQueen','2024-01-28 11:04:58',0,'192.168.1.54'),(41,2,55,'가성비 최고 맛집','지갑과 입맛 모두 만족시킬 수 있는 가성비 최고의 맛집을 찾았어요. 확인해보세요!','InnoGenius','2024-01-28 11:04:58',0,'192.168.1.55'),(42,2,56,'맛있는 현지 음식','여행 중에 현지 음식을 즐기는 중인데 정말 맛있어요. 추천합니다!','HarmonySoul','2024-01-28 11:04:58',0,'192.168.1.56'),(43,2,57,'식사 후기','오늘의 식사 후기입니다. 간단하게 메뉴와 맛에 대해 소개할게요.','SunRay','2024-01-28 11:04:58',0,'192.168.1.57'),(44,2,58,'이곳은 분위기 좋은 카페','분위기 좋은 카페를 찾았어요. 커피맛도 훌륭하니 다들 가보세요!','BlossomSun','2024-01-28 11:04:58',1,'192.168.1.58'),(45,2,59,'맛집 투어 계획','주말에 친구들과 맛집 투어 계획 중입니다. 추천해주실 곳 있나요?','WaveRider','2024-01-28 11:04:58',0,'192.168.1.59'),(46,2,60,'강남 맛집 소개','강남에서 찾은 맛집 중 하나입니다. 가격 대비 맛이 좋아요. 확인해보세요!','GentleWind','2024-01-28 11:04:58',1,'192.168.1.60'),(47,1,6,'오늘의 이야기','안녕하세요 여러분! 오늘은 날씨가 정말 좋네요. 어떤 이야기를 나누고 싶으신가요?','Pink솔지','2024-01-28 11:05:01',0,'192.168.1.6'),(48,1,7,'취미 생활 공유','요즘 저는 새로운 취미를 찾아 도전 중입니다. 여러분은 어떤 취미 생활을 즐기고 계신가요?','EmeraldYuri','2024-01-28 11:05:01',1,'192.168.1.7'),(49,1,8,'인생 최고의 순간','여러분이 경험했던 인생에서 가장 감동적이었던 순간이 뭐에요? 나누고 싶은 이야기가 있다면 공유해주세요!','Iron현수','2024-01-28 11:05:01',0,'192.168.1.8'),(50,1,9,'오늘의 음악 추천','오늘 듣기 좋은 음악을 추천해봅니다. 여러분도 좋아하는 곡이 있다면 함께 나눠보아요!','Ninja태희','2024-01-28 11:05:01',0,'192.168.1.9'),(51,1,51,'방문한 카페 추천','최근 방문한 카페 중에 정말 분위기 좋고 맛있는 곳이 있어서 추천합니다. 여러분도 가보세요!','RiverFlow','2024-01-28 11:05:01',2,'192.168.1.51'),(52,1,52,'최근에 읽은 책 소개','요즘 읽은 책 중에서 인상깊었던 책을 소개합니다. 함께 읽은 분들과 나누고 싶어요.','CosmicDancer','2024-01-28 11:05:01',0,'192.168.1.52'),(53,1,53,'오늘의 일기','오늘 있었던 일들을 간단히 기록해봅니다. 여러분도 오늘 하루 어땠나요?','MountainKing','2024-01-28 11:05:01',0,'192.168.1.53'),(54,1,54,'취미 공유','최근 즐기고 있는 취미에 대해 이야기하려고 합니다. 다양한 취미를 공유해주세요!','ValleyQueen','2024-01-28 11:05:01',0,'192.168.1.54'),(55,1,55,'영화 추천','요즘 본 영화 중에서 강추하는 작품이 있어서 소개합니다. 함께 나누고 싶은 추천이 있으면 댓글로 알려주세요!','InnoGenius','2024-01-28 11:05:01',0,'192.168.1.55'),(56,1,56,'여행 추억 공유','최근 다녀온 여행에서의 추억을 사진과 함께 공유하려고 합니다. 여행 이야기 나누어요!','HarmonySoul','2024-01-28 11:05:01',1,'192.168.1.56'),(57,1,57,'무료 웹툰 추천','무료로 볼 수 있는 웹툰 중에서 재밌게 본 작품을 추천합니다. 다양한 웹툰 소개 부탁드려요!','SunRay','2024-01-28 11:05:01',0,'192.168.1.57'),(58,1,58,'하루 일과 공유','오늘의 일과와 함께 간단한 하루를 공유하려고 합니다. 여러분도 오늘은 어떤 하루를 보내셨나요?','BlossomSun','2024-01-28 11:05:01',1,'192.168.1.58'),(59,1,59,'가족 소식 나눔','가족들과 함께한 소소한 일상 이야기를 나누고 싶어요. 여러분도 가족 소식 나눠주세요!','WaveRider','2024-01-28 11:05:01',0,'192.168.1.59'),(60,1,60,'좋아하는 음악 소개','요즘 듣고 있는 좋아하는 음악을 소개합니다. 여러분의 음악 취향도 알려주세요!','GentleWind','2024-01-28 11:05:01',0,'192.168.1.60');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_category`
--

DROP TABLE IF EXISTS `board_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_category` (
  `CTG_NO` int NOT NULL AUTO_INCREMENT,
  `CTG_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`CTG_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_category`
--

LOCK TABLES `board_category` WRITE;
/*!40000 ALTER TABLE `board_category` DISABLE KEYS */;
INSERT INTO `board_category` VALUES (1,'자유게시판'),(2,'맛집게시판'),(3,'자유게시판-공지'),(4,'맛집게시판-공지');
/*!40000 ALTER TABLE `board_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_file`
--

DROP TABLE IF EXISTS `board_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_file` (
  `file_no` int NOT NULL,
  `board_no` int NOT NULL,
  KEY `file_no` (`file_no`),
  KEY `board_no` (`board_no`),
  CONSTRAINT `board_file_ibfk_1` FOREIGN KEY (`file_no`) REFERENCES `img_file` (`file_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_file_ibfk_2` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_file`
--

LOCK TABLES `board_file` WRITE;
/*!40000 ALTER TABLE `board_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_like`
--

DROP TABLE IF EXISTS `board_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_like` (
  `board_like_no` int NOT NULL AUTO_INCREMENT,
  `board_no` int NOT NULL,
  `user_no` int NOT NULL,
  PRIMARY KEY (`board_like_no`),
  KEY `board_no` (`board_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `board_like_ibfk_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_like_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_like`
--

LOCK TABLES `board_like` WRITE;
/*!40000 ALTER TABLE `board_like` DISABLE KEYS */;
INSERT INTO `board_like` VALUES (1,51,106);
/*!40000 ALTER TABLE `board_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_reply`
--

DROP TABLE IF EXISTS `board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_reply` (
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `board_no` int NOT NULL,
  `user_no` int NOT NULL,
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_content` varchar(1000) NOT NULL,
  `reply_nick` varchar(30) NOT NULL,
  `reply_ip` varchar(50) NOT NULL,
  PRIMARY KEY (`reply_no`),
  KEY `board_no` (`board_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `board_reply_ibfk_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_reply_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_reply`
--

LOCK TABLES `board_reply` WRITE;
/*!40000 ALTER TABLE `board_reply` DISABLE KEYS */;
INSERT INTO `board_reply` VALUES (13,60,30,'2024-01-28 11:06:40','흥미로운 내용에 댓글 남깁니다. 다음 이야기도 기대돼요!','SilverMoon','192.168.1.30'),(14,60,31,'2024-01-28 11:06:40','댓글 감사합니다. 여러분의 참여로 더욱 풍성한 이야기가 될 것 같아 기쁩니다.','FistOfFury','192.168.1.31'),(15,60,32,'2024-01-28 11:06:40','맛집 정보 좋아요. 가보고 싶은데 위치 좀 알려주세요!','GalacticExplorer','192.168.1.32'),(16,60,33,'2024-01-28 11:06:40','맛집 공유 감사합니다. 다음에 같이 가보면 더 즐거울 것 같아요.','TimeTraveller','192.168.1.33'),(17,60,34,'2024-01-28 11:06:40','취미 생활 공유 좋아요. 같이 취미 생활하면 더 행복해지겠죠?','SeaAdventurer','192.168.1.34'),(18,59,35,'2024-01-28 11:06:40','인생 최고의 순간 나누어 주셔서 감사합니다. 함께 행복한 순간을 누려보아요!','PeakConqueror','192.168.1.35'),(19,59,36,'2024-01-28 11:06:40','오늘의 음악 추천 정말 고마워요. 다양한 음악 소개해주셔서 감사합니다!','CloudRider','192.168.1.36'),(20,59,37,'2024-01-28 11:06:40','방문한 카페 추천 감사합니다. 다른 추천도 기대할게요!','BlossomQueen','192.168.1.37'),(21,59,38,'2024-01-28 11:06:40','책 소개 감사합니다. 책 읽는 즐거움을 함께 나누어요!','GaleForce','192.168.1.38'),(22,59,39,'2024-01-28 11:06:40','오늘의 일기 읽어보니 너무 훈훈하네요. 자주 소통하자고요!','TerraFirma','192.168.1.39'),(23,46,106,'2024-01-28 11:07:44','좋네요','바나나당!!히히','172.30.1.86');
/*!40000 ALTER TABLE `board_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_file`
--

DROP TABLE IF EXISTS `img_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `img_file` (
  `file_no` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_file`
--

LOCK TABLES `img_file` WRITE;
/*!40000 ALTER TABLE `img_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `img_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_type`
--

DROP TABLE IF EXISTS `join_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `join_type` (
  `join_type_no` int NOT NULL AUTO_INCREMENT,
  `join_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`join_type_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_type`
--

LOCK TABLES `join_type` WRITE;
/*!40000 ALTER TABLE `join_type` DISABLE KEYS */;
INSERT INTO `join_type` VALUES (1,'일반'),(2,'네이버'),(3,'카카오');
/*!40000 ALTER TABLE `join_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_no` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(100) NOT NULL,
  PRIMARY KEY (`location_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'서초구'),(2,'강남구'),(3,'종로구'),(4,'중구'),(5,'용산구'),(6,'성동구'),(7,'중랑구'),(8,'성북구'),(9,'도봉구'),(10,'노원구'),(11,'은평구'),(12,'서대문구'),(13,'강서구'),(14,'구로구'),(15,'금천구'),(16,'영등포구'),(17,'동작구'),(18,'관악구'),(19,'광진구'),(20,'동대문구'),(21,'마포구'),(22,'양천구'),(23,'강동구');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_no` int NOT NULL AUTO_INCREMENT,
  `rest_no` int NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_price` int NOT NULL,
  PRIMARY KEY (`menu_no`),
  KEY `rest_no` (`rest_no`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`rest_no`) REFERENCES `restaurant` (`rest_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro_line`
--

DROP TABLE IF EXISTS `metro_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro_line` (
  `line_no` int NOT NULL AUTO_INCREMENT,
  `loc_no` int NOT NULL,
  `line_name` varchar(50) NOT NULL,
  PRIMARY KEY (`line_no`),
  KEY `loc_no` (`loc_no`),
  CONSTRAINT `metro_line_ibfk_1` FOREIGN KEY (`loc_no`) REFERENCES `metro_location` (`loc_no`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_line`
--

LOCK TABLES `metro_line` WRITE;
/*!40000 ALTER TABLE `metro_line` DISABLE KEYS */;
INSERT INTO `metro_line` VALUES (1,1,'1호선'),(2,1,'2호선'),(3,1,'3호선'),(4,1,'4호선'),(5,1,'5호선'),(6,1,'6호선'),(7,1,'7호선'),(8,1,'8호선'),(9,1,'9호선'),(10,1,'인천1호선'),(11,1,'인천2호선'),(12,1,'수인분당선'),(13,1,'신분당'),(14,1,'경의중앙'),(15,1,'공항철도'),(16,1,'경춘선'),(17,1,'의정부 경전철'),(18,1,'용인 에버라인'),(19,1,'경가선'),(20,1,'우이신설선'),(21,1,'서해선'),(22,1,'김포 골드라인'),(23,1,'신림선'),(24,2,'1호선'),(25,2,'2호선'),(26,2,'3호선'),(27,2,'4호선'),(28,2,'경전철'),(29,3,'1호선'),(30,3,'2호선'),(31,3,'3호선'),(32,4,'1호선'),(33,5,'1호선');
/*!40000 ALTER TABLE `metro_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro_location`
--

DROP TABLE IF EXISTS `metro_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro_location` (
  `loc_no` int NOT NULL AUTO_INCREMENT,
  `loc_name` varchar(15) NOT NULL,
  PRIMARY KEY (`loc_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_location`
--

LOCK TABLES `metro_location` WRITE;
/*!40000 ALTER TABLE `metro_location` DISABLE KEYS */;
INSERT INTO `metro_location` VALUES (1,'서울/경기/인천'),(2,'부산'),(3,'대구'),(4,'대전'),(5,'광주');
/*!40000 ALTER TABLE `metro_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metro_station`
--

DROP TABLE IF EXISTS `metro_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metro_station` (
  `station_no` int NOT NULL AUTO_INCREMENT,
  `line_no` int NOT NULL,
  `loc_no` int NOT NULL,
  `station_name` varchar(100) NOT NULL,
  `station_address` varchar(400) NOT NULL,
  PRIMARY KEY (`station_no`),
  KEY `line_no` (`line_no`),
  KEY `loc_no` (`loc_no`),
  CONSTRAINT `metro_station_ibfk_1` FOREIGN KEY (`line_no`) REFERENCES `metro_line` (`line_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metro_station_ibfk_2` FOREIGN KEY (`loc_no`) REFERENCES `metro_location` (`loc_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro_station`
--

LOCK TABLES `metro_station` WRITE;
/*!40000 ALTER TABLE `metro_station` DISABLE KEYS */;
INSERT INTO `metro_station` VALUES (1,1,1,'노량진','서울특별시 동작구 노량진로 151'),(2,1,1,'대방','서울특별시 영등포구 여의대방로 300'),(3,1,1,'신길','서울특별시 영등포구 영등포로 327'),(4,1,1,'영등포','서울 영등포구 경인로 846'),(5,1,1,'신도림','서울특별시 구로구 경인로 688'),(6,1,1,'구로','서울특별시 구로구 구로중앙로 174'),(7,1,1,'가산디지털단지','서울특별시 금천구 벚꽃로 309 (가산동 468-4)'),(8,1,1,'독산','서울특별시 금천구 벚꽃로 115'),(9,1,1,'금천구청','서울특별시 금천구 시흥대로63길 91'),(10,1,1,'석수','경기도 안양시 만안구 경수대로 1431'),(11,1,1,'관악','경기도 안양시 만안구 경수대로1273번길 46'),(12,1,1,'안양','경기 안양시 만안구 만안로 232'),(13,1,1,'명학','경기도 안양시 만안구 만안로 20'),(14,1,1,'금정','경기도 군포시 군포로 750'),(15,1,1,'군포','경기도 군포시 군포역1길 27'),(16,1,1,'당정','경기도 군포시 당정역로 91 (당정동 938)'),(17,1,1,'의왕','경기도 의왕시 철도박물관로 66 (삼동 191)'),(18,1,1,'성균관대','경기도 수원시 장안구 서부로 2149 (율전동 495-2)'),(19,1,1,'화서','경기도 수원시 팔달구 덕영대로 692 (화서동 464)'),(20,1,1,'수원','경기 수원시 팔달구 덕영대로 924'),(21,1,1,'세류','경기도 수원시 권선구 정조로 387'),(22,1,1,'병점','경기도 화성시 떡전골로 97'),(23,1,1,'세마','경기도 오산시 세마역로 88 (세교동 244-5)'),(24,1,1,'서동탄','경기도 오산시 외삼미로15번길 75-60 (외삼미동 258)'),(25,1,1,'오산대','경기도 오산시 청학로 236'),(26,1,1,'오산','경기도 오산시 역광장로 59 (오산동 603-116)'),(27,1,1,'진위','경기도 평택시 진위면 경기대로 1855'),(28,1,1,'송탄','경기도 평택시 송탄공원로 43 (신장동 257-5)'),(29,1,1,'서정리','경기 평택시 탄현로 51'),(30,1,1,'지제','경기 평택시 경기대로 777'),(31,1,1,'평택','경기 평택시 평택로 51'),(32,1,1,'성환','충남 천안시 서북구 성환읍 성환1로 237-5'),(33,1,1,'직산','충청남도 천안시 서북구 직산읍 천안대로 1471-33'),(34,1,1,'두정','충청남도 천안시 서북구 두정로 289'),(35,1,1,'천안','충남 천안시 동남구 대흥로 239'),(36,1,1,'봉명','충청남도 천안시 동남구 차돌로 51'),(37,1,1,'쌍용','충청남도 천안시 서북구 쌍용19로 20(쌍용동 426-3)'),(38,1,1,'아산','충남 아산시 배방읍 희망로 90'),(39,1,1,'탕정','충청남도 아산시 탕정면 매곡중앙6로 11'),(40,1,1,'배방','충청남도 아산시 배방읍 온천대로 1967'),(41,1,1,'풍기','경북 영주시 풍기읍 인삼로 1'),(42,1,1,'온양온천','충남 아산시 온천대로 1496'),(43,1,1,'신창','충남 아산시 신창면 행목로 50'),(44,1,1,'구일','서울특별시 구로구 구일로 133 (구로동 636-45)'),(45,1,1,'개봉','서울특별시 구로구 경인로40길 47 (개봉동 415)'),(47,1,1,'오류동','서울특별시 구로구 경인로20길 13 (오류동 66)'),(48,1,1,'온수','서울특별시 구로구 부일로 872'),(49,1,1,'역곡','경기도 부천시 원미구 역곡로 1 (역곡동 382)'),(50,1,1,'소사','경기도 부천시 원미구 소사로 284 (소사동 43-51)'),(51,1,1,'부천','경기도 부천시 소사구 부천로 1 (심곡본동 316-2)'),(52,1,1,'중동','경기도 부천시 소사구 중동로 73'),(53,1,1,'송내','경기도 부천시 소사구 송내대로 43 (송내동 632-4)'),(54,1,1,'부개','인천광역시 부평구 수변로 22'),(55,1,1,'부평','인천광역시 부평구 광장로 16'),(56,1,1,'백운','인천광역시 부평구 마장로55번길 14'),(57,1,1,'동암','인천광역시 부평구 동암광장로 10 (십정동 541)'),(58,1,1,'간석','인천광역시 남동구 석정로 522-14 (간석동 757)'),(59,1,1,'주안','인천광역시 미추홀구 주안로 95-19'),(60,1,1,'도화','인천광역시 미추홀구 숙골로24번길 9'),(61,1,1,'제물포','인천광역시 미추홀구 경인로 129(도화동 450-39)'),(62,1,1,'도원','인천광역시 동구 참외전로 245 (창영동 179-1)'),(63,1,1,'동인천','인천광역시 중구 참외전로 121 (인현동 1-613)'),(64,1,1,'인천',' 인천광역시 중구 제물량로 269'),(65,1,1,'소요산','서울 용산구 한강대로 23길 55'),(66,1,1,'동두천','경기 동두천시 평화로 2687'),(67,1,1,'보산','경기도 동두천시 평화로 2539 (보산동 422)'),(68,1,1,'동두천중앙','경기도 동두천시 동두천로 228 (생연동 726-3)'),(69,1,1,'지행','경기도 동두천시 평화로 2285'),(70,1,1,'덕장','경기도 양주시 화합로 1356'),(71,1,1,'덕계','경기도 양주시 덕계로 126 (덕계동 209-5)'),(72,1,1,'양주','경기도 양주시 평화로 919'),(73,1,1,'녹양','경기도 의정부시 평화로 757'),(74,1,1,'기능','경기도 의정부시 평화로 525'),(75,1,1,'의정부','경기 의정부시 평화로 525'),(76,1,1,'희룡','경기 의정부시 의정부동 396'),(82,1,1,'망월사','경기도 의정부시 평화로 221 (호원동 50-5)'),(83,1,1,'도봉산','서울특별시 도봉구 도봉로 948 (도봉동 301-5)'),(84,1,1,'방학','서울특별시 도봉구 도봉로150다길 3'),(85,1,1,'녹천','서울특별시 도봉구 덕릉로 376'),(87,1,1,'월계','서울특별시 노원구 월계로53길 40'),(88,1,1,'광운대','서울특별시 노원구 석계로 98-2 (월계동 85)'),(89,1,1,'석계','서울특별시 노원구 화랑로 341'),(90,1,1,'신이문','서울특별시 동대문구 한천로 472 (이문동 7)'),(91,1,1,'외대앞','서울특별시 동대문구 휘경로 27'),(92,1,1,'회기','서울특별시 동대문구 회기로 196'),(93,1,1,'청량리','서울 동대문구 왕산로 214'),(94,1,1,'제기동','서울특별시 동대문구 왕산로 지하93 (제기동 65)'),(95,1,1,'신설동','서울특별시 동대문구 왕산로 지하1 (신설동 76-5)'),(96,1,1,'동묘앞','서울특별시 종로구 종로 359 (숭인동 117)'),(97,1,1,'동대문','서울특별시 종로구 종로 지하302 (창신동 492-1)'),(98,1,1,'종로5가','서울특별시 종로구 종로 지하216 (종로5가 82-1)'),(99,1,1,'종로3가','서울특별시 종로구 종로 지하129'),(100,1,1,'종각','서울특별시 종로구 종로 지하55 (종로1가 54)'),(101,1,1,'서울시청','서울특별시 중구 세종대로 지하101 (정동 5-5)'),(102,1,1,'서울역','서울 용산구 한강대로 405'),(103,1,1,'남영','서울특별시 용산구 한강대로77길 25'),(104,1,1,'용산','서울 용산구 한강대로23길 55');
/*!40000 ALTER TABLE `metro_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_biz`
--

DROP TABLE IF EXISTS `rest_biz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rest_biz` (
  `biz_no` int NOT NULL AUTO_INCREMENT,
  `rest_no` int NOT NULL,
  `biz_day` int NOT NULL,
  `biz_open` varchar(100) NOT NULL,
  `biz_close` varchar(100) NOT NULL,
  `biz_off` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`biz_no`),
  KEY `rest_no` (`rest_no`),
  CONSTRAINT `rest_biz_ibfk_1` FOREIGN KEY (`rest_no`) REFERENCES `restaurant` (`rest_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_biz`
--

LOCK TABLES `rest_biz` WRITE;
/*!40000 ALTER TABLE `rest_biz` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest_biz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_category`
--

DROP TABLE IF EXISTS `rest_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rest_category` (
  `ctg_no` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(30) NOT NULL,
  PRIMARY KEY (`ctg_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_category`
--

LOCK TABLES `rest_category` WRITE;
/*!40000 ALTER TABLE `rest_category` DISABLE KEYS */;
INSERT INTO `rest_category` VALUES (1,'한식'),(2,'양식'),(3,'중식'),(4,'일식'),(5,'아시안'),(6,'분식'),(7,'고기/구이'),(8,'피자/치킨'),(9,'레스토랑'),(10,'뷔페'),(11,'카페/디저트'),(12,'주점'),(13,'기타');
/*!40000 ALTER TABLE `rest_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_file`
--

DROP TABLE IF EXISTS `rest_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rest_file` (
  `file_no` int NOT NULL,
  `rest_no` int NOT NULL,
  KEY `file_no` (`file_no`),
  KEY `rest_no` (`rest_no`),
  CONSTRAINT `rest_file_ibfk_1` FOREIGN KEY (`file_no`) REFERENCES `img_file` (`file_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rest_file_ibfk_2` FOREIGN KEY (`rest_no`) REFERENCES `restaurant` (`rest_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_file`
--

LOCK TABLES `rest_file` WRITE;
/*!40000 ALTER TABLE `rest_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_like`
--

DROP TABLE IF EXISTS `rest_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rest_like` (
  `rest_like_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int NOT NULL,
  `rest_no` int NOT NULL,
  PRIMARY KEY (`rest_like_no`),
  KEY `user_no` (`user_no`),
  KEY `rest_no` (`rest_no`),
  CONSTRAINT `rest_like_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rest_like_ibfk_2` FOREIGN KEY (`rest_no`) REFERENCES `restaurant` (`rest_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_like`
--

LOCK TABLES `rest_like` WRITE;
/*!40000 ALTER TABLE `rest_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `rest_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `rest_no` int NOT NULL AUTO_INCREMENT,
  `ctg_no` int NOT NULL,
  `rest_name` varchar(100) NOT NULL,
  `rest_desc` varchar(400) NOT NULL,
  `rest_address` varchar(400) NOT NULL,
  `rest_tel` varchar(15) NOT NULL,
  `rest_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rest_station` varchar(100) DEFAULT NULL,
  `rest_address2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rest_no`),
  KEY `ctg_no` (`ctg_no`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`ctg_no`) REFERENCES `rest_category` (`ctg_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (31,1,'명가의 뜰1','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(32,1,'명가의 뜰2','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(33,1,'명가의 뜰3','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(34,1,'명가의 뜰4','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(35,1,'명가의 뜰5','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(36,1,'명가의 뜰6','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(37,1,'명가의 뜰7','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(38,1,'명가의 뜰8','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(39,1,'명가의 뜰9','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(40,1,'명가의 뜰10','서울역 한식당 명가의 뜰','서울특별시 용산구 동자동 43-277','02-365-4831','2024-01-21 04:43:37','서울역',NULL),(41,2,'더플레이스 서울 스퀘어점1','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(42,2,'더플레이스 서울 스퀘어점2','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(43,2,'더플레이스 서울 스퀘어점3','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(44,2,'더플레이스 서울 스퀘어점4','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(45,2,'더플레이스 서울 스퀘어점5','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(46,2,'더플레이스 서울 스퀘어점6','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(47,2,'더플레이스 서울 스퀘어점7','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(48,2,'더플레이스 서울 스퀘어점8','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(49,2,'더플레이스 서울 스퀘어점9','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(50,2,'더플레이스 서울 스퀘어점10','서울스퀘어 더플레이스 화려한 불쇼 폭탄피자','서울특별시 중구 남대문로5가 541-1','02-123-4567','2024-01-21 04:43:37','서울역',NULL),(51,3,'드래곤차이1','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(52,3,'드래곤차이2','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(53,3,'드래곤차이3','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(54,3,'드래곤차이4','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(55,3,'드래곤차이5','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(56,3,'드래곤차이6','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(57,3,'드래곤차이7','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(58,3,'드래곤차이8','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(59,3,'드래곤차이9','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL),(60,3,'드래곤차이10','안양역 1순위 중식당 드래곤차이1','경기도 안양시 만안구 안양로 314번길 18','031-123-1234','2024-01-21 04:43:37','안양역',NULL);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int NOT NULL,
  `rest_no` int NOT NULL,
  `review_content` varchar(400) NOT NULL,
  `review_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review_star` int NOT NULL,
  `review_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`review_no`),
  KEY `user_no` (`user_no`),
  KEY `rest_no` (`rest_no`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`rest_no`) REFERENCES `restaurant` (`rest_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_no` int NOT NULL AUTO_INCREMENT,
  `type_no` int NOT NULL,
  `join_type_no` int NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_nick` varchar(30) NOT NULL,
  `user_pw` varchar(400) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_intro` varchar(150) NOT NULL DEFAULT '',
  `user_ip` varchar(50) NOT NULL,
  `user_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_no`),
  KEY `type_no` (`type_no`),
  KEY `join_type_no` (`join_type_no`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`type_no`) REFERENCES `user_type` (`type_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`join_type_no`) REFERENCES `join_type` (`join_type_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,1,'admin','관리자','관리자','1234','010-1111-1111','','192.168.1.1','2024-01-21 01:00:00'),(2,2,1,'kimminsu91@example.com','김민수','파란용91','x8Jk$92!','010-3241-5687','','183.76.45.34','2023-07-18 01:15:30'),(3,2,1,'leejieun1988@example.net','이지은','별빛지은88','a5B*12zD','010-7625-9812','','172.58.63.89','2022-05-19 02:03:21'),(4,2,1,'choiseoyeon2002@mail.com','최서연','MoonBunny','U7md#4kP','010-4632-7894','','198.51.100.42','2021-03-20 03:42:08'),(5,2,1,'parkjungwoo93@webmail.com','박정우','천둥파워','Qm3$T9!z','010-8723-6472','','203.0.113.76','2019-12-21 04:27:53'),(6,2,1,'hansolji77@example.co.kr','한솔지','Pink솔지','fV2#Lp8@','010-9573-4621','','192.0.2.16','2018-11-22 05:16:39'),(7,2,1,'kwonyuri56@inbox.com','권유리','EmeraldYuri','sZ4&uN7*','010-7823-5648','','198.51.100.23','2017-08-23 06:55:12'),(8,2,1,'limhyunsoo84@outlook.com','임현수','Iron현수','b8K#4yZ!','010-6732-9851','','172.16.254.3','2016-06-24 07:44:07'),(9,2,1,'jeongtaehee99@gmail.com','정태희','Ninja태희','Wp5@cV2*','010-8642-7315','','203.0.113.195','2015-04-25 08:31:58'),(10,2,1,'kimsunyoung2003@yahoo.com','김선영','은여우선영','G4!fzX6v','010-9342-6784','','192.0.2.99','2014-02-26 09:23:45'),(11,2,1,'choiyejin65@live.com','최예진','Gold예진65','L8#mN3$q','010-7512-9863','','198.51.100.101','2012-01-27 10:10:33'),(12,2,1,'jungwoo93@domain.com','김정우','LightningAce','L1ghtn!ng','010-5678-1234','','192.168.10.15','2020-06-15 05:30:25'),(13,2,1,'haneulsky@skyemail.com','이하늘','BlueSky','SkYh1gh!','010-6789-2345','','192.168.20.16','2018-07-22 07:45:10'),(14,2,1,'minji88@live.com','박민지','StarMinji','St4rL1ght','010-7890-3456','','192.168.30.17','2019-05-30 02:20:35'),(15,2,1,'taeho_sung@inbox.com','정태호','SungHero','Her0T@eho','010-8901-4567','','192.168.40.18','2016-04-12 00:15:50'),(16,2,1,'yujin_flower@mail.com','김유진','FlowerYujin','Fl0werP0wer','010-9012-5678','','192.168.50.19','2021-08-18 11:30:45'),(17,2,1,'sungmin_k@coolmail.com','이성민','CoolMin','Co0lM1n!','010-0123-6789','','192.168.60.20','2017-12-25 08:50:30'),(18,2,1,'hyejin_92@webmail.com','황혜진','JinnyStar','St4rJ1n!','010-1234-7890','','192.168.70.21','2023-01-05 04:10:55'),(19,2,1,'dohyun_wizard@magic.com','최도현','MagicWizard','W1zardDoh','010-2345-8901','','192.168.80.22','2015-09-17 09:40:20'),(20,2,1,'jiwonmoon@night.com','장지원','Moonlight','M00nL1ght','010-3456-9012','','192.168.90.23','2022-03-29 13:15:05'),(21,2,1,'sungho_king@royal.com','윤성호','KingHo','K1ngHo!','010-4567-0123','','192.168.100.24','2020-10-10 03:00:00'),(22,2,1,'hyunwoo90@domain.com','조현우','StarFighter','Hyun90Woo!','010-6587-1234','','183.85.47.21','2011-09-14 23:20:30'),(23,2,1,'seojin88@skyemail.com','김서진','JinnyMagic','Se0Jin#88','010-7891-2345','','174.68.65.12','2013-04-22 08:30:10'),(24,2,1,'yeji92@live.com','박예지','DancingStar','YeJi#2022','010-8912-3456','','198.54.103.33','2015-06-30 04:40:45'),(25,2,1,'minjun87@inbox.com','이민준','RapidThunder','M1nJun#1','010-9123-4567','','205.112.76.58','2017-03-12 01:50:20'),(26,2,1,'sohyun89@mail.com','황소현','ButterflyQueen','SoHyun#89','010-0234-5678','','192.10.55.19','2019-08-18 10:25:55'),(27,2,1,'jihoon95@coolmail.com','정지훈','MightyDragon','J1Hoon#95','010-1345-6789','','192.168.61.20','2020-12-25 07:05:40'),(28,2,1,'hyejung93@webmail.com','김혜정','WindyRose','Hy3Jung93','010-2456-7890','','193.168.72.22','2014-01-05 05:15:30'),(29,2,1,'junseok91@magic.com','박준석','OceanMaster','JunS3ok#1','010-3567-8901','','198.51.120.23','2016-09-17 11:20:20'),(30,2,1,'eunji89@night.com','이은지','SilverMoon','EunJi#89','010-4678-9012','','203.0.115.24','2018-03-29 14:30:05'),(31,2,1,'taekwon83@royal.com','최태권','FistOfFury','TaeKwon#83','010-5789-0123','','192.168.101.25','2021-10-10 03:45:00'),(32,2,1,'moonjae89@space.com','문재인','GalacticExplorer','Mo89Ja!#','010-1122-9988','','192.168.50.11','2015-07-13 06:30:20'),(33,2,1,'kimjung94@history.net','김정은','TimeTraveller','Ki94Jung$','010-2233-4466','','172.58.62.29','2018-05-21 03:15:40'),(34,2,1,'leesoo98@ocean.com','이수현','SeaAdventurer','Le98Soo@','010-3344-5567','','198.51.102.34','2020-04-18 08:25:55'),(35,2,1,'parkyeon77@mountain.com','박연수','PeakConqueror','Pa77Yeon#','010-4455-6678','','203.0.115.78','2016-06-24 00:45:33'),(36,2,1,'choiha90@skyhigh.com','최하늘','CloudRider','Ch90Ha!!','010-5566-7789','','192.0.3.22','2019-09-11 11:10:10'),(37,2,1,'jangmi88@flower.com','장미란','BlossomQueen','Ja88Mi!@','010-6677-8890','','198.51.101.47','2017-03-05 05:20:30'),(38,2,1,'hanbiro85@wind.com','한비로','GaleForce','Han85Bi#','010-7788-9901','','172.16.255.99','2021-08-19 02:35:50'),(39,2,1,'kwonji99@earth.com','권지아','TerraFirma','Kw99Ji@@','010-8899-0012','','203.0.114.56','2013-12-20 07:55:25'),(40,2,1,'minho93@sun.com','민호석','SolarFlare','Mi93Ho$$','010-9900-1123','','192.168.99.63','2022-02-27 09:30:45'),(41,2,1,'yoonseo91@moon.com','윤서진','LunarEclipse','Yo91Seo*','010-1234-5678','','192.168.88.24','2014-07-15 04:10:10'),(42,2,1,'sooyeon82@nature.com','김수연','ForestNymph','Su82Yeon*','010-9911-2233','','183.77.45.89','2017-06-14 03:30:45'),(43,2,1,'hyunjin91@stars.com','이현진','StarGazer','Hy91Jin!','010-8822-3344','','172.59.64.90','2019-05-23 05:20:30'),(44,2,1,'seokmin95@adventure.net','박석민','ExplorerPark','Se95Min@','010-7733-4455','','198.52.101.43','2021-04-21 08:35:50'),(45,2,1,'jihoon89@tech.com','정지훈','TechWizard','Ji89Hoon#','010-6644-5566','','203.1.113.77','2013-07-27 00:55:25'),(46,2,1,'nayeon88@music.com','김나연','MelodyMaker','Na88Yeon$','010-5555-6677','','192.1.2.17','2018-09-14 11:40:40'),(47,2,1,'daehyun92@dream.com','이대현','DreamCatcher','Da92Hyun!','010-4466-7788','','198.52.100.48','2016-03-08 06:25:30'),(48,2,1,'minji94@light.com','황민지','BrightStar','Min94Ji#','010-3377-8899','','172.17.254.100','2020-08-22 03:10:10'),(49,2,1,'jungwoo90@wave.com','권정우','OceanWave','Jung90Woo$','010-2288-9900','','203.1.115.57','2014-12-23 09:05:05'),(50,2,1,'soojin89@windy.com','박수진','GentleBreeze','Soo89Jin*','010-1199-0011','','192.168.98.64','2023-02-28 10:45:55'),(51,2,1,'hyunwoo93@river.com','윤현우','RiverFlow','Hy93Woo!','010-1000-1122','','192.168.87.25','2015-07-18 04:20:20'),(52,2,1,'yejin84@cosmos.com','한예진','CosmicDancer','Ye84Jin!','010-2211-3344','','184.78.46.35','2016-08-15 02:30:40'),(53,2,1,'jungho87@peak.com','김정호','MountainKing','Ju87Ho#','010-3322-4455','','173.59.65.91','2020-06-24 04:25:30'),(54,2,1,'soyeon92@valley.net','박소연','ValleyQueen','So92Yeon$','010-4433-5566','','199.53.102.44','2022-05-22 09:40:55'),(55,2,1,'minjae88@innovate.com','이민재','InnoGenius','Mi88Jae@','010-5544-6677','','204.2.114.78','2014-09-28 01:05:20'),(56,2,1,'hyebin93@harmony.com','정혜빈','HarmonySoul','Hy93Bin#','010-6655-7788','','193.2.3.18','2019-11-15 12:15:45'),(57,2,1,'taeyang91@sunray.com','권태양','SunRay','Ta91Yang$','010-7766-8899','','199.53.101.49','2017-04-09 07:30:35'),(58,2,1,'eunmi89@blossom.com','황은미','BlossomSun','Eu89Mi#','010-8877-9900','','173.18.255.101','2021-09-23 04:20:20'),(59,2,1,'jinho85@wave.com','박진호','WaveRider','Ji85Ho!','010-9988-0011','','204.2.116.58','2018-12-24 10:10:10'),(60,2,1,'seoyeon86@breeze.com','이서연','GentleWind','Se86Yeon*','010-8899-1122','','193.168.99.65','2015-03-01 11:50:55'),(61,2,1,'hyukjin90@stream.com','윤혁진','StreamFlow','Hy90Jin$','010-7700-2233','','192.168.86.26','2013-08-19 05:30:25'),(62,2,1,'jiwon94@starlight.com','박지원','StarGazer','Ji94Won*','010-1122-3344','','192.168.77.12','2015-11-20 00:45:30'),(63,2,1,'seokjin88@oceanview.net','김석진','OceanExplorer','Seok88Jin!','010-2233-4455','','173.45.89.123','2016-07-15 08:20:50'),(64,2,1,'jiyoung93@meadow.com','이지영','MeadowDreamer','Ji93Young$','010-3344-5566','','199.2.3.45','2017-12-10 02:35:15'),(65,2,1,'jaewook89@thunderbolt.com','김재욱','ThunderStorm','Ja89Wook#','010-4455-6677','','204.2.120.76','2018-02-05 05:10:25'),(66,2,1,'sooyeon87@aurora.com','김수연','AuroraShine','Soo87Yeon*','010-5566-7788','','192.168.33.89','2019-04-30 07:55:40'),(67,2,1,'hoyoung91@moonlight.com','이호영','MoonLighter','Ho91Young!','010-6677-8899','','173.59.77.234','2020-08-05 10:20:55'),(68,2,1,'minji92@stardust.com','박민지','StarDustGazer','Minji92#','010-7788-9900','','199.53.102.56','2021-03-15 01:15:30'),(69,2,1,'jiho85@whirlwind.com','이지호','WhirlwindRider','Ji85Ho!','010-8899-0011','','192.168.66.78','2022-01-10 12:05:20'),(70,2,1,'jiyoung86@sunbeam.com','김지영','SunbeamSerenity','Ji86Young$','010-9900-1122','','204.2.118.34','2022-08-24 05:30:10'),(71,2,1,'seungjin90@waterfall.com','이승진','WaterfallChaser','Seung90Jin*','010-1122-2233','','193.168.77.90','2023-03-04 23:50:45'),(72,2,1,'seoyeon85@windyhill.com','김서연','WindyHillBliss','Seoyeon85#','010-3344-4455','','192.168.45.67','2014-06-19 08:40:55'),(73,2,1,'seojin92@firefly.com','이서진','FireflyWatcher','Seojin92*','010-2233-3344','','204.2.101.23','2016-09-26 23:15:30'),(74,2,1,'jihyun89@silverlake.net','박지현','SilverLakeDream','Ji89Hyun!','010-5566-6677','','173.45.67.89','2018-12-15 03:20:10'),(75,2,1,'soojung93@skyline.com','김수정','SkylineExplorer','Soojung93*','010-7788-8899','','199.53.101.78','2020-04-22 05:05:55'),(76,2,1,'seungmin91@horizon.com','이승민','HorizonChaser','Seungmin91#','010-8899-0011','','192.168.77.45','2021-07-10 09:30:25'),(77,2,1,'jiyeon86@twilight.com','박지연','TwilightDreamer','Ji86Yeon*','010-1122-2233','','193.2.3.56','2015-02-04 12:50:15'),(78,2,1,'jaehyun90@sunset.com','김재현','SunsetAdmirer','Jaehyun90$','010-3344-4455','','192.168.66.90','2017-10-08 05:15:40'),(79,2,1,'jinhee92@crimson.com','이진희','CrimsonStar','Jinhee92#','010-4455-5566','','204.2.116.12','2019-03-05 07:30:55'),(80,2,1,'jihwan85@rainbow.net','박지환','RainbowChaser','Ji85Hwan*','010-5566-6677','','173.45.89.45','2021-01-20 10:40:30'),(81,2,1,'sooyeon91@oasis.com','김수연','OasisExplorer','Soo91Yeon!','010-6677-7788','','199.2.3.78','2023-02-15 13:55:10'),(82,2,1,'hyunwoo94@blizzard.com','이현우','BlizzardChaser','Hyun94Woo*','010-7788-8899','','192.168.33.56','2020-06-18 02:20:45'),(83,2,1,'minji89@starlight.com','김민지','StarlightDream','Minji89#','010-8899-0011','','173.59.77.12','2018-08-15 06:30:30'),(84,2,1,'jiyoung93@sunrise.com','이지영','SunriseAdmirer','Ji93Young*','010-1122-2233','','204.2.118.45','2019-12-10 09:45:55'),(85,2,1,'jiseok91@skyscraper.com','박지석','SkyscraperClimber','Ji91Seok*','010-2233-3344','','192.168.66.34','2020-07-25 14:10:10'),(86,2,1,'jiyeon87@starburst.net','김지연','StarburstGazer','Ji87Yeon*','010-4455-5566','','199.53.102.23','2021-09-30 01:25:25'),(87,2,1,'hyunjin92@paradise.com','이현진','ParadiseExplorer','Hyunjin92#','010-5566-6677','','173.45.67.78','2016-12-12 10:40:40'),(88,2,1,'jiho94@cloudnine.com','김지호','CloudNineDreamer','Jiho94#','010-7788-8899','','204.2.116.90','2015-05-15 13:55:55'),(89,2,1,'minseo90@twinkling.com','이민서','TwinklingStar','Minseo90*','010-8899-0011','','192.168.77.56','2021-03-08 05:30:35'),(90,2,1,'sooyoung86@raindrop.com','김수영','RaindropWatcher','Sooyoung86#','010-1122-2233','','193.2.3.78','2022-04-18 00:45:10'),(91,2,1,'seokjin93@beachcomber.com','이석진','BeachcomberHunter','Seokjin93#','010-2233-3344','','199.2.3.45','2019-11-25 09:15:15'),(92,2,1,'minji88@starfall.com','박민지','StarfallDreamer','Minji88*','010-4455-5566','','204.2.120.67','2018-07-30 13:30:30'),(93,2,1,'jiyoung90@starrynight.net','이지영','StarryNightAdmirer','Ji90Young!','010-5566-6677','','173.45.89.23','2022-09-15 14:45:45'),(94,2,1,'seojin85@sunrise.com','김서진','SunriseExplorer','Seojin85*','010-6677-7788','','199.53.101.90','2021-08-05 02:10:10'),(95,2,1,'seungmin91@skylight.com','이승민','SkylightChaser','Seungmin91#','010-7788-8899','','192.168.33.12','2017-03-19 03:25:25'),(96,2,1,'jiyeon93@stardust.com','박지연','StardustGazer','Jiyeon93*','010-8899-0011','','173.59.77.34','2019-01-10 06:40:40'),(97,2,1,'jaehoon90@rainbow.com','김재훈','RainbowChaser','Jaehoon90#','010-1122-2233','','204.2.116.56','2020-06-08 09:55:55'),(98,2,1,'jiyoung92@sunbeam.com','이지영','SunbeamSerenity','Jiyoung92*','010-3344-4455','','192.168.66.78','2022-02-15 12:20:20'),(99,2,1,'jihye85@starlight.net','박지혜','StarlightDreamer','Ji85Hye!','010-4455-5566','','193.2.3.45','2018-09-28 01:35:35'),(100,2,1,'seoyeon93@sunrise.com','김서연','SunriseAdmirer','Seoyeon93*','010-5566-6677','','199.53.102.67','2020-03-22 05:50:50'),(101,2,1,'hyunwoo90@whirlwind.com','이현우','WhirlwindRider','Hyunwoo90#','010-7788-8899','','192.168.33.89','2016-11-25 10:05:05'),(102,2,1,'jihoon91@starburst.com','김지훈','StarburstGazer','Jihoon91*','010-8899-0011','','173.45.89.67','2023-05-10 13:20:20'),(103,2,1,'sooyoung87@rainfall.com','이수영','RainfallWatcher','Sooyoung87#','010-1122-2233','','204.2.120.45','2021-01-12 14:35:35'),(104,2,1,'seojin92@starfall.com','김서진','StarfallDreamer','Seojin92*','010-3344-4455','','192.168.66.12','2019-04-16 01:50:50'),(105,2,1,'minseok89@sunflower.net','이민석','SunflowerAdmirer','Minseok89#','010-4455-5566','','193.2.3.67','2017-06-10 04:05:05'),(106,2,1,'bananasyndro@naver.com','박진우','바나나당!!히히','asdf123$','01028038894','','172.30.1.86','2024-01-28 05:53:21'),(107,2,3,'bananasyndro@naver.com','박진우','박진우','3235948685','00000000000','','172.30.1.86','2024-01-28 13:01:31'),(108,2,2,'bananasyndro@naver.com','박진우','바나나신드롬','EUjDdU12WO3Q0A_ERCBEigCq1dd2nwUouLE5pY8cDx0','01028038894','','172.30.1.86','2024-01-28 13:02:26'),(109,2,1,'dreamscmtrue@naver.com','박진우','바나나신드롬@2','osbr121@','01028038894','','172.30.1.86','2024-01-28 14:08:06');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_file`
--

DROP TABLE IF EXISTS `user_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_file` (
  `file_no` int NOT NULL,
  `user_no` int NOT NULL,
  KEY `user_no` (`user_no`),
  KEY `file_no` (`file_no`),
  CONSTRAINT `user_file_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_file_ibfk_2` FOREIGN KEY (`file_no`) REFERENCES `img_file` (`file_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_file`
--

LOCK TABLES `user_file` WRITE;
/*!40000 ALTER TABLE `user_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_location` (
  `user_location_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int NOT NULL,
  `location_no` int NOT NULL,
  PRIMARY KEY (`user_location_no`),
  KEY `user_no` (`user_no`),
  KEY `location_no` (`location_no`),
  CONSTRAINT `user_location_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_location_ibfk_2` FOREIGN KEY (`location_no`) REFERENCES `location` (`location_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location`
--

LOCK TABLES `user_location` WRITE;
/*!40000 ALTER TABLE `user_location` DISABLE KEYS */;
INSERT INTO `user_location` VALUES (16,106,2),(17,106,19),(18,109,2),(19,109,1);
/*!40000 ALTER TABLE `user_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `type_no` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) NOT NULL,
  PRIMARY KEY (`type_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'관리자'),(2,'일반');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-29  8:27:13
