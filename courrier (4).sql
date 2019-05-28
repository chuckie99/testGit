-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 15 mai 2019 à 13:04
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `courrier`
--

-- --------------------------------------------------------

--
-- Structure de la table `borderaux`
--

DROP TABLE IF EXISTS `borderaux`;
CREATE TABLE IF NOT EXISTS `borderaux` (
  `idborderaux` int(11) NOT NULL AUTO_INCREMENT,
  `libelleborderaux` varchar(50) NOT NULL,
  `date_borderaux` date NOT NULL,
  PRIMARY KEY (`idborderaux`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `borderaux`
--

INSERT INTO `borderaux` (`idborderaux`, `libelleborderaux`, `date_borderaux`) VALUES
(45, 'bord45', '2019-01-03'),
(71, 'bord7', '2019-01-13'),
(74, 'bord78', '2019-01-29'),
(75, 'Bord8', '2019-01-10'),
(76, 'bord', '2019-01-25'),
(77, 'bord79', '2019-01-20'),
(81, 'Bord63', '2019-01-10'),
(82, 'bord15', '2019-01-15'),
(83, 'Bord78', '2019-01-01'),
(84, 'Bord75', '2019-01-05'),
(86, 'Bord125', '2019-01-02');

-- --------------------------------------------------------

--
-- Structure de la table `categoriecourrier`
--

DROP TABLE IF EXISTS `categoriecourrier`;
CREATE TABLE IF NOT EXISTS `categoriecourrier` (
  `idcategorie` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`idcategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categoriecourrier`
--

INSERT INTO `categoriecourrier` (`idcategorie`, `libelle_categorie`) VALUES
(1, 'Fonctionnaire'),
(2, 'Contractuelle'),
(3, 'Nomination'),
(4, 'SGCF'),
(5, 'SAMPAE'),
(8, 'avancement'),
(9, 'autre');

-- --------------------------------------------------------

--
-- Structure de la table `correspondant`
--

DROP TABLE IF EXISTS `correspondant`;
CREATE TABLE IF NOT EXISTS `correspondant` (
  `idcorrespondant` int(11) NOT NULL AUTO_INCREMENT,
  `nomcorrespondant` varchar(50) NOT NULL,
  `prenomcorrespondant` varchar(50) NOT NULL,
  `adressecorrespondant` varchar(50) NOT NULL,
  `telcorrespondant` int(11) DEFAULT NULL,
  `emailcorrespondant` varchar(50) NOT NULL,
  `idtypecorr` int(11) NOT NULL,
  `idnature_correspondant` int(11) NOT NULL,
  PRIMARY KEY (`idcorrespondant`),
  KEY `correspondant_typecorrespondant_FK` (`idtypecorr`),
  KEY `correspondant_naturecorrespondant0_FK` (`idnature_correspondant`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `correspondant`
--

INSERT INTO `correspondant` (`idcorrespondant`, `nomcorrespondant`, `prenomcorrespondant`, `adressecorrespondant`, `telcorrespondant`, `emailcorrespondant`, `idtypecorr`, `idnature_correspondant`) VALUES
(14, 'ANDRIA', 'Tsihoarana', '1116 B 15 Antsirabe', 330866627, 'tsihoaarana@gmai.com', 1, 1),
(26, 'Andriatsiferantsoa', 'Tsitohaina', 'IVH 173', 331452322, 'tsito@gmail.com', 1, 1),
(27, 'Rakoto', 'Pierre', 'ivh 47 soarano', 3116, '', 1, 1),
(28, 'Ministre de la fonction publique', 'Ministre de la fonction publique', '', 33145221, '', 2, 1),
(29, 'Randria', 'Edna', '78 B 15 Faravohitra', 0, '', 1, 1),
(31, 'Andrianina', 'david', '14 B 175', 331222665, '', 1, 1),
(32, 'Andriatsiferantsoa', 'Elitina', '14 B 78 Antsirabe', 331425236, '', 1, 1),
(34, 'Rakoto', 'Pierre', '116 b 15 ankadifotsy', 331455852, 'rakoto@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `courrier`
--

DROP TABLE IF EXISTS `courrier`;
CREATE TABLE IF NOT EXISTS `courrier` (
  `idcourrier` int(11) NOT NULL AUTO_INCREMENT,
  `numcourrier` varchar(50) NOT NULL,
  `objet` varchar(50) NOT NULL,
  `date_courrier` date NOT NULL,
  `ville` varchar(50) NOT NULL,
  `contenu` varchar(50) NOT NULL,
  `ref_externe` varchar(50) NOT NULL,
  `idcategorie` int(11) NOT NULL,
  `idnature_courrier` int(11) NOT NULL,
  `idborderaux` int(11) DEFAULT NULL,
  `idcorrespondant` int(11) NOT NULL,
  `idtype_courrier` int(11) NOT NULL,
  PRIMARY KEY (`idcourrier`),
  UNIQUE KEY `courrier_borderaux_AK` (`idborderaux`),
  KEY `courrier_categoriecourrier_FK` (`idcategorie`),
  KEY `courrier_naturecourrier0_FK` (`idnature_courrier`),
  KEY `courrier_correspondant2_FK` (`idcorrespondant`),
  KEY `courrier_typecourrier3_FK` (`idtype_courrier`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courrier`
--

INSERT INTO `courrier` (`idcourrier`, `numcourrier`, `objet`, `date_courrier`, `ville`, `contenu`, `ref_externe`, `idcategorie`, `idnature_courrier`, `idborderaux`, `idcorrespondant`, `idtype_courrier`) VALUES
(152, 'cour01', 'demande de stage', '2019-01-01', 'Antananarivo', 'CV + LM', 'ref0001', 1, 1, 45, 14, 1),
(192, 'cour03', 'décentralisation ', '2019-01-04', 'Antananarivo', 'pièce jointes', 'ref056', 1, 1, 74, 26, 1),
(201, 'cour05', 'nouveau règlement', '2019-02-06', 'Antananarivo', 'Lettre', 'ref045', 1, 1, 75, 28, 1),
(202, 'cour04', 'résultat d\'un concours', '2019-02-04', 'Antananrivo', 'Lettre + formulaire d\'inscription', 'ref02', 1, 1, NULL, 27, 1),
(206, 'cour07', 'changement de situation', '2019-03-06', 'Antananrivo', 'lettre + certificat de résidence', 'ref13', 1, 1, 76, 29, 1),
(208, 'cour08', 'Echange de personnel', '2019-04-05', 'tamatave', 'recommondation', 'ref123', 1, 1, 77, 31, 1),
(212, 'cour10', 'Demande de stage', '2019-01-06', 'Antananrivo', 'CV + LM', 'ref142', 1, 2, 86, 34, 1);

-- --------------------------------------------------------

--
-- Structure de la table `direction`
--

DROP TABLE IF EXISTS `direction`;
CREATE TABLE IF NOT EXISTS `direction` (
  `iddirection` int(11) NOT NULL AUTO_INCREMENT,
  `nom_direction` varchar(50) NOT NULL,
  PRIMARY KEY (`iddirection`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `direction`
--

INSERT INTO `direction` (`iddirection`, `nom_direction`) VALUES
(10, 'DSI'),
(11, 'FOP'),
(12, 'DRHE'),
(13, 'CCRP');

-- --------------------------------------------------------

--
-- Structure de la table `naturecorrespondant`
--

DROP TABLE IF EXISTS `naturecorrespondant`;
CREATE TABLE IF NOT EXISTS `naturecorrespondant` (
  `idnature_correspondant` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_correspondant` varchar(50) NOT NULL,
  PRIMARY KEY (`idnature_correspondant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `naturecorrespondant`
--

INSERT INTO `naturecorrespondant` (`idnature_correspondant`, `libelle_correspondant`) VALUES
(1, 'Emetteur'),
(2, 'Destinataire');

-- --------------------------------------------------------

--
-- Structure de la table `naturecourrier`
--

DROP TABLE IF EXISTS `naturecourrier`;
CREATE TABLE IF NOT EXISTS `naturecourrier` (
  `idnature_courrier` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_nature_courrier` varchar(50) NOT NULL,
  PRIMARY KEY (`idnature_courrier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `naturecourrier`
--

INSERT INTO `naturecourrier` (`idnature_courrier`, `libelle_nature_courrier`) VALUES
(1, 'Ordinaire'),
(2, 'Pre-Visa'),
(3, 'Visa');

-- --------------------------------------------------------

--
-- Structure de la table `reference`
--

DROP TABLE IF EXISTS `reference`;
CREATE TABLE IF NOT EXISTS `reference` (
  `idreference` int(11) NOT NULL AUTO_INCREMENT,
  `numreference` varchar(50) NOT NULL,
  `date_reference` date NOT NULL,
  PRIMARY KEY (`idreference`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reference`
--

INSERT INTO `reference` (`idreference`, `numreference`, `date_reference`) VALUES
(1, 'ref0010', '2019-01-11'),
(2, 'FOP-15', '2019-01-12'),
(3, 'H-14', '2019-01-25'),
(4, 'ref0456', '2019-01-12'),
(5, 'DSI - 68', '2019-01-19'),
(6, 'CC05', '2019-01-14'),
(7, 'DSI-15', '2019-01-24'),
(8, 'CC01', '2019-01-01'),
(9, 'FOP-01', '2019-01-02'),
(10, 'CC-140', '2019-01-02'),
(11, 'CC-15', '2019-01-04'),
(12, 'DSI - 125', '2019-01-07'),
(13, 'SS-12', '2019-01-08'),
(14, 'DSI - 146', '2019-01-09'),
(15, 'SC - 145', '2019-01-08'),
(16, 'DSI - 147', '2019-01-13'),
(17, 'DSI-96', '2019-01-11'),
(18, 'SC-110', '2019-01-09'),
(19, 'DSI - 12', '2019-01-16'),
(20, 'SS - 145', '2019-01-03'),
(21, 'SS - 789', '2019-01-13'),
(22, 'FOP - 75', '2019-01-16'),
(23, 'SS - 78', '2019-01-05'),
(24, 'DSI - 14', '2019-01-09'),
(25, 'SS-78', '2019-01-05'),
(26, 'DSI - 33', '2019-01-13'),
(27, 'zree', '2019-01-14'),
(28, 'dsi57', '2019-01-21'),
(29, 'SS - 15', '2019-01-04'),
(30, 'DSI -15', '2019-01-16'),
(31, 'DSI-36', '2019-01-09');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `idrole` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`idrole`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `idservice` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(50) NOT NULL,
  `numero_porte` int(11) NOT NULL,
  `iddirection` int(11) NOT NULL,
  PRIMARY KEY (`idservice`),
  KEY `service_direction_FK` (`iddirection`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`idservice`, `nom_service`, `numero_porte`, `iddirection`) VALUES
(10, 'Sécretariat', 504, 10),
(11, 'Communication', 203, 12),
(12, 'Dévellopeur', 508, 10),
(13, 'Service courrier', 101, 13);

-- --------------------------------------------------------

--
-- Structure de la table `subirreference`
--

DROP TABLE IF EXISTS `subirreference`;
CREATE TABLE IF NOT EXISTS `subirreference` (
  `idsubir` int(11) NOT NULL AUTO_INCREMENT,
  `iddirection` int(11) NOT NULL,
  `idcourrier` int(11) NOT NULL,
  `idreference` int(11) NOT NULL,
  `idservice` int(11) NOT NULL,
  PRIMARY KEY (`idsubir`),
  KEY `subirreference_courrier0_FK` (`idcourrier`),
  KEY `subirreference_direction_FK` (`iddirection`),
  KEY `subirreference_service2_FK` (`idservice`),
  KEY `subirreference_REFERENCE1_FK` (`idreference`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `subirreference`
--

INSERT INTO `subirreference` (`idsubir`, `iddirection`, `idcourrier`, `idreference`, `idservice`) VALUES
(5, 10, 192, 5, 10),
(8, 13, 152, 8, 13),
(9, 11, 152, 9, 10),
(12, 13, 212, 29, 13),
(13, 10, 152, 30, 12),
(14, 10, 212, 31, 12);

-- --------------------------------------------------------

--
-- Structure de la table `typecorrespondant`
--

DROP TABLE IF EXISTS `typecorrespondant`;
CREATE TABLE IF NOT EXISTS `typecorrespondant` (
  `idtypecorr` int(11) NOT NULL AUTO_INCREMENT,
  `libelletypecorrespondant` varchar(50) NOT NULL,
  PRIMARY KEY (`idtypecorr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typecorrespondant`
--

INSERT INTO `typecorrespondant` (`idtypecorr`, `libelletypecorrespondant`) VALUES
(1, 'Particulier'),
(2, 'Professionnel');

-- --------------------------------------------------------

--
-- Structure de la table `typecourrier`
--

DROP TABLE IF EXISTS `typecourrier`;
CREATE TABLE IF NOT EXISTS `typecourrier` (
  `idtype_courrier` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_type_courrier` varchar(50) NOT NULL,
  PRIMARY KEY (`idtype_courrier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typecourrier`
--

INSERT INTO `typecourrier` (`idtype_courrier`, `libelle_type_courrier`) VALUES
(1, 'Simple'),
(2, 'Gestion Carriere');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`iduser`, `username`, `password`) VALUES
(2, 'azerty', '$2a$10$IEKCLVtI8MIB.F8fpyVn5eJqREEx6Rgcmfuxq5AvkzkeTv.PjI2xm'),
(3, 'admin', '$2a$10$L0ANRhLMuLjOq/zzrvaJhecuFWTUlY9uyhe90bio6GTV3e3EuFQ3C'),
(4, 'user', '$2a$10$26QMtv.ky1anoVP8pRm42O03snRU/XbXDWZVJ.jzYNFGXKMrjabdS'),
(5, 'tsihoarana', '$2a$10$efu.AoWgcMXl.6noA6KVmOI9j9uuguvP0K2BSZlZsroSLDmg4xY8C');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `idrole` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idrole`,`iduser`),
  KEY `user_role_Users0_FK` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`idrole`, `iduser`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(1, 5),
(2, 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `correspondant`
--
ALTER TABLE `correspondant`
  ADD CONSTRAINT `correspondant_naturecorrespondant0_FK` FOREIGN KEY (`idnature_correspondant`) REFERENCES `naturecorrespondant` (`idnature_correspondant`),
  ADD CONSTRAINT `correspondant_typecorrespondant_FK` FOREIGN KEY (`idtypecorr`) REFERENCES `typecorrespondant` (`idtypecorr`);

--
-- Contraintes pour la table `courrier`
--
ALTER TABLE `courrier`
  ADD CONSTRAINT `courrier_borderaux1_FK` FOREIGN KEY (`idborderaux`) REFERENCES `borderaux` (`idborderaux`),
  ADD CONSTRAINT `courrier_categoriecourrier_FK` FOREIGN KEY (`idcategorie`) REFERENCES `categoriecourrier` (`idcategorie`),
  ADD CONSTRAINT `courrier_correspondant2_FK` FOREIGN KEY (`idcorrespondant`) REFERENCES `correspondant` (`idcorrespondant`),
  ADD CONSTRAINT `courrier_naturecourrier0_FK` FOREIGN KEY (`idnature_courrier`) REFERENCES `naturecourrier` (`idnature_courrier`),
  ADD CONSTRAINT `courrier_typecourrier3_FK` FOREIGN KEY (`idtype_courrier`) REFERENCES `typecourrier` (`idtype_courrier`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_direction_FK` FOREIGN KEY (`iddirection`) REFERENCES `direction` (`iddirection`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `subirreference`
--
ALTER TABLE `subirreference`
  ADD CONSTRAINT `subirreference_REFERENCE1_FK` FOREIGN KEY (`idreference`) REFERENCES `reference` (`idreference`),
  ADD CONSTRAINT `subirreference_courrier0_FK` FOREIGN KEY (`idcourrier`) REFERENCES `courrier` (`idcourrier`),
  ADD CONSTRAINT `subirreference_direction_FK` FOREIGN KEY (`iddirection`) REFERENCES `direction` (`iddirection`),
  ADD CONSTRAINT `subirreference_service2_FK` FOREIGN KEY (`idservice`) REFERENCES `service` (`idservice`);

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_Users0_FK` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`),
  ADD CONSTRAINT `user_role_role_FK` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
