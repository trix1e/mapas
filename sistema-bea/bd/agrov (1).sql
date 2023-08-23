-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2023 a las 00:44:34
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agrov`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `id` int(5) NOT NULL,
  `nombre` varchar(128) NOT NULL,
  `precio` double NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`id`, `nombre`, `precio`, `stock`) VALUES
(1, 'Sfru durazno 600ml', 100, 10),
(2, 'Frutall Manzana 1 Litro', 70.5, 10),
(3, 'Sfru Durazno 2 Litros', 69.5, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(5) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `local` varchar(25) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `factura` varchar(4) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `ubicacion` varchar(32) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `local`, `telefono`, `factura`, `nit`, `ubicacion`, `fecha`) VALUES
(1, 'Jorge Ivan Camacho Flores', 'Tiendita de la esquina', '69442080', 'si', '1234567', '3c24qrw4atv2w35r', '2023-08-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(5) NOT NULL,
  `nombre_cliente` varchar(64) NOT NULL,
  `pedido` varchar(512) NOT NULL,
  `total` double NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `descripcion` varchar(64) NOT NULL,
  `preventista` varchar(20) NOT NULL,
  `distribuidor` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `nombre_cliente`, `pedido`, `total`, `ubicacion`, `descripcion`, `preventista`, `distribuidor`, `fecha`, `estado`) VALUES
(13, 'Carlitos Jr', 'option1, option2', 23, '-17.386777, -66.152657', 'addasdasdasdasdsa', 'Carlitos', 'Carlita', '0000-00-00', 'administrador'),
(14, 'Bruno', 'option1, option2', 56.6, '-17.391855, -66.160854', 'centro plaza colon', 'Ivan', 'Ivan2', '2023-07-26', 'pendiente'),
(15, 'Bruno', 'option1, option2', 56.6, '-17.388319, -66.155791', 'centro plaza colon', 'Beymar', 'Wilmer', '2023-07-26', 'pendiente'),
(16, 'Ivan', 'option1, option1, option3', 345.6, '-17.384193, -66.152035', 'Casa Azul', 'Geinar', 'Rodrigo', '2023-08-31', 'pendiente'),
(17, 'AL', 'option1, option2', 456.5, '-17.385790, -66.158816', 'cASA', 'Sergio', 'Alfred', '2023-07-25', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(5) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `nombre_completo` varchar(32) NOT NULL,
  `direccion` varchar(64) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contraseña`, `nombre_completo`, `direccion`, `telefono`, `rol`, `fecha_creacion`) VALUES
(2, 'Administrador', 'admin123', 'Administrador Desarrollador', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '0000000000', 'administrador', '2023-06-27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
