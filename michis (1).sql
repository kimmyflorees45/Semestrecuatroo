-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2026 a las 03:26:58
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
-- Base de datos: `michis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comics`
--

CREATE TABLE `comics` (
  `comicID` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `aniopublicacion` year(4) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comics`
--

INSERT INTO `comics` (`comicID`, `titulo`, `aniopublicacion`, `descripcion`) VALUES
(1, 'The Amazing Spider-Man #1', '1963', 'El debut de Spider-Man.'),
(2, 'Tales of Suspense #39', '1963', 'El nacimiento de Iron Man.'),
(3, 'Captain America Comics #1', '1941', 'La primera aparición del Capitán América.'),
(4, 'Tales of Suspense #52', '1964', 'La presentación de Black Widow.'),
(5, 'The Incredible Hulk #1', '1962', 'El primer cómic de Hulk.'),
(6, 'hola', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajecomic`
--

CREATE TABLE `personajecomic` (
  `personajeID` int(11) DEFAULT NULL,
  `comicID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personajecomic`
--

INSERT INTO `personajecomic` (`personajeID`, `comicID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `personajeID` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `Alias` varchar(100) NOT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`personajeID`, `nombre`, `Alias`, `FechaCreacion`, `Descripcion`) VALUES
(1, 'Peter Parker', 'Spider-Man', '1962-08-01', 'El superhéroe que teje telarañas.'),
(2, 'Tony Stark', 'Iron Man', '1963-03-01', 'Genio, multimillonario, playboy y filántropo.'),
(3, 'Steve Rogers', 'Captain America', '1941-03-01', 'El supersoldado con el escudo indestructible.'),
(4, 'Natasha Romanoff', 'Black Widow', '1964-04-01', 'Espía y luchadora experta.'),
(5, 'Bruce Banner', 'Hulk', '1962-05-01', 'Se convierte en un gigante verde cuando se enfurece.'),
(6, 'hola', 'hola', '0000-00-00', 'hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajesuperpoder`
--

CREATE TABLE `personajesuperpoder` (
  `personajeID` int(11) DEFAULT NULL,
  `superpoderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personajesuperpoder`
--

INSERT INTO `personajesuperpoder` (`personajeID`, `superpoderID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superpoderes`
--

CREATE TABLE `superpoderes` (
  `superpoderID` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `superpoderes`
--

INSERT INTO `superpoderes` (`superpoderID`, `nombre`, `descripcion`) VALUES
(1, 'Trepar paredes', 'Spider-Man puede adherirse a superficies verticales y techos.'),
(2, 'Traje de Iron Man', 'Tony Stark utiliza una armadura con numerosas habilidades.'),
(3, 'Suero del supersoldado', 'Steve Rogers obtiene fuerza y agilidad sobrehumanas.'),
(4, 'Espionaje y combate', 'Black Widow es experta en espionaje y combate mano a mano.'),
(5, 'Transformación', 'Bruce Banner se convierte en Hulk con una gran fuerza.'),
(6, 'hola', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`comicID`);

--
-- Indices de la tabla `personajecomic`
--
ALTER TABLE `personajecomic`
  ADD KEY `personajeID` (`personajeID`),
  ADD KEY `comicID` (`comicID`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`personajeID`);

--
-- Indices de la tabla `personajesuperpoder`
--
ALTER TABLE `personajesuperpoder`
  ADD KEY `personajeID` (`personajeID`),
  ADD KEY `superpoderID` (`superpoderID`);

--
-- Indices de la tabla `superpoderes`
--
ALTER TABLE `superpoderes`
  ADD PRIMARY KEY (`superpoderID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comics`
--
ALTER TABLE `comics`
  MODIFY `comicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `personajeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `superpoderes`
--
ALTER TABLE `superpoderes`
  MODIFY `superpoderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personajecomic`
--
ALTER TABLE `personajecomic`
  ADD CONSTRAINT `personajecomic_ibfk_1` FOREIGN KEY (`personajeID`) REFERENCES `personajes` (`personajeID`),
  ADD CONSTRAINT `personajecomic_ibfk_2` FOREIGN KEY (`comicID`) REFERENCES `comics` (`comicID`);

--
-- Filtros para la tabla `personajesuperpoder`
--
ALTER TABLE `personajesuperpoder`
  ADD CONSTRAINT `personajesuperpoder_ibfk_1` FOREIGN KEY (`personajeID`) REFERENCES `personajes` (`personajeID`),
  ADD CONSTRAINT `personajesuperpoder_ibfk_2` FOREIGN KEY (`superpoderID`) REFERENCES `superpoderes` (`superpoderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
