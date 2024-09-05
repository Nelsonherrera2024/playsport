-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-08-2024 a las 03:35:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `playsports`

CREATE DATABASE playsports;
USE DATABASE playsports;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'FUTBOL', 'FUTBOL', 1),
(2, 'BALONCESTO', 'BALONCESTO', 1),
(3, 'AUTOMOVILISMO', 'AUTOMOVILISMO', 1),
(4, 'CICLISMO', 'CICLISMO', 1),
(5, 'TENNIS', 'TENNIS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float(10,2) NOT NULL,
  `descuento` float(10,2) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_venta`
--

CREATE TABLE `estado_venta` (
  `id_estado_venta` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_venta`
--

INSERT INTO `estado_venta` (`id_estado_venta`, `descripcion`) VALUES
(1, 'ALISTAMIENTO'),
(2, 'EN TRANSITO'),
(3, 'ENTREGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` float(10,2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `descripcion`, `cantidad`, `estado`, `id_categoria`) VALUES
(1, 'FIFA 20', 120000.00, 'JUEGO DE SIMULACION DE FUTBOL DESARROLLADO POR EA SPORT', 10, 1, 1),
(2, 'FIFA 21', 180000.00, 'JUEGO DE SIMULACION DE FUTBOL DESARROLLADO POR EA SPORT', 10, 1, 1),
(3, 'FIFA 22', 210000.00, 'JUEGO DE SIMULACION DE FUTBOL DESARROLLADO POR EA SPORT', 10, 1, 1),
(4, 'FIFA 23', 240000.00, 'JUEGO DE SIMULACION DE FUTBOL DESARROLLADO POR EA SPORT', 10, 1, 1),
(5, 'FIFA 24', 280000.00, 'JUEGO DE SIMULACION DE FUTBOL DESARROLLADO POR EA SPORT', 10, 1, 1),
(6, 'NBA 2K 22', 32000.00, 'Juega con tus estrellas favoritas, control total en cada acción, y vive la intensidad de la cancha en emocionantes partidos.', 20, 1, 2),
(7, 'NBA 2K 23', 65000.00, 'Juega con tus estrellas favoritas, control total en cada acción, y vive la intensidad de la cancha en emocionantes partidos.', 10, 1, 2),
(8, 'NBA 2K 24', 80000.00, 'Juega con tus estrellas favoritas, control total en cada acción, y vive la intensidad de la cancha en emocionantes partidos.', 15, 1, 2),
(9, 'BASKETBALL MANAGER 2022', 80000.00, 'Juega con tus estrellas favoritas, control total en cada acción, y vive la intensidad de la cancha en emocionantes partidos.', 5, 1, 2),
(10, 'BASKETBALL LEGENDS', 80000.00, 'Juega con tus estrellas favoritas, control total en cada acción, y vive la intensidad de la cancha en emocionantes partidos.', 5, 1, 2),
(11, 'FORZA HORIZON 5', 70000.00, 'Explora los dinámicos paisajes abiertos al mundo y en constante evolución de México con una acción de conducción ilimitada en cientos de los mejores autos del mundo.', 10, 1, 3),
(12, 'GRAN TURISMO 7', 90000.00, 'Explora los dinámicos paisajes abiertos al mundo y en constante evolución de México con una acción de conducción ilimitada en cientos de los mejores autos del mundo.', 10, 1, 3),
(13, 'GRID LEGENDS', 12000.00, ' videojuego de carreras de 2022 desarrollado por Codemasters', 20, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'COMPRADOR', 'USUARIO ENCARGADO DE HACER COMPRAS DENTRO DEL APLICATIVO', 1),
(2, 'ADMINISTRADOR', 'USUARIO ADMINISTRADOR DEL APLICATIVO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cedula` varchar(255) NOT NULL,
  `telefono` int(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `cedula`, `telefono`, `direccion`, `correo`, `password`, `estado`, `id_rol`) VALUES
(1, 'JESSICA', '132003456', 2147483647, 'CALLE 53 #60-50', 'jessica@hotmail.com', '0000', 1, 1),
(2, 'OSCAR', '80654123', 315987654, 'CRA 73 #65-20', 'oscar@gmail.com', '1234', 1, 1),
(3, 'MAURICIO', '65321785', 2147483647, 'CALLE 100 #15-40', 'mauricio@hotmail.com', '5678', 1, 1),
(4, 'HELENA', '28211098', 317982344, 'CALLE 10 #45-60', 'helena@yahoo.com', '6543', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` float(10,2) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_estado_venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  ADD PRIMARY KEY (`id_estado_venta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_estado_venta` (`id_estado_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  MODIFY `id_estado_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_estado_venta`) REFERENCES `estado_venta` (`id_estado_venta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
