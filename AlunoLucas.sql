-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Abr-2025 às 22:18
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
-- Banco de dados: `cidades`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_rikelme`
--

CREATE TABLE `aluno_rikelme` (
  `idaluno_rikelme` int(10) UNSIGNED NOT NULL,
  `cidade_rikelme_idcidade_rikelme` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Peso` double DEFAULT NULL,
  `Altura` double DEFAULT NULL,
  `Renda` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `aluno_rikelme`
--

INSERT INTO `aluno_rikelme` (`idaluno_rikelme`, `cidade_rikelme_idcidade_rikelme`, `Nome`, `Email`, `Peso`, `Altura`, `Renda`) VALUES
(1, 4, 'Rikelme Tarone', 'taronerikelme@gmail.com', 67, 1.75, 2),
(2, 1, 'Lucas balen mattos', 'lucas.reidelas@gmail.com', 70, 1.83, 46238926),
(3, 2, 'Arthur Moro', 'yag_arthur@gmail.com', 30, 1.34, -14012),
(4, 1, 'Rikelme Tarone', 'taronerikelme@gmail.com', 67, 1.75, 2),
(5, 2, 'Anthony Testa', 'anthonyhenges@gmail.com', 56, 1.74, 100099999),
(6, 6, 'Rodrigo Manga ', 'rodrigomanga@gmail.com', 70, 1.9, 156456489);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno_rikelme`
--
ALTER TABLE `aluno_rikelme`
  ADD PRIMARY KEY (`idaluno_rikelme`),
  ADD KEY `aluno_rikelme_FKIndex1` (`cidade_rikelme_idcidade_rikelme`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno_rikelme`
--
ALTER TABLE `aluno_rikelme`
  MODIFY `idaluno_rikelme` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno_rikelme`
--
ALTER TABLE `aluno_rikelme`
  ADD CONSTRAINT `aluno_rikelme_ibfk_1` FOREIGN KEY (`cidade_rikelme_idcidade_rikelme`) REFERENCES `cidade_rikelme` (`idcidade_rikelme`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
