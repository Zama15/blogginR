-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eliminated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Oto&ntilde;o','Los mejores posts sobre moda en oto&ntilde;o',0),(11,'Verano','&iexcl;Aqu&iacute; encontrar&aacute;s los mejores post de moda para el verano de tus sue&ntilde;os!',0),(12,'Primavera','Los mejores posts sobre moda durante la primavera',0),(13,'Invierno','&iexcl;No te quedes con las ganas y disfruta de nuestros posts sobre moda durante el Invierno!',0),(14,'Novedades','Explora las novedades sobre moda en este 2023',1),(15,'&Eacute;xitos','Mantente informado sobre los &eacute;xitos dentro del mundo de la moda.',0),(18,'Ni&ntilde;os','moda para ni&ntilde;os',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `author_id` int unsigned DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `reported` int NOT NULL DEFAULT '0',
  `eliminated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  KEY `FK_comment_author` (`author_id`),
  CONSTRAINT `FK_comment_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (7,'hola\r\n','2023-05-19 15:11:27',NULL,18,18,1,0,0,1),(8,'holaaa','2023-05-19 16:20:32',NULL,21,13,1,0,0,0),(10,'Me encanta!!!','2023-05-20 22:10:03',NULL,33,13,1,0,0,0),(11,'Excelente la colecci&oacute;n de Maria Grazia Chiuri\r\n','2023-05-23 17:26:52',NULL,44,13,1,0,0,0),(12,'wow!','2023-05-24 02:34:32',NULL,44,23,1,0,0,0),(13,'omg feid','2023-05-24 02:41:49',NULL,47,13,1,0,0,0),(14,'&lt;&gt;','2023-05-24 15:52:42',NULL,48,21,0,0,0,1),(15,'&lt;noscript&gt;&quot;&#039;','2023-05-24 15:53:08',NULL,48,21,0,0,0,1),(16,'l','2023-05-24 16:16:18',NULL,49,31,1,0,0,1),(17,'hola','2023-05-24 17:04:19',NULL,45,13,1,0,0,0),(21,'what a pretty!','2024-01-04 00:23:19',NULL,49,88,0,0,0,0),(22,'that car is so cool!!!!','2024-01-04 00:23:53',NULL,48,88,0,0,0,0),(23,'now i know what shoes buy, but i still need the money to buy it!!!','2024-01-04 00:24:43',NULL,41,88,0,0,0,0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `comments_reported` AFTER UPDATE ON `comments` FOR EACH ROW BEGIN
    IF NEW.reported = 1 THEN
      UPDATE comments SET checked = 0 WHERE id = NEW.id;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `author_id` int unsigned NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `eliminated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_blog_author` (`author_id`),
  CONSTRAINT `FK_blog_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (18,'&iquest;Cu&aacute;l es el mejor vestido de flores accesibles para esta Primavera 2023?','Florencia Davalos\r\nVestido de flores en tonos rosas.','1679348026primaveravestido.png','2023-03-20 21:33:46',NULL,13,1,0),(19,'&iquest;C&oacute;mo llevar vestidos midi con zapatos planos en verano 2023?','Simplemente, es una combinaci&oacute;n que funciona bastante bien, los vestidos midi centran la atenci&oacute;n en tu par favorito, y a su vez, los zapatos bajos aportan un toque elegante al look general. ','1679348204veranovestido.png','2023-03-20 21:36:44',NULL,13,1,0),(20,'La playera tipo polo est&aacute; de regreso para darle un giro a la moda','Creada en 1927 por la famosa marca del cocodrilo, la playera polo regresa para darle un nuevo giro a la moda en 2023.','1679348383polo.png','2023-03-20 21:39:43',NULL,13,1,0),(21,'Los mejores looks street style para ir oficina en Oto&ntilde;o 2023','Viste con estilo (sin sacrificar la comodidad) para ir a la oficina siguiendo estas tendencias del street style Oto&ntilde;o.','1679348585otoñoo.png','2023-03-20 21:43:05',NULL,13,1,0),(29,'Estampados florales y tonos pastel','En el 2023, los estampados florales y los tonos pastel est&aacute;n dominando la temporada de primavera/verano. Combina una blusa con estampado floral con unos pantalones en tono pastel para lucir fresca y a la moda. &iexcl;Perfecto para los&nbsp;d&iacute;as&nbsp;soleados!','1684618859WhatsApp Image 2023-05-19 at 19.54.43.jpg','2023-05-20 21:40:59',NULL,21,1,0),(30,'Revive los 90: el estilo grunge est&aacute; de vuelta','El estilo grunge de los a&ntilde;os 90 ha vuelto con fuerza en el 2023. Apuesta por una camiseta de bandas de rock, unos jeans desgastados y unas botas combat para lograr un look alternativo y aut&eacute;ntico. &iexcl;Despierta tu esp&iacute;ritu&nbsp;rebelde!','1684619445a.jpg','2023-05-20 21:50:45',NULL,21,1,0),(31,'Apuesta por la moda sostenible: reutiliza tu ropa vieja','En el 2023, la moda sostenible es m&aacute;s importante que nunca. Reutiliza tu ropa vieja mediante el upcycling. Transforma una camisa en un top sin mangas o convierte unos vaqueros en una falda. &iexcl;Haz una declaraci&oacute;n de moda y cuida&nbsp;del&nbsp;planeta!','1684619598w.jpg','2023-05-20 21:53:18',NULL,21,1,0),(32,'Minimalismo chic: elegancia con prendas b&aacute;sicas','El minimalismo sigue siendo tendencia en el 2023. Opta por un look chic y sofisticado utilizando prendas b&aacute;sicas como una blusa blanca, pantalones negros y zapatos de tac&oacute;n. Agrega unos accesorios delicados y estar&aacute;s lista para cualquier&nbsp;ocasi&oacute;n.','1684619632e.jpg','2023-05-20 21:53:52',NULL,21,1,0),(33,'Festival de estilo: looks bohemios para el verano','Los festivales de verano son la oportunidad perfecta para lucir un look bohemio y libre. Combina un vestido de flores con una chaqueta de flecos y unas sandalias c&oacute;modas. Completa el conjunto con un sombrero y accesorios &eacute;tnicos para lograr un estilo&nbsp;boho&nbsp;aut&eacute;ntico.','1684619655q.jpg','2023-05-20 21:54:15',NULL,21,1,0),(34,'Jennie de Blackpink debuta en Cannes 2023 con un cl&aacute;sico vestido de bailarina','En el Festival de Cannes 2023 no se pod&iacute;a contener la emoci&oacute;n con la notable aparici&oacute;n de Jennie de Blackpink para la proyecci&oacute;n de la serie de HBO The Idol. Para la ocasi&oacute;n, la estrella del K-pop, de 27 a&ntilde;os, luci&oacute; un vestido blanco y negro de Chanel... Suficiente para encender a la comunidad de fans del K-pop.','1684806493imagen_2023-05-22_194806858.png','2023-05-23 01:38:58',NULL,23,1,0),(35,'Zapatos de Barbie, la tendencia que querr&aacute;s llevar este Verano 2023','El street style y la pasarela secundan los zapatos de tac&oacute;n en color fucsia (y rosa pastel).','1684806129imagen_2023-05-22_194206869.png','2023-05-23 01:42:09',NULL,23,1,0),(36,'C&oacute;mo vestir seg&uacute;n el street style masculino de Invierno 2023','Estos grandes momentos de moda traen a todos los fashionistas muy impacientes. Esto no impide que saquen a relucir sus mejores galas, a la vez que muestran su ojo por el estilo cl&aacute;sico milan&eacute;s, con trajes de cuadros escoceses de varios colores, chamarras americanas y abrigos oversize. As&iacute; como piezas de Gucci dise&ntilde;adas por Alessandro, en un claro homenaje que qued&oacute; evidenciado en las fotograf&iacute;as de street style, capturadas por Acielle Style Du Monde. ','1684806274imagen_2023-05-22_194432436.png','2023-05-23 01:44:34',NULL,23,1,0),(37,'Las mejores cadenas de oro en tendencia para llevar si eres hombre','Si existiera una gu&iacute;a para introducirte a la joyer&iacute;a masculina, una cadena de oro ser&iacute;a casi siempre la primera pieza en la que invertir. Una de las mejores cadenas de oro para hombre es el accesorio que casi cualquier hombre puede (&iexcl;y debe!) lucir. ','1684806365imagen_2023-05-22_194603411.png','2023-05-23 01:46:05',NULL,23,1,0),(38,'Botas con medias: la combinaci&oacute;n Invierno 2022','Las casas de moda consagran la alianza m&aacute;s elegante que tendr&aacute;s que meditar, especialmente si te inclinas por estilismos que se diferencian de lo tradicional.','1684806984imagen_2023-05-22_195623246.png','2023-05-23 01:56:24',NULL,24,1,0),(39,'Las blusas boho lucir&aacute;n mejor con jeans en Oto&ntilde;o  2023','El esp&iacute;ritu bohemio ya no es exclusivo del verano, ahora tambi&eacute;n se refleja en b&aacute;sicos de armario que ser&aacute;n indispensables en la pr&oacute;xima temporada.','1684807259imagen_2023-05-22_200058129.png','2023-05-23 02:00:59',NULL,24,1,0),(40,'&iquest;Por qu&eacute; a todo el mundo le gustan los tenis de esta marca urbana?','No importa si es para ir al trabajo o para salir por las calles de la ciudad con amigas, Skechers tiene los tenis que toda amante de la comodidad y el estilo anhela.','1684807844imagen_2023-05-22_201043151.png','2023-05-23 02:10:44',NULL,24,1,0),(41,'Zapatos de vestir de hombre: Los m&aacute;s elegantes para la boda o una junta formal','&iquest;El accesorio m&aacute;s elegante de la moda masculina? Los zapatos de vestir de hombre. Este calzado elegante exhibe valores, intereses y pueden expresar estilos de vida. As&iacute; que los mejores zapatos de vestir de hombre deben enviar un sutil mensaje de moda alineado con lo que el novio, o el l&iacute;der de la junta de fin de mes, quiera comunicar en ese gran d&iacute;a.','1684808035imagen_2023-05-22_201351099.png','2023-05-23 02:13:55',NULL,24,1,0),(42,'Jeans reciclados en los que vale la pena invertir este a&ntilde;o','Los modelos de jeans vintage que vale la pena buscar y llevar por varias temporadas. Olv&iacute;date de los modelos de fast fashion y dale una nueva vida a ese par.\r\n','1684808187imagen_2023-05-22_201625812.png','2023-05-23 02:16:27',NULL,24,1,0),(43,'De alpargatas a sandalias cangrejeras, c&oacute;mo combinar los zapatos del verano 2023','&iquest;Una forma chic de armar tus looks en verano 2023 esta temporada? Por supuesto, con sandalias y alpargatas de cu&ntilde;a, que agreguen mucho estilo. Con las vacaciones a la vuelta de la esquina y el sol del verano cada vez m&aacute;s cerca, estamos cambiando nuestros b&aacute;sicos primaverales, como los mocasines y los zapatos de tac&oacute;n, por las sandalias cl&aacute;sicas, los zuecos, los Birkenstocks de doble hebilla e incluso las cu&ntilde;as.\r\n\r\nUna vez que compras las piezas b&aacute;sicas, ahora viene la parte divertida: Innovar con combinaciones frescas con zapatos de verano.','1684808781imagen_2023-05-22_202619508.png','2023-05-23 02:26:21',NULL,13,1,0),(44,'Dior en M&eacute;xico: Los simbolismos de su colecci&oacute;n Crucero 2024','Maria Grazia Chiuri aterriz&oacute; en la Ciudad de M&eacute;xico para presentar su colecci&oacute;n Crucero 2024, un homenaje a la mujer mexicana.\r\nUnos d&iacute;as antes, Maria Grazia Chiuri se hab&iacute;a sentado con la curadora de moda mexicana, Circe Henestrosa, para hablar de la colecci&oacute;n Crucero 2024 de Dior. El lugar elegido, que m&aacute;s adelante ser&iacute;a escenario del desfile, era el Colegio San Ildefonso en el coraz&oacute;n de la Ciudad de M&eacute;xico. La elecci&oacute;n, por supuesto, no fue al azar. Fue en este recinto donde se conocieron Frida Kahlo y Diego Rivera en los a&ntilde;os veinte. Sin m&aacute;s, Chiuri aterriz&oacute; en la capital mexicana despu&eacute;s de su &uacute;ltima presentaci&oacute;n de oto&ntilde;o en Mumbai. &lsquo;Una constelaci&oacute;n de lugares que despiertan emociones: eso es M&eacute;xico para Maria Grazia Chiuri&rsquo;, afirm&oacute; la maison francesa en su comunicado oficial.','1684808932imagen_2023-05-22_202846612.png','2023-05-23 02:28:52',NULL,13,1,0),(45,'Cl&aacute;sicos de oto&ntilde;o por C.R.O','&iquest;Te gusta lo cl&aacute;sico?, esta es tu oportunidad para experimentar en oto&ntilde;o con este estilo, lo destacado de este oufit es el porte b&aacute;sico, pero que queda perfectamente para unas buenas fotos de instagram.   -Foto: C.R.O','1684851813WhatsApp Image 2023-05-22 at 11.02.24 PM.jpeg','2023-05-23 14:23:33',NULL,25,1,0),(46,'&iquest;Te gusta vestir c&oacute;modo y con estilo? &iexcl;Esto es para ti!','Para esta temporada de primavera los oufits m&aacute;s casuales, este se  destaca por la ropa c&oacute;moda y ancha que queda muy bien a cualquiera, aunque no sea su estilo com&uacute;nmente    -Foto: Michael B. Jordan','1684851956WhatsApp Image 2023-05-22 at 11.02.22 PM.jpeg','2023-05-23 14:25:56',NULL,25,1,0),(47,'Vive el verano verde, v&iacute;velo con Feid','Verde = Feid \r\nSe acerca el verano y el ferxxo lo sabe, estilo casual y muy colorido, que no falte los lentes y la gorra para agregarle ese detalle &uacute;nico a tu estilo   Foto: Ferxxo','1684852042imagen_2023-05-23_082721329.png','2023-05-23 14:27:22',NULL,25,1,0),(48,'Travis hace lucir los cl&aacute;sicos, &iexcl;No te lo pierdas!','Si te gusta lo b&aacute;sico y lo urbano, este es para ti, Travis deja en claro que el negro y el blanco nunca pasar&aacute; de moda   -Foto: Travis Scott','1684852152imagen_2023-05-23_082911580.png','2023-05-23 14:29:12',NULL,25,1,0),(49,'Los vestidos boho m&aacute;s bonitos para la oficina en verano 2023','Las expertas en moda del street style muestran c&oacute;mo aprovechar la tendencia bohemia y lucir espectacular de lunes a viernes.','1684944746Captura de pantalla 2023-05-24 091410.png','2023-05-24 16:12:26',NULL,13,1,0),(52,'Lorem ipsum dolor sit amet consectetur, adipiscing elit potenti praesent.','Lorem ipsum dolor sit amet consectetur adipiscing elit varius orci condimentum at ut taciti mollis ultrices, curae aliquet cum auctor consequat egestas nullam convallis ultricies neque ullamcorper venenatis enim sodales.','1704525356514Qk44DCLACUF100010.jpg','2024-01-06 01:15:56',NULL,88,1,0),(53,'Hello Rails (O.O)/','The begging of the development with ruby on rails, any help is worth to try |o)/','58483107cef1014c0b5e4aa3.png','2024-01-13 23:41:03','2024-01-13 23:41:03',88,0,0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_categories`
--

DROP TABLE IF EXISTS `posts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_categories` (
  `post_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`),
  KEY `FK_post_category_category` (`category_id`),
  CONSTRAINT `FK_post_category_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_post_category_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_categories`
--

LOCK TABLES `posts_categories` WRITE;
/*!40000 ALTER TABLE `posts_categories` DISABLE KEYS */;
INSERT INTO `posts_categories` VALUES (21,2),(35,2),(39,2),(45,2),(19,11),(33,11),(43,11),(47,11),(49,11),(18,12),(29,12),(46,12),(36,13),(38,13),(52,13),(30,14),(31,14),(34,14),(42,14),(44,14),(20,15),(32,15),(37,15),(40,15),(41,15),(48,15);
/*!40000 ALTER TABLE `posts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_preferences_user` (`user_id`),
  CONSTRAINT `FK_preferences_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (19,13,'light','#000000'),(20,18,'light','#000000'),(21,20,'light','#000000'),(22,21,'light','#000000'),(23,22,'light','#000000'),(24,23,'light','#000000'),(25,24,'light','#000000'),(26,25,'light','#000000'),(27,26,'light','#000000'),(28,27,'light','#000000'),(29,28,'light','#000000'),(30,29,'light','#000000'),(31,30,'light','#000000'),(32,31,'light','#000000'),(33,32,'light','#000000'),(34,33,'light','#000000'),(35,80,'light','#000000'),(36,88,'light','#000000'),(42,99,'light','#000000');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_php` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `eliminated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'Citlaly Estefan&iacute;a','Samano L&oacute;pez','Estftz','csamano@ucol.mx','$2y$10$WpcRIII940z.lhxBu.1OPefb.UK94CrBLGQah8fSU1QsFvpGx83PG','','646e455dcf011.jpg','2023-12-29 19:38:53',NULL,1,1,0),(18,'Alejandro','Jeronimo Azamar','alex','ajeronimo@ucol.mx','$2y$10$NMnc1CwU2yuxzXNvztkMiOVzuoM9l6iiCt1asg7Wce8Oc4D7WZrdy','','646642f6c3b9a.jpg','2023-12-29 19:38:53',NULL,0,0,1),(20,'Fernanda Tonantzin','Gonz&aacute;lez Peredia','Tona','fgonzalez33@ucol.mx','$2y$10$7euzLRBaOfIXZRMOIyjbcuqUZd2aaeRh8syOXMHx.ywDaXTs3BV5a','','646939d380a34.jpg','2023-12-29 19:38:53',NULL,1,1,0),(21,'Karla Kamila','Vilchis Corona','kami','kvilchis@ucol.mx','$2y$10$pFAx4ywosvx8jOIJGlYCuu75NJiunOYL3w18TkEba6m0.YTpv/YdG','','64693a4bf0742.jpg','2023-12-29 19:38:53',NULL,1,1,0),(22,'Cesar Jared','Cobian Garcia','cesar','ccobian8@ucol.mx','$2y$10$ky6GmjWm591psIZLvcIaPe47favVjLhc09iuarm1h6OaYC.iuKY4u','','64693b19bb47c.jpg','2023-12-29 19:38:53',NULL,1,1,0),(23,'Daira','Lepez','Dairle','dlepez@ucol.mx','$2y$10$gl7lyPSkcm8s2TaVWHK5I.DIFS3ljcmW.gkm/AlVOte4tqfmiELbG','','1684805651R (1).jpg','2023-12-29 19:38:53',NULL,1,0,0),(24,'James','Palacios','JamPa','fcatalan@ucol.mx','$2y$10$dkxnFyarcdCcWRP4xiRDoe6z6CDTqoZUCihOafQ40wWg/fukE9v1G','','1684806757imagen_2023-05-22_195234858.png','2023-12-29 19:38:53',NULL,1,0,0),(25,'Jhordan','Iglesias','Jhordan12','teffy_ahre@hotmail.com','$2y$10$TQHy1rKlB3..4HzRsAtb4.vwyoVEtXBSm3Y0fGIQVLIf/r8CvCgjK','','646ccc0da0da9.jpg','2023-12-29 19:38:53',NULL,1,0,0),(26,'Amanda','Carrillo S&aacute;nchez','AmandaC','tita_diamante@hotmail.com','$2y$10$IZf3q/gfmKWhU4i2meem2O2sU9f8KOdhZf9lRKLVJsxllyqzmWP2m','','1684853796Captura de pantalla_20221203_134529.png','2023-12-29 19:38:53',NULL,1,0,0),(27,'Veronica','Ort&iacute;z','vero','veronica12239@gmail.com','$2y$10$nuYPUaHGUPQwTNFbPWHKUOFs6V1jeXrEO2o2P4wbrM1.Cywp1nkaq','','646e3134cb6ae.jpg','2023-12-29 19:38:53',NULL,1,0,0),(28,'Ingrid','Duarte','IngridD','ingridduarte12222@gmail.com','$2y$10$nBmhhMvaeoQzB2CTwN5wYOHYUe.BQvR0es1sMizCZYqyjzw.ZU/NK','','1684943253Captura de pantalla_20230106_010034.png','2023-12-29 19:38:53',NULL,1,0,0),(29,'blacktibii&#039;&quot;--','123tamarindo','123tamarindo','a@a.a','$2y$10$ty8afidl1bqfSJSiroQ2S.VfQaOREn7w8ky8jyW8qrhW5TQliPbNq','','1684943693noblaclktibi.jpg','2023-12-29 19:38:53',NULL,0,0,0),(30,'mau','mau','mau','b@b.b','$2y$10$iRmPkJrldoELI8vy9JdxFuJA3hmyToqw0AhTeChRIwu94gKL4al5u','','1684943772noblaclktibi.jpg','2023-12-29 19:38:53',NULL,0,0,0),(31,'Alejandro','Jer&oacute;nimo','aleale','alejadnro121@gmail.com','$2y$10$Pz2ZlhRu2JjM2u4YOxRgoep67/FGZ.2eZVpYDAHk18qNO8hVV99aO','','646e36ce81baa.jpg','2023-12-29 19:38:53',NULL,0,0,1),(32,'Maximiliano','Mendoza','Maxi','maxiova312@gmail.com','$2y$10$VQpJq4X7vqJ8i7sg.PBEhu6QJMu5Vi4XmWQwDYityQC0yItUM0gg.','','1684947599Captura de pantalla 2023-03-20 153853.png','2023-12-29 19:38:53',NULL,1,0,0),(33,'sadasd','asdas','holasoyese','bd.mamae@gmail.com','$2y$10$kiqVQ7f9XTZel4vfL6ZlN.VrrjIZ/PSsP3UQpwUn.zIRuTeqNIIla','','1684948394noblaclktibi.jpg','2023-12-29 19:38:53',NULL,0,0,1),(80,'Alejandro','Jeronimo Azamar','AlejandroJer','alex.jeraza@gmail.com','$2y$10$BwvAWcghZsZfWyzf/8Q0dOFoEu.FDPEuaBpFmmjIZiXEzzvzhRpFu','','1703677449zutomayo.png','2023-12-29 19:38:53',NULL,1,1,0),(88,'Alejandro','Jeronimo Azamar','Zama','alexavdstiles@gmail.com','$2y$10$sHbGjyltsEb0uk7O80ORwOZTPXNLij3AQdBcaE1Y13tCqKXAbYUNC','',NULL,'2024-01-02 20:21:45',NULL,1,0,0),(99,'MyString','MyString','MyString','MyString@MyString.com',NULL,'$2a$12$lYLVO94yo6WA.ekzmiSkqut5vUCYqoQkLQrpOjg9XqpUDw41bP4CW',NULL,'2024-02-01 17:20:20','2024-02-01 17:20:20',0,0,0);
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

-- Dump completed on 2024-02-04 15:45:10
