-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 22 mars 2022 à 08:33
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddtickets`
--

-- --------------------------------------------------------

--
-- Structure de la table `etats`
--

CREATE TABLE `etats` (
  `idEtat` int(3) NOT NULL,
  `nomEtat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etats`
--

INSERT INTO `etats` (`idEtat`, `nomEtat`) VALUES
(1, 'Bloquant'),
(2, 'Majeur'),
(3, 'Mineur'),
(4, 'Terminé');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `idTicket` int(11) NOT NULL,
  `nomTicket` varchar(250) NOT NULL,
  `dateTicket` date NOT NULL,
  `numUser` int(11) NOT NULL,
  `numEtat` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`idTicket`, `nomTicket`, `dateTicket`, `numUser`, `numEtat`) VALUES
(1, 'Corriger bug JavaScript', '2018-02-15', 1, 1),
(2, 'Corriger balises HTML sur la page TICKET', '2018-02-13', 2, 3),
(3, 'Améliorer bootstrap', '2018-02-06', 4, 1),
(4, 'Modifier la table client', '2015-08-13', 3, 2),
(5, 'Paramétrer serveur Linux', '2020-12-14', 2, 1),
(6, 'Ecrire les tests unitaires', '2020-12-13', 3, 3),
(7, 'Ecrire scripts PHP', '2020-12-16', 4, 1),
(8, 'Ajouter la méthode UpDateTicket ', '2020-12-13', 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(20) NOT NULL,
  `prenomUser` varchar(20) NOT NULL,
  `loginUser` varchar(20) NOT NULL,
  `pwdUser` varchar(20) NOT NULL,
  `statutUser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `nomUser`, `prenomUser`, `loginUser`, `pwdUser`, `statutUser`) VALUES
(1, 'Girard', 'Michel', 'mg', 'mg', 'admin'),
(2, 'Alison', 'Benjamin', 'ab', 'ab', 'user'),
(3, 'Gand', 'Lucile', 'gl', 'gl', 'user'),
(4, 'Frebaud', 'Alexandra', 'fa', 'fa', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etats`
--
ALTER TABLE `etats`
  ADD PRIMARY KEY (`idEtat`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `numEtat` (`numEtat`),
  ADD KEY `idUser` (`numUser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`numEtat`) REFERENCES `etats` (`idEtat`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`numUser`) REFERENCES `users` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
