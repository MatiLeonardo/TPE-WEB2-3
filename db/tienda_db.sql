-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 22:23:02
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
-- Base de datos: `tienda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `oferta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `oferta`) VALUES
(1, 'Teclados', 'Descripcion 1', 0),
(2, 'Microprocesadores', 'Descripcion 2', 1),
(3, 'Tarjetas Graficas', 'Descripcion 3', 0),
(4, 'Ratones', 'Descripcion 4', 1),
(6, 'Impresoras', 'Las mejores impresoras', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_categoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `producto`, `precio`, `descripcion`, `id_categoria`) VALUES
(1, 'EPOMAKER RT100', 219999.00, 'Teclado Mecánico estilo retro con Pantalla Inteligente Personalizable, Interruptores Volátiles en Calor, BT5.0/2.4G Inalámbrico, Batería de 5000mAh.', 1),
(2, 'TECLADO GAMER EVGA Z15 RGB COLOR CLICKY BRONZE', 103949.00, 'Este teclado Evga de alto rendimiento permite que puedas disfrutar de horas ilimitadas de juegos. Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo.', 1),
(3, 'AMD Ryzen 7 5800X', 179527.50, 'Procesador de escritorio desbloqueado de 8 núcleos y 16 hilos 4.7 GHz Max Boost, desbloqueado para overclocking, 36 MB de caché, soporte DDR-3200. Para la plataforma avanzada Socket AM4, puede admitir PCIe 4.0 en placas base X570 y B550', 2),
(4, 'Intel Core i7-12700KF', 188999.62, 'Procesador de escritorio para juegos 12 (8P+4E) núcleos hasta 5.0 GHz desbloqueado LGA1700 Serie 600 Chipset 125W', 2),
(5, 'MSI Gaming RTX 4080 Super 16gb', 188999.62, 'Tarjeta gráfica NVIDIA RTX 4080 Super, 256 bits, reloj de aumento: 2625 MHz, 16 GB GDRR6X 23 Gbps, HDMI/DP, Arquitectura Ada Lovelace', 3),
(6, 'Logitech G 502 Lightspeed', 79499.99, 'Mouse inalámbrico para juegos con sensor Hero 25K, compatible con PowerPlay, pesos sintonizables y Lightsync RGB - Negro', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `isAdmin`) VALUES
(1, 'webadmin', '$2y$10$x0UWBvnHbYJ8KuHsqJwM1.oQnE6WUsJGt8tGy1KhPz.UEddOx4eja', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
