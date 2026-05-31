-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2026 a las 22:37:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueños`
--

CREATE TABLE `dueños` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dueños`
--

INSERT INTO `dueños` (`id`, `nombre_completo`, `telefono`, `direccion`) VALUES
(1, 'Kimberly Flores', '8991234567', 'Col. Centro, Reynosa'),
(2, 'Juan Pérez', '5559876543', 'CDMX, México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gatos`
--

CREATE TABLE `gatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tamaño` varchar(50) NOT NULL,
  `biografia` text DEFAULT NULL,
  `alergias` varchar(255) DEFAULT NULL,
  `imagen` longblob DEFAULT NULL,
  `id_dueño` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gatos`
--

INSERT INTO `gatos` (`id`, `nombre`, `fecha_nacimiento`, `tamaño`, `biografia`, `alergias`, `imagen`, `id_dueño`) VALUES
(1, 'Luna', '2022-05-10', 'Mediano', 'Una gatita muy curiosa que ama las cajas.', NULL, NULL, 1),
(2, 'Simba', '2021-08-15', 'Grande', 'El rey de la casa, le gusta dormir al sol.', NULL, NULL, 1),
(3, 'Pelusa', '2023-01-20', 'Pequeño', 'Rescatado de la calle, muy agradecido.', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gato_raza`
--

CREATE TABLE `gato_raza` (
  `gato_id` int(11) NOT NULL,
  `raza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gato_raza`
--

INSERT INTO `gato_raza` (`gato_id`, `raza_id`) VALUES
(1, 1),
(2, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `nombre_pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre_pais`) VALUES
(1, 'Tailandia'),
(2, 'Irán'),
(3, 'Estados Unidos'),
(4, 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `id` int(11) NOT NULL,
  `tipo_pelo` varchar(50) NOT NULL,
  `nombre_raza` varchar(50) NOT NULL,
  `temperamento_predominante` varchar(100) NOT NULL,
  `id_pais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`id`, `tipo_pelo`, `nombre_raza`, `temperamento_predominante`, `id_pais`) VALUES
(1, 'Corto', 'Siamés', 'Social y Vocal', 1),
(2, 'Largo', 'Persa', 'Tranquilo y Dulce', 2),
(3, 'Largo', 'Maine Coon', 'Amigable y Gigante', 3),
(4, 'Corto', 'Mestizo', 'Variado y Activo', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dueños`
--
ALTER TABLE `dueños`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gatos`
--
ALTER TABLE `gatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dueño` (`id_dueño`);

--
-- Indices de la tabla `gato_raza`
--
ALTER TABLE `gato_raza`
  ADD PRIMARY KEY (`gato_id`,`raza_id`),
  ADD KEY `raza_id` (`raza_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pais` (`id_pais`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dueños`
--
ALTER TABLE `dueños`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gatos`
--
ALTER TABLE `gatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `raza`
--
ALTER TABLE `raza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gatos`
--
ALTER TABLE `gatos`
  ADD CONSTRAINT `gatos_ibfk_1` FOREIGN KEY (`id_dueño`) REFERENCES `dueños` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `gato_raza`
--
ALTER TABLE `gato_raza`
  ADD CONSTRAINT `gato_raza_ibfk_1` FOREIGN KEY (`gato_id`) REFERENCES `gatos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gato_raza_ibfk_2` FOREIGN KEY (`raza_id`) REFERENCES `raza` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `raza`
--
ALTER TABLE `raza`
  ADD CONSTRAINT `raza_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
