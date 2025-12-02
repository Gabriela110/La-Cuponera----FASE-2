-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2025 at 05:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuponera`
--

-- --------------------------------------------------------

--
-- Table structure for table `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administradores`
--

INSERT INTO `administradores` (`id_admin`, `usuario`, `correo`, `contraseña`) VALUES
(1, 'Gabriela001', 'admin1@cuponera.com', 'Admin1'),
(2, 'Juan Perez ', 'admin2@cuponera.com', '$2y$10$MSl.k2eYW9f9eX9lezQKQup3vC70T/NvDlDedpSAA1ZaDPPju58WW');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `usuario`, `correo`, `contrasena`, `nombre`, `apellidos`, `dui`, `fecha_nacimiento`) VALUES
(3, 'Gabriela.mh', 'gabriela.mh@gmail.com', '$2y$10$EWdQgdqkJ9QhyN033Ilh/eDTF7OJxqkM2pY3C.PohCuvFq7vJ52LO', 'Gabriela', 'Merino', '03004789-8', '2000-01-01'),
(4, 'Gabriela', 'gaby@gmail.com', '$2y$10$LQDpDHCvPJGErGxYBsXkHOyp2T0FIoKYym74c4yoKPWujByBVVp4q', 'Gabriela', 'Merino', '000000000', '2001-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_oferta` int(11) NOT NULL,
  `codigo_cupon` varchar(50) NOT NULL,
  `fecha_compra` datetime DEFAULT current_timestamp(),
  `cantidad` int(11) DEFAULT 1,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `estado` enum('pendiente','aprobada','rechazada') DEFAULT 'pendiente',
  `comision` decimal(5,2) DEFAULT 0.00,
  `id_admin_aprobador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre`, `nit`, `direccion`, `telefono`, `correo`, `usuario`, `contrasena`, `estado`, `comision`, `id_admin_aprobador`) VALUES
(1, 'EmpresaXYZ', '0123-445566-000-0', '1ª Calle Oriente # 123, Colonia San Benito, San Salvador, El Salvador', '2215-9688', 'empresaxyz@gmail.com', 'EmpresaXYZ', '$2y$10$2jWFtqLwcL9bkhh9XubwkOz3b82doIwBmabLi5C04527m9Y95VX1y', 'aprobada', 10.00, NULL),
(2, 'Almacenes Siman ', '0800-241265-102-5', 'PQ29+WX2, P.º Gral. Escalón 3700, San Salvador', '2277-4455', 'ventas@siman.com', 'ventas_siman', '$2y$10$1L7ctyGV57NK3/sXIXz1GOU1N5vYEyq6vH21M2E3PclfWfaNVpTF6', 'aprobada', 15.00, NULL),
(3, 'Empresa1', '0123-445566-000-1', 'San Salvador', '22334455', 'empresa1@gmail.com', 'Empresa1', '$2y$10$x/cbqqwt8Cr3L3LVipnS.OqEeOILm35sJm1FdbKmbVYCQ/17DYYbO', 'aprobada', 20.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `fecha_factura` datetime DEFAULT current_timestamp(),
  `monto` decimal(10,2) NOT NULL,
  `codigo_unico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ofertas`
--

CREATE TABLE `ofertas` (
  `id_oferta` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `precio_regular` decimal(10,2) NOT NULL,
  `precio_oferta` decimal(10,2) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_limite_canje` date DEFAULT NULL,
  `fecha_limite` date NOT NULL,
  `cantidad_cupones` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('disponible','no disponible') DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ofertas`
--

INSERT INTO `ofertas` (`id_oferta`, `id_empresa`, `titulo`, `precio_regular`, `precio_oferta`, `fecha_inicio`, `fecha_fin`, `fecha_limite_canje`, `fecha_limite`, `cantidad_cupones`, `descripcion`, `estado`) VALUES
(1, 3, 'Cyber Monday', 600.00, 499.00, '2025-12-01', '2025-12-02', '2025-12-02', '0000-00-00', 20, 'Cupon de descuento para Lapton 15 HP AMD RYZEN 5 . Descuento por Cyber Monday ', 'disponible');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD UNIQUE KEY `codigo_cupon` (`codigo_cupon`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_oferta` (`id_oferta`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `id_admin_aprobador` (`id_admin_aprobador`);

--
-- Indexes for table `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_compra` (`id_compra`);

--
-- Indexes for table `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`id_oferta`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_oferta`) REFERENCES `ofertas` (`id_oferta`);

--
-- Constraints for table `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_admin_aprobador`) REFERENCES `administradores` (`id_admin`);

--
-- Constraints for table `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`);

--
-- Constraints for table `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
