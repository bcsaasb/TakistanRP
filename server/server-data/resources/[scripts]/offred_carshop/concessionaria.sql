-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.38-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para vrp
CREATE DATABASE IF NOT EXISTS `vrp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vrp`;

-- Copiando estrutura para tabela vrp.concessionaria
CREATE TABLE IF NOT EXISTS `concessionaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomecarro` varchar(50) DEFAULT NULL,
  `estoquecarro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=551 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela vrp.concessionaria: ~305 rows (aproximadamente)
/*!40000 ALTER TABLE `concessionaria` DISABLE KEYS */;
INSERT INTO `concessionaria` (`id`, `nomecarro`, `estoquecarro`) VALUES
	(1, 'speedo4', 66),
	(2, 'stafford', 67),
	(3, 'swinger', 68),
	(4, 'brutus', 69),
	(5, 'clique', 70),
	(6, 'deveste', 72),
	(7, 'impaler', 73),
	(8, 'italigto', 20),
	(9, 'schlagen', 22),
	(10, 'esskey', 96),
	(11, 'bati', 97),
	(12, 'hakuchou', 89),
	(13, 'chimera', 100),
	(14, 'shotaro', 88),
	(15, 'fcr2', 100),
	(16, 'nemesis', 100),
	(17, 'pcj', 93),
	(18, 'akuma', 95),
	(19, 'hakuchou2', 93),
	(20, 'bf400', 66),
	(21, 'carbonrs', 32),
	(24, 'defiler', 62),
	(26, 'enduro', 62),
	(27, 'fcr', 66),
	(28, 'gargoyle', 65),
	(30, 'innovation', 66),
	(31, 'lectro', 70),
	(33, 'ruffian', 23),
	(35, 'sanctus', 68),
	(36, 'sovereign', 69),
	(37, 'thrust', 70),
	(38, 'vader', 70),
	(39, 'vindicator', 82),
	(40, 'vortex', 63),
	(41, 'wolfsbane', 63),
	(43, 'blazer', 20),
	(44, 'blazer4', 63),
	(45, 'deathbike', 21);
/*!40000 ALTER TABLE `concessionaria` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
