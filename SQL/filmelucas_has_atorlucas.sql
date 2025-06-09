-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Maio-2025 às 22:14
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
-- Banco de dados: `banco_cinema_lucas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `filmelucas_has_atorlucas`
--

CREATE TABLE `filmelucas_has_atorlucas` (
  `FilmeLucas_idFilmeLucas` int(10) UNSIGNED NOT NULL,
  `AtorLucas_idAtorLucas` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `filmelucas_has_atorlucas`
--

INSERT INTO `filmelucas_has_atorlucas` (`FilmeLucas_idFilmeLucas`, `AtorLucas_idAtorLucas`) VALUES
(1, 1),
(1, 5),
(3, 3),
(3, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `filmelucas_has_atorlucas`
--
ALTER TABLE `filmelucas_has_atorlucas`
  ADD PRIMARY KEY (`FilmeLucas_idFilmeLucas`,`AtorLucas_idAtorLucas`),
  ADD KEY `FilmeLucas_has_AtorLucas_FKIndex1` (`FilmeLucas_idFilmeLucas`),
  ADD KEY `FilmeLucas_has_AtorLucas_FKIndex2` (`AtorLucas_idAtorLucas`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `filmelucas_has_atorlucas`
--
ALTER TABLE `filmelucas_has_atorlucas`
  ADD CONSTRAINT `filmelucas_has_atorlucas_ibfk_1` FOREIGN KEY (`FilmeLucas_idFilmeLucas`) REFERENCES `filmelucas` (`idFilmeLucas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `filmelucas_has_atorlucas_ibfk_2` FOREIGN KEY (`AtorLucas_idAtorLucas`) REFERENCES `atorlucas` (`idAtorLucas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
