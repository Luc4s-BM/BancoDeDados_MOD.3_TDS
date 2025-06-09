-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Maio-2025 às 22:09
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
-- Banco de dados: `lucas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunomiguel`
--

CREATE TABLE `alunomiguel` (
  `idAlunoMiguel` int(10) UNSIGNED NOT NULL,
  `CidadeMiguel_idCidadeMiguel` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Peso` double DEFAULT NULL,
  `Altura` double DEFAULT NULL,
  `Renda` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alunomiguel`
--

INSERT INTO `alunomiguel` (`idAlunoMiguel`, `CidadeMiguel_idCidadeMiguel`, `Nome`, `Email`, `Peso`, `Altura`, `Renda`) VALUES
(1, 1, 'Miguel Debarba', 'miguel.debarba@ifsc.edu.br', 67, 1.68, 4000),
(2, 3, 'Marcos Maciel', 'marcos.maciel@ifsc.edu.br', 70, 1.73, 4500),
(3, 2, 'Fernando Gouveia', 'gouveia@gamil.com', 77, 1.88, 2500),
(4, 4, 'Maria Lima', 'lima@gmail.com', 55, 1.66, 3000),
(5, 5, 'Marcio Gomes', 'gomes@hotmail.com', 85, 1.83, 4000),
(6, 6, 'Joana Lima', 'jlima@gmail.com', 70, 1.72, 6500);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunomiguel`
--
ALTER TABLE `alunomiguel`
  ADD PRIMARY KEY (`idAlunoMiguel`),
  ADD KEY `AlunoMiguel_FKIndex1` (`CidadeMiguel_idCidadeMiguel`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunomiguel`
--
ALTER TABLE `alunomiguel`
  MODIFY `idAlunoMiguel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunomiguel`
--
ALTER TABLE `alunomiguel`
  ADD CONSTRAINT `alunomiguel_ibfk_1` FOREIGN KEY (`CidadeMiguel_idCidadeMiguel`) REFERENCES `cidademiguel` (`idCidadeMiguel`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
