-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Jun-2018 às 17:46
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel2-1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(9) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`id_admin`, `nome`, `login`, `senha`) VALUES
(1, 'lucas', 'adm', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consumo`
--

CREATE TABLE `consumo` (
  `id_consumo` int(9) NOT NULL,
  `id_reserva` int(9) NOT NULL,
  `id_serv` int(9) NOT NULL,
  `quantidade` decimal(7,2) NOT NULL,
  `preco` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente`
--

CREATE TABLE `gerente` (
  `id_geren` int(9) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `endereço` varchar(30) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `id_admin` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `gerente`
--

INSERT INTO `gerente` (`id_geren`, `cpf`, `email`, `nome`, `login`, `senha`, `endereço`, `telefone`, `id_admin`) VALUES
(1, 'a', 'a', 'b', 'a', 'b', 'a', 'a', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospede`
--

CREATE TABLE `hospede` (
  `id_hosp` int(9) NOT NULL,
  `endereço` varchar(30) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `horario` varchar(15) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `rg` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `id_recep` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `hospede`
--

INSERT INTO `hospede` (`id_hosp`, `endereço`, `nome`, `horario`, `login`, `senha`, `rg`, `email`, `telefone`, `cpf`, `id_recep`) VALUES
(3, 'a', 'a', NULL, 'a', 'a', 'a', 'a', 'a', 'a', 4),
(4, 'b', 'ccccc', NULL, 'b', 'b', 'b', 'b', 'b', 'b', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quartos`
--

CREATE TABLE `quartos` (
  `id_quarto` int(9) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `preco` int(9) DEFAULT NULL,
  `promocao` int(9) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_geren` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `quartos`
--

INSERT INTO `quartos` (`id_quarto`, `tipo`, `nome`, `preco`, `promocao`, `estado`, `id_geren`) VALUES
(4, 'Matrimonial', 'a', 3, NULL, 'Disponivel', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recepcionista`
--

CREATE TABLE `recepcionista` (
  `id_recep` int(9) NOT NULL,
  `endereço` varchar(60) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `horario` varchar(15) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `senha` varchar(15) DEFAULT NULL,
  `rg` varchar(30) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `id_geren` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `recepcionista`
--

INSERT INTO `recepcionista` (`id_recep`, `endereço`, `cpf`, `nome`, `horario`, `login`, `senha`, `rg`, `telefone`, `email`, `id_geren`) VALUES
(4, 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(9) NOT NULL,
  `id_quarto` int(9) NOT NULL,
  `id_hosp` int(9) NOT NULL,
  `entrada` varchar(22222) NOT NULL,
  `saida` varchar(222) NOT NULL,
  `data_reserva` varchar(2222) NOT NULL,
  `custo` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_serv` int(9) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `preco` varchar(10) DEFAULT NULL,
  `promocao` int(9) DEFAULT NULL,
  `id_geren` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`id_consumo`),
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_serv` (`id_serv`);

--
-- Indexes for table `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`id_geren`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `hospede`
--
ALTER TABLE `hospede`
  ADD PRIMARY KEY (`id_hosp`),
  ADD KEY `id_recep` (`id_recep`);

--
-- Indexes for table `quartos`
--
ALTER TABLE `quartos`
  ADD PRIMARY KEY (`id_quarto`),
  ADD KEY `id_geren` (`id_geren`);

--
-- Indexes for table `recepcionista`
--
ALTER TABLE `recepcionista`
  ADD PRIMARY KEY (`id_recep`),
  ADD KEY `id_geren` (`id_geren`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_quarto` (`id_quarto`),
  ADD KEY `id_hosp` (`id_hosp`);

--
-- Indexes for table `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_serv`),
  ADD KEY `id_geren` (`id_geren`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `consumo`
--
ALTER TABLE `consumo`
  MODIFY `id_consumo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gerente`
--
ALTER TABLE `gerente`
  MODIFY `id_geren` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospede`
--
ALTER TABLE `hospede`
  MODIFY `id_hosp` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quartos`
--
ALTER TABLE `quartos`
  MODIFY `id_quarto` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recepcionista`
--
ALTER TABLE `recepcionista`
  MODIFY `id_recep` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_serv` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `consumo_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  ADD CONSTRAINT `consumo_ibfk_2` FOREIGN KEY (`id_serv`) REFERENCES `servicos` (`id_serv`);

--
-- Limitadores para a tabela `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `gerente_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrador` (`id_admin`);

--
-- Limitadores para a tabela `hospede`
--
ALTER TABLE `hospede`
  ADD CONSTRAINT `hospede_ibfk_1` FOREIGN KEY (`id_recep`) REFERENCES `recepcionista` (`id_recep`);

--
-- Limitadores para a tabela `quartos`
--
ALTER TABLE `quartos`
  ADD CONSTRAINT `quartos_ibfk_1` FOREIGN KEY (`id_geren`) REFERENCES `gerente` (`id_geren`);

--
-- Limitadores para a tabela `recepcionista`
--
ALTER TABLE `recepcionista`
  ADD CONSTRAINT `recepcionista_ibfk_1` FOREIGN KEY (`id_geren`) REFERENCES `gerente` (`id_geren`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_quarto`) REFERENCES `quartos` (`id_quarto`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_hosp`) REFERENCES `hospede` (`id_hosp`);

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_ibfk_1` FOREIGN KEY (`id_geren`) REFERENCES `gerente` (`id_geren`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
