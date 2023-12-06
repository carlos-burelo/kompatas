-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.34 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para kompatas_db
CREATE DATABASE IF NOT EXISTS `kompatas_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kompatas_db`;

-- Volcando estructura para tabla kompatas_db.adopcion
CREATE TABLE IF NOT EXISTS `adopcion` (
  `id_adopcion` int NOT NULL AUTO_INCREMENT,
  `id_mascota` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado_adopcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_adopcion`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `adopcion_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`),
  CONSTRAINT `adopcion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla kompatas_db.adopcion: ~2 rows (aproximadamente)
INSERT INTO `adopcion` (`id_adopcion`, `id_mascota`, `id_usuario`, `fecha`, `estado_adopcion`) VALUES
	(1, 1, 2, '2023-10-15', 'En proceso'),
	(2, 2, 1, '2023-11-05', 'En proceso');

-- Volcando estructura para tabla kompatas_db.formulario
CREATE TABLE IF NOT EXISTS `formulario` (
  `id_formulario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `empleo` varchar(100) DEFAULT NULL,
  `tiene_casa_propia` tinyint(1) DEFAULT NULL,
  `ingresos_mensuales` decimal(10,2) DEFAULT NULL,
  `motivo_adopcion` varchar(500) DEFAULT NULL,
  `posee_espacio_libre` tinyint(1) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_formulario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `formulario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla kompatas_db.formulario: ~1 rows (aproximadamente)
INSERT INTO `formulario` (`id_formulario`, `nombre`, `direccion`, `telefono`, `empleo`, `tiene_casa_propia`, `ingresos_mensuales`, `motivo_adopcion`, `posee_espacio_libre`, `id_usuario`) VALUES
	(1, 'Nombre Formulario', 'Dirección Ejemplo', '123456789', 'Empleado', 1, 2000.00, 'Quiero adoptar una mascota porque...', 1, 2);

-- Volcando estructura para tabla kompatas_db.mascota
CREATE TABLE IF NOT EXISTS `mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `raza` varchar(80) DEFAULT NULL,
  `color` varchar(80) DEFAULT NULL,
  `tamaño` varchar(30) DEFAULT NULL,
  `url_imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla kompatas_db.mascota: ~2 rows (aproximadamente)
INSERT INTO `mascota` (`id_mascota`, `nombre`, `raza`, `color`, `tamaño`, `url_imagen`) VALUES
	(1, 'Bobby', 'Labrador', 'Negro', 'Grande', 'https://url_imagen_bobby'),
	(2, 'Luna', 'Golden Retriever', 'Dorado', 'Grande', 'https://url_imagen_luna');

-- Volcando estructura para tabla kompatas_db.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido_1` varchar(45) DEFAULT NULL,
  `apellido_2` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `es_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla kompatas_db.usuario: ~4 rows (aproximadamente)
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido_1`, `apellido_2`, `correo`, `contrasena`, `es_admin`) VALUES
	(1, 'admin', 'Apellido1', 'Apellido2', 'admin@mail.com', 'admin', 1),
	(2, 'Normal', 'Persona', 'Ejemplo', 'normal@ejemplo.com', 'normalpass', 0),
	(3, 'Carlos Fernando', 'Burelo', 'Juarez', 'carlos@mail.com', 'root', 0),
	(4, 'pedro', 'perez', 'suarez', 'pedro@perez.com', 'pedro123', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
