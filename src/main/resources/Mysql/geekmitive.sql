-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: geekmitive
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `Usuario_idx` (`id_usuario`),
  CONSTRAINT `usuario_carrito` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'Gadgets'),(3,'Accesorios'),(4,'Nacionales'),(5,'Cómics/Mangas'),(6,'Figuras');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `id_orden` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad_producto` int DEFAULT NULL,
  `subtotal_producto` double DEFAULT NULL,
  PRIMARY KEY (`idEntrega`),
  KEY `usuario_idx` (`id_orden`),
  KEY `producto_idx` (`id_producto`),
  CONSTRAINT `producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `usuario_entrega` FOREIGN KEY (`id_orden`) REFERENCES `orden_de_compra` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_compra`
--

DROP TABLE IF EXISTS `orden_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_compra` (
  `id_orden` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `monto_total` double DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `usuario_idx` (`id_usuario`),
  CONSTRAINT `usuario_orden` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_compra`
--

LOCK TABLES `orden_de_compra` WRITE;
/*!40000 ALTER TABLE `orden_de_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` double unsigned NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `imagen` blob NOT NULL,
  `nuevo` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `categoria_idx` (`id_categoria`),
  KEY `marcas_idx` (`marca`),
  CONSTRAINT `categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (9,'Marvel',5,'Cómic The Superior Spider-Man',349,'Después de años de ser derrotado a manos del trepamuros, OTTO OCTAVIUS ha conseguido lo impensable… \n¡PONER SU MENTE EN EL CUERPO DE PETER PARKER! Una asombrosa era terminó, ¡pero una nueva inicia para un inteligente y fuerte Superior Spider-Man!',_binary 'https://i.ibb.co/stxGZtW/1.png',1),(10,'Nintendo',6,'Mario Amiibo Super Smash Bros',799,'Obtén increíbles bonificaciones para los juegos con las figuras\n amiibo y juegos compatibles. Solo coloca un amiibo en el punto NFC de una consola compatible.',_binary 'https://i.ibb.co/GpftCf2/1.jpg',1),(13,'Starwars',3,'Mochila star wars baby Yoda',600,'Mochila Back Star Wars Mandalorean Con Lonchera Baby Yoda.',_binary 'https://i.ibb.co/6W5z8qX/Mochila-Baby-Yoda.jpg',1),(14,'Starwars',3,'Mochila Star Wars Loungefly',890,'Mochila Star Wars con material Nailon.',_binary 'https://i.ibb.co/k47Fgb4/Mochila-Loungefly.jpg',1),(23,'Nintendo',6,'Spiderman vs Venom',1800,'Funko Pop Comic Moment: Marvel.',_binary 'https://i.ibb.co/MhnLRhm/spiderman-VSvenom.jpg',1),(25,'Nintendo',6,'Figura oficial C-3PO escala 1:6',7589,'La figura de C-3PO a escala de 6 pulgadas se detalla para parecerse al personaje de la pelicula Star Wars, con detalles de primera calidad y múltiples puntos de articulación.',_binary 'https://i.ibb.co/D5HqcR2/Figura-C3-PO.jpg',1),(26,'Nintendo',6,'Wall-E y Eva',300,'Pixar Disney Wall-E Película, Cifras de acción Wall-E y Eva, Personajes auténticos de la película, Posable y Coleccionable.',_binary 'https://i.ibb.co/wLGNhq1/Eva-Wall-e.jpg',1),(27,'Starwars',2,'Auriculares inalámbricos Iroman',550,'BASEMAN Marvel Iron Man Auriculares Bluetooth V5.0, Auriculares estéreo HD, Auriculares inalámbricos con micrófono para PC, teléfono, computadora portátil, Mp3/4, Tablet, TV, PSP, iPad.',_binary 'https://i.ibb.co/f8SP3sJ/Auriculares-IRONMAN.jpg',1),(28,'Starwars',2,'Portalápices Darth Vader',500,'Darth Vader - Portalápices con impresión 3D, accesorios de oficina, regalo ideal para los fans de Star Wars.',_binary 'https://i.ibb.co/v1QRGsp/Portalapices-Darth-Vader.jpg',1),(29,'Starwars',2,'Waflera Star Wars',2200,'Máquina para hacer waffles Deluxe Millennium Falcon estándar.',_binary 'https://i.ibb.co/T4jZ0yz/Waflera-Star-Wars.jpg',1),(30,'Disney',3,'Cartera Super Nintendo caballero',270,'Cartera para Hombre Edición Especial Super Nintendo.',_binary 'https://i.ibb.co/j4v7FXd/Cartera-Nintendo.jpg',1),(31,'Disney',3,'Calcetines Disney',370,'Personajes clásicos de Disney, Paquetes surtidos.',_binary 'https://i.ibb.co/zHCfJnv/Calcetines-Disney.jpg',1),(32,'Marvel',5,'Dragon Ball Super',600,'La aventura de Goku del manga clásico volumen 15.',_binary 'https://i.ibb.co/K0XcVBt/Dragon-Ball-Super.jpg',1),(33,'Marvel',5,'Venom: Protector Letal - Marvel',300,'Idioma: Español, Pasta blanda: 144 páginas.',_binary 'https://i.ibb.co/JdWJwxd/Venom-Protector-Letal.jpg',1),(34,'Marvel',5,'Cómic The Superior Spider-Man',349,'Después de años de ser derrotado a manos del trepamuros, OTTO OCTAVIUS ha conseguido lo impensable… ¡PONER SU MENTE EN EL CUERPO DE PETER PARKER!.',_binary 'https://i.ibb.co/stxGZtW/1.png',1),(35,'Marvel',5,'Fortnite x Marvel: Conflicto Cero N.2',70,'Pasta blanda 32 páginas, edad de lectura a partir de 7 años.',_binary 'https://i.ibb.co/k0rcrtF/Fortinite-Cero.jpg',1),(36,'Marvel',4,'Sudadera dragomzitos',400,'Sudaderas dragoncitos dog perro.',_binary 'https://i.ibb.co/GsMCvQK/Sudadera-Dragomzitos.jpg',1),(37,'Nintendo',4,'Pulsera leyenda zelda',239,'LeyendaDeZelda,Link,Nintendo,Videojuego.',_binary 'https://i.ibb.co/31Tdtqp/Pulsera-Zelda.jpg',NULL),(38,'Nintendo',3,'Gorra Kirby',239,'Diseño personalizado: una imagen bordada de Kirby durmiendo decora este sombrero mientras que un par de burbujas flota sobre él.',_binary 'https://i.ibb.co/zf4sYLX/kirby1.png',NULL),(39,'Nintendo',3,'Cartera Mulan',600,'Disney Mulan Castle - Cartera con cierre alrededor.',_binary 'https://i.ibb.co/LQCxbrS/Cartera-Mulan.jpg',NULL),(40,'StarsWars',2,'Tostadora Darth Vader',1800,'Lleva a Vader a tu cocina: el icónico casco de Darth Vader es una tostador de trabajo detallada. Especificaciones del producto: chips de sonido Vader y luces en una secuencia de sonido de 10 segundos al tostar.',_binary 'https://i.ibb.co/LdCr5dH/Waflera-Darth-Vader.jpg',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` longblob NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_UNIQUE` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'anahisinvida','parrilla2552@gmail,com','hola_123',_binary '3339466307'),(2,'lalo_padilla','lalo@gmail,com','contraseña_123',_binary '6679466307'),(3,'lupita_star','lupita@gmail,com','contraseña_1234',_binary '5579466307'),(4,'cybermaggi','maggi@gmail,com','contraseña_1224',_binary '8879466307'),(5,'artuto','arturo@gmail,com','contraseña_1225',_binary '9979466307'),(6,'artuto','arturo@gmail,com','contraseña_1225',_binary '9979466307');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17  1:19:15
