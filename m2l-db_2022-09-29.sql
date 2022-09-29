-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 29 sep. 2022 à 10:16
-- Version du serveur :  8.0.23
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `m2l`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `Id_demande` int NOT NULL,
  `Objectif` text NOT NULL,
  `raison` text NOT NULL,
  `Id_Utilisateurs` int NOT NULL,
  `Id_priorité` int NOT NULL,
  `Id_etat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `Id_etat` int NOT NULL,
  `niveau` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `priorité`
--

CREATE TABLE `priorité` (
  `Id_priorité` int NOT NULL,
  `avancement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `Id_role` int NOT NULL,
  `fonction` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `Id_Utilisateurs` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `code_postal` int NOT NULL,
  `telephone` int NOT NULL,
  `Id_role` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`Id_demande`),
  ADD KEY `Id_etat` (`Id_etat`),
  ADD KEY `Id_etat_2` (`Id_etat`),
  ADD KEY `Id_priorité` (`Id_priorité`),
  ADD KEY `Id_Utilisateurs` (`Id_Utilisateurs`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`Id_etat`);

--
-- Index pour la table `priorité`
--
ALTER TABLE `priorité`
  ADD PRIMARY KEY (`Id_priorité`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id_role`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`Id_Utilisateurs`),
  ADD KEY `Id_role` (`Id_role`),
  ADD KEY `Id_role_2` (`Id_role`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etat`
--
ALTER TABLE `etat`
  ADD CONSTRAINT `etat_ibfk_1` FOREIGN KEY (`Id_etat`) REFERENCES `demande` (`Id_etat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `priorité`
--
ALTER TABLE `priorité`
  ADD CONSTRAINT `priorité_ibfk_1` FOREIGN KEY (`Id_priorité`) REFERENCES `demande` (`Id_priorité`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`Id_role`) REFERENCES `utilisateurs` (`Id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`Id_role`) REFERENCES `role` (`Id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`Id_Utilisateurs`) REFERENCES `demande` (`Id_Utilisateurs`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
