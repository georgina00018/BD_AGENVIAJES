-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agencia_viaje
CREATE DATABASE IF NOT EXISTS `agencia_viaje` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agencia_viaje`;

-- Volcando estructura para tabla agencia_viaje.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `fecha_alta` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `unique` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_viaje.cliente: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_viaje.destino
CREATE TABLE IF NOT EXISTS `destino` (
  `id_destino` int NOT NULL,
  `ciudad` varchar(100) NOT NULL DEFAULT '',
  `pais` varchar(100) NOT NULL DEFAULT '',
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_viaje.destino: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_viaje.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `id_pago` int NOT NULL,
  `id_reserva` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL DEFAULT '',
  `comprobante` varchar(100) NOT NULL DEFAULT '',
  `actividad` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `FK_pago_reserva` (`id_reserva`),
  CONSTRAINT `FK_pago_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_viaje.pago: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_viaje.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_viaje` int NOT NULL,
  `fecha_reserva` date NOT NULL,
  `cantidad_personan` int NOT NULL DEFAULT (0),
  `estado` varchar(20) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `FK_reserva_cliente` (`id_cliente`),
  KEY `FK_reserva_viaje` (`id_viaje`),
  CONSTRAINT `FK_reserva_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_reserva_viaje` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_viaje.reserva: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_viaje.viaje
CREATE TABLE IF NOT EXISTS `viaje` (
  `id_viaje` int NOT NULL,
  `id_destino` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT (0),
  `cupos` int NOT NULL DEFAULT (0),
  `descripcion` varchar(200) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `FK_viaje_destino` (`id_destino`),
  CONSTRAINT `FK_viaje_destino` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_viaje.viaje: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
