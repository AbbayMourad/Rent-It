-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 17 juin 2020 à 13:18
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `agence`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `utilisateur_nom` varchar(20) NOT NULL,
  PRIMARY KEY (`utilisateur_nom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`utilisateur_nom`) VALUES
('mrouane');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `cin` varchar(10) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `gsm` char(10) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `permis` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cin`),
  UNIQUE KEY `client_idx` (`nom`,`prenom`),
  UNIQUE KEY `client_idx1` (`gsm`),
  UNIQUE KEY `client_idx2` (`mail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cin`, `nom`, `prenom`, `gsm`, `mail`, `permis`) VALUES
('J531420', 'YASSIR', 'ADHAM', '0610763399', NULL, NULL),
('HE33452', 'HASSAN', 'LAOUFI', '0617892200', NULL, NULL),
('T630884', 'RAIHANI', 'YOUNES', '0655533229', NULL, NULL),
('R907339', 'AL BUZIDI', 'MOHAMED', '0661636280', 'mohamed.al@gmail.com', NULL),
('Z983635', 'AKALAY', 'MOSTAFA', '0667995948', 'mostaka@gmail.com', NULL),
('X928786', 'JOUITI', 'ADLIL', '0661744624', 'jouitiadil@gmail.com', NULL),
('Q944356', 'EL MELIANI', 'ABDESLAM', '0660278159', NULL, NULL),
('JK71898', 'SEFROUI', 'ELIAS', '0663681424', 'elias123@gmail.com', NULL),
('JB75348', 'OULEHRI', 'ABDERRAHMNA', NULL, NULL, NULL),
('JA01060', 'BENCHMSI', 'ABDELMAJID', NULL, 'abdelmajid1980@gmail.com', NULL),
('J729045', 'GUENNOUN', 'AMINE', '0644055001', 'amin.gue@yahoo.com', NULL),
('H639943', 'FILALI', 'ABDERAHIM', '0678810008', 'a.filali@gmail.com', NULL),
('K810158', 'EL WAHABI', 'YOUNESS', '0612134410', NULL, NULL),
('U884314', 'HAJI', 'YOUSSEF', '0645140671', 'hajiagadir@gmail.com', NULL),
('O159465', 'GHARISS', 'HANAN', '0666072121', NULL, NULL),
('M738040', 'MSRAR', 'ASSIA', '0688203749', 'assiamsrar@yahoo.fr', NULL),
('N970922', 'BLLA', 'KAOUTAR', '0644115832', 'kaoutar@yahoo.fr', NULL),
('A445555', 'AWATIF', 'NASSIMA', '0619203922', 'awatifnass@gamail.com', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id_contrat` int(11) NOT NULL AUTO_INCREMENT,
  `date_contrat` date NOT NULL,
  `date_depart` date NOT NULL,
  `date_retour` date NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `vehicule_matricule` varchar(8) NOT NULL,
  `client_cin` varchar(10) NOT NULL,
  PRIMARY KEY (`id_contrat`),
  UNIQUE KEY `contrat_idx` (`reservation_id`),
  KEY `vehicule_contrat_fk` (`vehicule_matricule`),
  KEY `client_contrat_fk1` (`client_cin`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id_contrat`, `date_contrat`, `date_depart`, `date_retour`, `reservation_id`, `vehicule_matricule`, `client_cin`) VALUES
(1, '2020-06-17', '2020-06-19', '2020-06-22', 5, '36A87', 'N970922'),
(2, '2020-06-17', '2020-06-19', '2020-06-25', 1, '79160B8', 'Z983635'),
(3, '2020-06-17', '2020-06-18', '2020-06-25', NULL, '67A6', 'H639943'),
(5, '2020-06-17', '2020-06-17', '2020-07-01', NULL, '4A3', 'M738040'),
(6, '2020-06-17', '2020-06-17', '2020-06-18', NULL, '421B3', 'X928786'),
(7, '2020-06-17', '2020-06-17', '2020-06-19', NULL, '69D34', 'J531420'),
(8, '2020-06-17', '2020-06-17', '2020-06-18', NULL, '26892D4', 'J729045');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `contrat_id` int(11) NOT NULL,
  `montant` decimal(8,2) NOT NULL,
  `sanction` decimal(8,2) DEFAULT NULL,
  `date_retour_reele` date DEFAULT NULL,
  PRIMARY KEY (`contrat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`contrat_id`, `montant`, `sanction`, `date_retour_reele`) VALUES
(1, '1350.00', NULL, NULL),
(2, '2400.00', NULL, NULL),
(3, '5600.00', NULL, NULL),
(4, '75600.00', NULL, NULL),
(5, '12600.00', NULL, NULL),
(6, '600.00', '-2000.00', '2020-06-17'),
(7, '1200.00', NULL, NULL),
(8, '950.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `parking`
--

DROP TABLE IF EXISTS `parking`;
CREATE TABLE IF NOT EXISTS `parking` (
  `id_parking` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(50) NOT NULL,
  `capacite` int(11) NOT NULL,
  `taille` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_parking`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parking`
--

INSERT INTO `parking` (`id_parking`, `rue`, `capacite`, `taille`) VALUES
(1, 'MASSIRA', 10, 8),
(3, 'FIDIA', 7, 5);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `date_reservation` date NOT NULL,
  `date_depart` date NOT NULL,
  `date_retour` date NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '0',
  `annule` tinyint(1) NOT NULL DEFAULT '0',
  `vehicule_matricule` varchar(8) NOT NULL,
  `client_cin` varchar(10) NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `vehicule_reservation_fk` (`vehicule_matricule`),
  KEY `client_reservation_fk` (`client_cin`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `date_depart`, `date_retour`, `valide`, `annule`, `vehicule_matricule`, `client_cin`) VALUES
(1, '2020-06-17', '2020-06-19', '2020-06-25', 1, 0, '79160B8', 'Z983635'),
(2, '2020-06-17', '2020-06-20', '2020-06-30', 0, 0, '3253A33', 'R907339'),
(3, '2020-06-17', '2020-06-20', '2020-06-28', 0, 0, '66233D3', 'A445555'),
(4, '2020-06-17', '2020-06-22', '2020-07-07', 0, 0, '4336D33', 'U884314'),
(5, '2020-06-17', '2020-06-19', '2020-06-22', 1, 0, '36A87', 'N970922'),
(6, '2020-06-17', '2020-06-19', '2020-06-25', 0, 0, '88B1', 'Q944356'),
(7, '2020-06-17', '2020-06-20', '2020-06-28', 0, 1, '25306H33', 'K810158');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `nom_utilisateur` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `mot_passe` varchar(255) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `gsm` varchar(10) DEFAULT NULL,
  `debut_conge` date DEFAULT NULL,
  `fin_conge` date DEFAULT NULL,
  PRIMARY KEY (`nom_utilisateur`),
  UNIQUE KEY `user_idx` (`nom`,`prenom`),
  UNIQUE KEY `user_idx1` (`mail`),
  UNIQUE KEY `user_idx2` (`gsm`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`nom_utilisateur`, `nom`, `prenom`, `mot_passe`, `mail`, `gsm`, `debut_conge`, `fin_conge`) VALUES
('mrouane', 'OUDROU', 'MROUANE', '*AE3C15C58E96CBCBC60EA323C17DFA119FD57B4B', NULL, NULL, NULL, NULL),
('hamza', 'SABIR', 'HAMZA', '*5148A5D9C8454D2E6F516C98C4D2C9ECC99AF654', 'sabirhamza@gmail.com', '0614069490', NULL, NULL),
('mourad', 'ABBAY', 'MOURAD', '*2A1FAE52D913A6E4887856B034522232722457DE', 'mouradabbay@gmail.com', '0686203907', NULL, NULL),
('abdellah', 'ADFAA', 'ABDELLAH', '*921FABD9C1BAB7BCB358FEE90F8B021FC228488E', 'a.abdelah@yahoo.com', '0761439270', NULL, NULL),
('walid', 'OUAQUAD', 'WALID', '*480DD99C0893D8C8BB3B97323D72F4A8A4D64BE5', NULL, '0675972791', NULL, NULL),
('rachid', 'MACHGHAL', 'RACHID', '*BC3C82CAD76D831EB43D5BBFD6F1D34607817AA9', 'machgal1990@gmail.com', '0792854909', '2020-06-16', '2020-06-26');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `matricule` varchar(8) NOT NULL,
  `marque` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `carburant` varchar(7) NOT NULL,
  `kilometrage` bigint(20) NOT NULL,
  `date_mise_circulation` date NOT NULL,
  `reserve` tinyint(1) NOT NULL DEFAULT '0',
  `en_location` tinyint(1) NOT NULL DEFAULT '0',
  `prix_location` decimal(6,2) NOT NULL,
  `parking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricule`),
  KEY `parking_vehicule_fk` (`parking_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`matricule`, `marque`, `type`, `carburant`, `kilometrage`, `date_mise_circulation`, `reserve`, `en_location`, `prix_location`, `parking_id`) VALUES
('1B59', 'OPEL', 'ADAM', 'diesel', 500, '2020-06-01', 0, 0, '1200.00', 1),
('67A6', 'OPEL', 'ASTRA', 'diesel', 1000, '2018-09-18', 1, 1, '800.00', 0),
('467D21', 'OPEL ', 'CORSA', 'essence', 1500, '2020-04-15', 0, 0, '600.00', 3),
('43968A8', 'OPEL', 'MOKKA X', 'diesel', 450, '2019-02-08', 0, 0, '1350.00', 3),
('66233D3', 'RENAULT', 'CLIO', 'essence', 2000, '2017-07-13', 1, 0, '800.00', 1),
('88B1', 'RENAULT', 'MEGAN', 'diesel', 890, '2019-01-08', 1, 0, '900.00', 0),
('26892D4', 'RENAULT', 'CAPTUR', 'diesel', 1100, '2019-06-20', 1, 1, '950.00', 0),
('2776H67', 'RENAULT', 'KADJAR', 'essence', 1500, '2016-08-18', 0, 0, '1050.00', 0),
('64H34', 'RENAULT', 'TALISMAN', 'essence', 900, '2019-09-06', 0, 0, '1000.00', 1),
('7770A7', 'GOLF', 'POLO', 'diesel', 1150, '2018-07-08', 0, 0, '800.00', 3),
('61A58', 'GOLF', 'T-CROSS', 'diesel', 700, '2019-03-15', 0, 0, '1100.00', 3),
('8777B36', 'GOLF', 'GTE', 'essence', 900, '2018-10-09', 0, 0, '1400.00', 3),
('4A3', 'GOLF', 'E-GOLF', 'essence', 700, '2020-03-02', 1, 1, '900.00', 0),
('421B3', 'GOLF', 'PASSAT', 'diesel', 10000, '2020-01-17', 0, 0, '600.00', 1),
('79160B8', 'DACIA', 'SANDERO', 'diesel', 1300, '2019-03-22', 1, 1, '400.00', 0),
('5551A8', 'DACIA', 'DUSTER', 'diesel', 2000, '2019-05-01', 0, 0, '600.00', 1),
('36A87', 'DACIA', 'LOGAN', 'essence', 1800, '2019-06-03', 1, 1, '450.00', 0),
('4336D33', 'FORD', 'FIESTA', 'essence', 1700, '2018-10-19', 1, 0, '650.00', 0),
('685A33', 'FORD', 'FUSION', 'diesel', 1300, '2019-11-07', 0, 0, '1200.00', 1),
('3253A33', 'TOYOTA', 'YARIS', 'diesel', 1450, '2019-02-14', 1, 0, '750.00', 1),
('25306H33', 'TOYOTA', 'PRIUS', 'diesel', 750, '2020-01-13', 0, 0, '900.00', 0),
('243H33', 'KIA', 'PICANTO', 'essence', 900, '2018-06-04', 0, 0, '550.00', 1),
('69D34', 'KIA', 'CEED', 'essence', 600, '2020-02-08', 1, 1, '600.00', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
