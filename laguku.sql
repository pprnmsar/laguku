-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.0-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laguku
CREATE DATABASE IF NOT EXISTS `laguku` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `laguku`;

-- Dumping structure for table laguku.album
CREATE TABLE IF NOT EXISTS `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `id_artis` int(11) DEFAULT NULL,
  `nama_album` varchar(50) DEFAULT NULL,
  `tanggal_rilis` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_album`),
  KEY `id_artis` (`id_artis`),
  CONSTRAINT `FK_album_artis` FOREIGN KEY (`id_artis`) REFERENCES `artis` (`id_artis`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table laguku.album: ~2 rows (approximately)
INSERT INTO `album` (`id_album`, `id_artis`, `nama_album`, `tanggal_rilis`, `deskripsi`) VALUES
	(1, 1, 'Sayang', 'Januari 2018', 'Opo koe krungu'),
	(2, 2, 'Get Up', 'Juli 2023', 'Super shy');

-- Dumping structure for table laguku.artis
CREATE TABLE IF NOT EXISTS `artis` (
  `id_artis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_artis` varchar(50) DEFAULT NULL,
  `genre_lagu` varchar(50) DEFAULT NULL,
  `production` varchar(50) DEFAULT NULL,
  `popularitas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_artis`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table laguku.artis: ~3 rows (approximately)
INSERT INTO `artis` (`id_artis`, `nama_artis`, `genre_lagu`, `production`, `popularitas`) VALUES
	(1, 'Via Vallen', 'Dangdut Koplo', 'Multicamera', 'Nasional'),
	(2, 'New Jeans', 'K-Pop', 'Extended Play', 'Internasional'),
	(3, 'Post Malone', 'Pop', 'Imam Bonjol', 'Internasional');

-- Dumping structure for table laguku.lagu
CREATE TABLE IF NOT EXISTS `lagu` (
  `id_lagu` int(11) NOT NULL AUTO_INCREMENT,
  `id_artis` int(11) DEFAULT NULL,
  `id_album` int(11) DEFAULT NULL,
  `nama_lagu` varchar(50) DEFAULT NULL,
  `tahun_rilis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_lagu`),
  KEY `id_artis` (`id_artis`),
  KEY `id_album` (`id_album`),
  CONSTRAINT `FK_lagu_album` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  CONSTRAINT `FK_lagu_artis` FOREIGN KEY (`id_artis`) REFERENCES `artis` (`id_artis`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table laguku.lagu: ~2 rows (approximately)
INSERT INTO `lagu` (`id_lagu`, `id_artis`, `id_album`, `nama_lagu`, `tahun_rilis`) VALUES
	(1, 1, 1, 'Sayang', '2018'),
	(2, 2, 2, 'ETA', '2023');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
