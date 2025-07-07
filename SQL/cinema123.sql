-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Jun-2025 às 22:15
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `cinema123`;
USE `cinema123`;

-- Tabela: atorlucas
CREATE TABLE `atorlucas` (
  `idatorlucas` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `atorlucas` (`idatorlucas`, `Nome`) VALUES
(1, 'Tom Cruise'),
(2, 'Brad Pitt'),
(3, 'Angelina Jolie'),
(4, 'Jonathan Liebesman'),
(5, 'Wagner Moura'),
(6, 'Jack Black');

-- Tabela: cinemalucas
CREATE TABLE `cinemalucas` (
  `idcinemalucas` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cinemalucas` (`idcinemalucas`, `Nome`, `Cidade`) VALUES
(1, 'Shopping Pátio Chapecó', 'Chapecó'),
(2, 'Shopping Curitiba', 'Curitiba');

-- Tabela: generolucas
CREATE TABLE `generolucas` (
  `idgenerolucas` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `generolucas` (`idgenerolucas`, `Nome`) VALUES
(1, 'Aventura'),
(2, 'Comédia'),
(3, 'Romance'),
(4, 'Terror');

-- Tabela: filmelucas
CREATE TABLE `filmelucas` (
  `idfilmelucas` int(10) UNSIGNED NOT NULL,
  `generolucas_idgenerolucas` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Duracao` time DEFAULT NULL,
  `CI` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `filmelucas` (`idfilmelucas`, `generolucas_idgenerolucas`, `Nome`, `Duracao`, `CI`) VALUES
(1, 1, 'Missão Impossível', '01:30:00', 15),
(2, 2, 'Farrofeiros', '01:45:00', 12),
(3, 3, 'Minecraft: O filme', '02:00:59', 10);

-- Tabela: filmelucas_has_atorlucas
CREATE TABLE `filmelucas_has_atorlucas` (
  `atorlucas_idatorlucas` int(10) UNSIGNED NOT NULL,
  `filmelucas_idfilmelucas` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `filmelucas_has_atorlucas` (`atorlucas_idatorlucas`, `filmelucas_idfilmelucas`) VALUES
(5, 3),
(6, 3);

-- Tabela: salalucas
CREATE TABLE `salalucas` (
  `idsalalucas` int(10) UNSIGNED NOT NULL,
  `cinemalucas_idcinemalucas` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(35) DEFAULT NULL,
  `Capacidade` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `salalucas` (`idsalalucas`, `cinemalucas_idcinemalucas`, `Nome`, `Capacidade`) VALUES
(1, 1, 'Sala A1', 200),
(2, 1, 'Sala A2', 225),
(3, 2, 'Sala C1', 300),
(4, 2, 'Sala C2', 350);

-- Tabela: sessao
CREATE TABLE `sessao` (
  `idsessao` int(10) UNSIGNED NOT NULL,
  `salalucas_idsalalucas` int(10) UNSIGNED NOT NULL,
  `filmelucas_idfilmelucas` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `DataSessao` date DEFAULT NULL,
  `HoraSessao` time DEFAULT NULL,
  `Valor` double DEFAULT NULL,
  `Dublado` tinyint(1) DEFAULT NULL,
  `Legendado` tinyint(1) DEFAULT NULL,
  `Libras` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `sessao` (`idsessao`, `salalucas_idsalalucas`, `filmelucas_idfilmelucas`, `Nome`, `DataSessao`, `HoraSessao`, `Valor`, `Dublado`, `Legendado`, `Libras`) VALUES
(1, 1, 3, 'Sessão Minecraft', '2025-06-02', '21:00:00', 35, 1, 0, 0);

-- Índices e chaves primárias
ALTER TABLE `atorlucas` ADD PRIMARY KEY (`idatorlucas`);
ALTER TABLE `cinemalucas` ADD PRIMARY KEY (`idcinemalucas`);
ALTER TABLE `generolucas` ADD PRIMARY KEY (`idgenerolucas`);
ALTER TABLE `filmelucas` ADD PRIMARY KEY (`idfilmelucas`), ADD KEY `filmelucas_FK_genero` (`generolucas_idgenerolucas`);
ALTER TABLE `filmelucas_has_atorlucas` ADD PRIMARY KEY (`atorlucas_idatorlucas`, `filmelucas_idfilmelucas`), ADD KEY `FK_film` (`filmelucas_idfilmelucas`);
ALTER TABLE `salalucas` ADD PRIMARY KEY (`idsalalucas`), ADD KEY `FK_sala_cinema` (`cinemalucas_idcinemalucas`);
ALTER TABLE `sessao` ADD PRIMARY KEY (`idsessao`), ADD KEY `FK_sessao_sala` (`salalucas_idsalalucas`), ADD KEY `FK_sessao_filme` (`filmelucas_idfilmelucas`);

-- AUTO_INCREMENT
ALTER TABLE `atorlucas` MODIFY `idatorlucas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `cinemalucas` MODIFY `idcinemalucas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `generolucas` MODIFY `idgenerolucas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `filmelucas` MODIFY `idfilmelucas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `salalucas` MODIFY `idsalalucas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `sessao` MODIFY `idsessao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- FOREIGN KEYS
ALTER TABLE `filmelucas`
  ADD CONSTRAINT `filmelucas_fk_genero` FOREIGN KEY (`generolucas_idgenerolucas`) REFERENCES `generolucas` (`idgenerolucas`);

ALTER TABLE `filmelucas_has_atorlucas`
  ADD CONSTRAINT `fk_film_has_ator_film` FOREIGN KEY (`filmelucas_idfilmelucas`) REFERENCES `filmelucas` (`idfilmelucas`),
  ADD CONSTRAINT `fk_film_has_ator_ator` FOREIGN KEY (`atorlucas_idatorlucas`) REFERENCES `atorlucas` (`idatorlucas`);

ALTER TABLE `salalucas`
  ADD CONSTRAINT `fk_sala_cinema` FOREIGN KEY (`cinemalucas_idcinemalucas`) REFERENCES `cinemalucas` (`idcinemalucas`);

ALTER TABLE `sessao`
  ADD CONSTRAINT `fk_sessao_sala` FOREIGN KEY (`salalucas_idsalalucas`) REFERENCES `salalucas` (`idsalalucas`),
  ADD CONSTRAINT `fk_sessao_filme` FOREIGN KEY (`filmelucas_idfilmelucas`) REFERENCES `filmelucas` (`idfilmelucas`);

COMMIT;
