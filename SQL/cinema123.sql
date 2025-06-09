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


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cinema123`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atorarthur`
--

CREATE TABLE `atorarthur` (
  `idatorarthur` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `atorarthur`
--

INSERT INTO `atorarthur` (`idatorarthur`, `Nome`) VALUES
(1, 'Tom Cruise'),
(2, 'Brad Pitt'),
(3, 'Angelina Jolie'),
(4, 'Jonathan Liebesman'),
(5, 'Wagner Moura'),
(6, 'Jack Black');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cinemaarthur`
--

CREATE TABLE `cinemaarthur` (
  `idcinemaarthur` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cinemaarthur`
--

INSERT INTO `cinemaarthur` (`idcinemaarthur`, `Nome`, `Cidade`) VALUES
(1, 'Shopping Pátio Chapecó', 'Chapecó'),
(2, 'Shopping Curitiba', 'Curitiba');

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmearthur`
--

CREATE TABLE `filmearthur` (
  `idfilmearthur` int(10) UNSIGNED NOT NULL,
  `generoarthur_idgeneroarthur` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Duracao` time DEFAULT NULL,
  `CI` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `filmearthur`
--

INSERT INTO `filmearthur` (`idfilmearthur`, `generoarthur_idgeneroarthur`, `Nome`, `Duracao`, `CI`) VALUES
(1, 1, 'Missão Impossível', '01:30:00', 15),
(2, 2, 'Farrofeiros', '01:45:00', 12),
(3, 3, 'Minecraft: O filme', '02:00:59', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmearthur_has_atorarthur`
--

CREATE TABLE `filmearthur_has_atorarthur` (
  `atorarthur_idatorarthur` int(10) UNSIGNED NOT NULL,
  `filmearthur_idfilmearthur` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `filmearthur_has_atorarthur`
--

INSERT INTO `filmearthur_has_atorarthur` (`atorarthur_idatorarthur`, `filmearthur_idfilmearthur`) VALUES
(5, 3),
(6, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `generoarthur`
--

CREATE TABLE `generoarthur` (
  `idgeneroarthur` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `generoarthur`
--

INSERT INTO `generoarthur` (`idgeneroarthur`, `Nome`) VALUES
(1, 'Aventura'),
(2, 'Comédia'),
(3, 'Romance'),
(4, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura da tabela `salaarthur`
--

CREATE TABLE `salaarthur` (
  `idsalaarthur` int(10) UNSIGNED NOT NULL,
  `cinemaarthur_idcinemaarthur` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(35) DEFAULT NULL,
  `Capacidade` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `salaarthur`
--

INSERT INTO `salaarthur` (`idsalaarthur`, `cinemaarthur_idcinemaarthur`, `Nome`, `Capacidade`) VALUES
(1, 1, 'Sala A1', 200),
(2, 1, 'Sala A2', 225),
(3, 2, 'Sala C1', 300),
(4, 2, 'Sala C2', 350);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessao`
--

CREATE TABLE `sessao` (
  `idsessao` int(10) UNSIGNED NOT NULL,
  `salaarthur_idsalaarthur` int(10) UNSIGNED NOT NULL,
  `filmearthur_idfilmearthur` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `DataSessao` date DEFAULT NULL,
  `HoraSessao` time DEFAULT NULL,
  `Valor` double DEFAULT NULL,
  `Dublado` tinyint(1) DEFAULT NULL,
  `Legendado` tinyint(1) DEFAULT NULL,
  `Libras` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `sessao`
--

INSERT INTO `sessao` (`idsessao`, `salaarthur_idsalaarthur`, `filmearthur_idfilmearthur`, `Nome`, `DataSessao`, `HoraSessao`, `Valor`, `Dublado`, `Legendado`, `Libras`) VALUES
(1, 1, 3, 'Sessão Minecraft', '2025-06-02', '21:00:00', 35, 1, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atorarthur`
--
ALTER TABLE `atorarthur`
  ADD PRIMARY KEY (`idatorarthur`);

--
-- Índices para tabela `cinemaarthur`
--
ALTER TABLE `cinemaarthur`
  ADD PRIMARY KEY (`idcinemaarthur`);

--
-- Índices para tabela `filmearthur`
--
ALTER TABLE `filmearthur`
  ADD PRIMARY KEY (`idfilmearthur`),
  ADD KEY `filme_arthur_FKIndex1` (`generoarthur_idgeneroarthur`);

--
-- Índices para tabela `filmearthur_has_atorarthur`
--
ALTER TABLE `filmearthur_has_atorarthur`
  ADD PRIMARY KEY (`atorarthur_idatorarthur`,`filmearthur_idfilmearthur`),
  ADD KEY `filme_arthur_has_ator_arthur_FKIndex1` (`filmearthur_idfilmearthur`),
  ADD KEY `filme_arthur_has_ator_arthur_FKIndex2` (`atorarthur_idatorarthur`);

--
-- Índices para tabela `generoarthur`
--
ALTER TABLE `generoarthur`
  ADD PRIMARY KEY (`idgeneroarthur`);

--
-- Índices para tabela `salaarthur`
--
ALTER TABLE `salaarthur`
  ADD PRIMARY KEY (`idsalaarthur`),
  ADD KEY `sala_arthur_FKIndex1` (`cinemaarthur_idcinemaarthur`);

--
-- Índices para tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`idsessao`),
  ADD KEY `sessao_FKIndex1` (`salaarthur_idsalaarthur`),
  ADD KEY `sessao_FKIndex2` (`filmearthur_idfilmearthur`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atorarthur`
--
ALTER TABLE `atorarthur`
  MODIFY `idatorarthur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cinemaarthur`
--
ALTER TABLE `cinemaarthur`
  MODIFY `idcinemaarthur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `filmearthur`
--
ALTER TABLE `filmearthur`
  MODIFY `idfilmearthur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `generoarthur`
--
ALTER TABLE `generoarthur`
  MODIFY `idgeneroarthur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `salaarthur`
--
ALTER TABLE `salaarthur`
  MODIFY `idsalaarthur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sessao`
--
ALTER TABLE `sessao`
  MODIFY `idsessao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `filmearthur`
--
ALTER TABLE `filmearthur`
  ADD CONSTRAINT `filmearthur_ibfk_1` FOREIGN KEY (`generoarthur_idgeneroarthur`) REFERENCES `generoarthur` (`idgeneroarthur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `filmearthur_has_atorarthur`
--
ALTER TABLE `filmearthur_has_atorarthur`
  ADD CONSTRAINT `filmearthur_has_atorarthur_ibfk_1` FOREIGN KEY (`filmearthur_idfilmearthur`) REFERENCES `filmearthur` (`idfilmearthur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `filmearthur_has_atorarthur_ibfk_2` FOREIGN KEY (`atorarthur_idatorarthur`) REFERENCES `atorarthur` (`idatorarthur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `salaarthur`
--
ALTER TABLE `salaarthur`
  ADD CONSTRAINT `salaarthur_ibfk_1` FOREIGN KEY (`cinemaarthur_idcinemaarthur`) REFERENCES `cinemaarthur` (`idcinemaarthur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`salaarthur_idsalaarthur`) REFERENCES `salaarthur` (`idsalaarthur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sessao_ibfk_2` FOREIGN KEY (`filmearthur_idfilmearthur`) REFERENCES `filmearthur` (`idfilmearthur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
