-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2026 a las 03:27:40
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
(1, 'Chris Evans', '8991112233', 'Av. Captain America 123'),
(2, 'Ariana Grande', '8994445566', 'Calle Sweetener 789'),
(3, 'Robert Downey Jr', '8997778899', 'Torre Stark 3000'),
(4, 'Taylor Swift', '8990001122', 'Cornelia Street 13'),
(5, 'Tom Holland', '8993334455', 'Queens NY 20'),
(6, 'Scarlett Johansson', '8996667788', 'Red Widow Blvd 101'),
(7, 'Billie Eilish', '8999990011', 'Ocean Eyes Ave 5'),
(8, 'Harry Styles', '8992223344', 'Golden Road 1994'),
(9, 'Zendaya', '8995556677', 'Euphoria Dr 24'),
(10, 'Bruno Mars', '8998889900', '24K Magic St');

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
(1, 'Dodger', '2020-05-10', 'Grande', 'El mejor amigo del Cap.', 'Ninguna', 0x666f746f312e6a7067, 1),
(2, 'Toulouse', '2021-02-15', 'Pequeño', 'Le gusta el lujo.', 'Pescado', 0x666f746f322e6a7067, 2),
(3, 'Jarvis', '2019-11-20', 'Grande', 'Gato tecnológico.', 'Ninguna', 0x666f746f332e6a7067, 3),
(4, 'Meredith', '2014-06-13', 'Mediano', 'Es un poco gruñona.', 'Ninguna', 0x666f746f342e6a7067, 4),
(5, 'Peter', '2022-08-01', 'Pequeño', 'Le gusta trepar.', 'Ninguna', 0x666f746f352e6a7067, 5),
(6, 'Natasha', '2020-03-12', 'Mediano', 'Experta cazadora.', 'Ninguna', 0x666f746f362e6a7067, 6),
(7, 'Shark', '2023-01-05', 'Pequeño', 'Mirada azul profunda.', 'Polen', 0x666f746f372e6a7067, 7),
(8, 'Cherry', '2022-05-20', 'Mediano', 'Siempre a la moda.', 'Ninguna', 0x666f746f382e6a7067, 8),
(9, 'Rue', '2021-09-30', 'Pequeño', 'Gatito curioso.', 'Ninguna', 0x666f746f392e6a7067, 9),
(10, 'Hooligan', '2020-10-10', 'Grande', 'Líder del barrio.', 'Acaros', 0x666f746f31302e6a7067, 10),
(11, 'Cap', '2023-07-04', 'Grande', 'Valiente y leal.', 'Ninguna', 0x666f746f31312e6a7067, 1),
(12, 'Coco', '2022-12-25', 'Pequeño', 'Blanco como nieve.', 'Ninguna', 0x666f746f31322e6a7067, 2),
(13, 'Morgan', '2021-04-10', 'Pequeño', 'Consentida Stark.', 'Lácteos', 0x666f746f31332e6a7067, 3),
(14, 'Olivia', '2016-03-01', 'Mediano', 'Famosa de videos.', 'Ninguna', 0x666f746f31342e6a7067, 4),
(15, 'Benji', '2024-01-10', 'Pequeño', 'El más travieso.', 'Ninguna', 0x666f746f31352e6a7067, 4),
(16, 'Spider', '2023-09-15', 'Pequeño', 'Salta mucho.', 'Ninguna', 0x666f746f31362e6a7067, 5),
(17, 'Miles', '2022-11-11', 'Mediano', 'Manchas originales.', 'Ninguna', 0x666f746f31372e6a7067, 5),
(18, 'Yelena', '2021-06-20', 'Mediano', 'Hermana de Natasha.', 'Ninguna', 0x666f746f31382e6a7067, 6),
(19, 'Bacon', '2020-02-14', 'Grande', 'Ama el tocino.', 'Cereales', 0x666f746f31392e6a7067, 1),
(20, 'Ophelia', '2023-08-08', 'Pequeño', 'Maullido melodioso.', 'Ninguna', 0x666f746f32302e6a7067, 2);

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
(1, 4),
(2, 1),
(3, 3),
(4, 2),
(5, 4),
(6, 4),
(7, 1),
(8, 2),
(9, 4),
(10, 3),
(11, 4),
(12, 1),
(13, 2),
(14, 2),
(15, 3),
(16, 4),
(17, 4),
(18, 4),
(19, 3),
(20, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `gatos`
--
ALTER TABLE `gatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
