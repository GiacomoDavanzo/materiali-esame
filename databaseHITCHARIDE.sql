-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.19-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database hitcharide
CREATE DATABASE IF NOT EXISTS `hitcharide` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hitcharide`;

-- Dump della struttura di tabella hitcharide.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.car
CREATE TABLE IF NOT EXISTS `car` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `plate_number` varchar(7) NOT NULL,
  `seats` tinyint(4) NOT NULL,
  `ac` bit(1) NOT NULL DEFAULT b'0',
  `id_owner` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__driver` (`id_owner`),
  CONSTRAINT `FK__driver` FOREIGN KEY (`id_owner`) REFERENCES `driver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `province` varchar(2) NOT NULL,
  `region` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id_comment` int(20) NOT NULL AUTO_INCREMENT,
  `id_driver` int(20) NOT NULL,
  `id_passenger` int(20) NOT NULL,
  `author` varchar(9) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 5,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `FK__driver2` (`id_driver`),
  KEY `FK__passenger2` (`id_passenger`),
  CONSTRAINT `FK__driver2` FOREIGN KEY (`id_driver`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__passenger2` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.driver
CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_numberme` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` blob DEFAULT NULL,
  `license_number` varchar(10) NOT NULL,
  `license_expiration` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.passenger
CREATE TABLE IF NOT EXISTS `passenger` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.stop
CREATE TABLE IF NOT EXISTS `stop` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `coordinates` point NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.trip
CREATE TABLE IF NOT EXISTS `trip` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `max_passengers` int(11) DEFAULT NULL,
  `luggages_allowed` bit(1) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `animals_allowed` tinyint(4) NOT NULL DEFAULT 0,
  `state` varchar(50) NOT NULL DEFAULT 'SCHEDULED',
  `id_driver` int(20) NOT NULL,
  `id_origin` int(20) NOT NULL,
  `id_destination` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__driver__3` (`id_driver`),
  KEY `FK__city` (`id_origin`),
  KEY `FK__city__2` (`id_destination`),
  CONSTRAINT `FK__city` FOREIGN KEY (`id_origin`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__city__2` FOREIGN KEY (`id_destination`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__driver__3` FOREIGN KEY (`id_driver`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.trip_passengers
CREATE TABLE IF NOT EXISTS `trip_passengers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_trip` int(20) NOT NULL,
  `id_passenger` int(20) NOT NULL,
  `booked_seats` tinyint(4) NOT NULL DEFAULT 0,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `transaction_id` varchar(36) NOT NULL,
  `passenger_abandoned` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__trip3` (`id_trip`),
  KEY `FK__passenger3` (`id_passenger`),
  CONSTRAINT `FK__passenger3` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__trip3` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella hitcharide.trip_stops
CREATE TABLE IF NOT EXISTS `trip_stops` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_trip` int(20) NOT NULL,
  `id_stop` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__trip` (`id_trip`),
  KEY `FK__stop` (`id_stop`),
  CONSTRAINT `FK__stop` FOREIGN KEY (`id_stop`) REFERENCES `stop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__trip` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- L’esportazione dei dati non era selezionata.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
