-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2026 a las 03:28:42
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
-- Base de datos: `cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

CREATE TABLE `actores` (
  `ActorID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `PremioOscar` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actores`
--

INSERT INTO `actores` (`ActorID`, `Nombre`, `PremioOscar`) VALUES
(1, 'Leonardo DiCaprio', 1),
(2, 'Brad Pitt', 1),
(3, 'Robert De Niro', 1),
(4, 'Tom Hanks', 1),
(5, 'Al Pacino', 1),
(6, 'Jack Nicholson', 1),
(7, 'Marlon Brando', 1),
(8, 'Morgan Freeman', 1),
(9, 'Christian Bale', 1),
(10, 'Samuel L. Jackson', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `DirectorID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`DirectorID`, `Nombre`, `Nacionalidad`, `FechaNacimiento`) VALUES
(1, 'Christopher Nolan', 'Británica', '1970-07-30'),
(2, 'Quentin Tarantino', 'Estadounidense', '1963-03-27'),
(3, 'Martin Scorsese', 'Estadounidense', '1942-11-17'),
(4, 'Steven Spielberg', 'Estadounidense', '1946-12-18'),
(5, 'Francis Ford Coppola', 'Estadounidense', '1939-04-07'),
(6, 'Stanley Kubrick', 'Estadounidense', '1928-07-26'),
(7, 'Alfred Hitchcock', 'Británica', '1899-08-13'),
(8, 'James Cameron', 'Canadiense', '1954-08-16'),
(9, 'Peter Jackson', 'Neozelandesa', '1961-10-31'),
(10, 'David Fincher', 'Estadounidense', '1962-08-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculaactor`
--

CREATE TABLE `peliculaactor` (
  `PeliculaID` int(11) NOT NULL,
  `ActorID` int(11) NOT NULL,
  `Personaje` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculaactor`
--

INSERT INTO `peliculaactor` (`PeliculaID`, `ActorID`, `Personaje`) VALUES
(1, 1, 'Cobb'),
(1, 2, 'Colaborador Ficticio'),
(2, 10, 'Jules Winnfield'),
(3, 3, 'Jimmy Conway'),
(4, 10, 'Ray Arnold'),
(5, 5, 'Michael Corleone'),
(5, 7, 'Vito Corleone'),
(6, 6, 'Jack Torrance'),
(8, 1, 'Jack Dawson'),
(10, 2, 'Tyler Durden');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `PeliculaID` int(11) NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `AnioLanzamiento` year(4) DEFAULT NULL,
  `DirectorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`PeliculaID`, `Titulo`, `AnioLanzamiento`, `DirectorID`) VALUES
(1, 'Inception', '2010', 1),
(2, 'Pulp Fiction', '1994', 2),
(3, 'Goodfellas', '1990', 3),
(4, 'Jurassic Park', '1993', 4),
(5, 'The Godfather', '1972', 5),
(6, 'The Shining', '1980', 6),
(7, 'Psycho', '1960', 7),
(8, 'Titanic', '1997', 8),
(9, 'The Lord of the Rings', '2001', 9),
(10, 'Fight Club', '1999', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`ActorID`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`DirectorID`);

--
-- Indices de la tabla `peliculaactor`
--
ALTER TABLE `peliculaactor`
  ADD PRIMARY KEY (`PeliculaID`,`ActorID`),
  ADD KEY `ActorID` (`ActorID`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`PeliculaID`),
  ADD KEY `DirectorID` (`DirectorID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actores`
--
ALTER TABLE `actores`
  MODIFY `ActorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `directores`
--
ALTER TABLE `directores`
  MODIFY `DirectorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `PeliculaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculaactor`
--
ALTER TABLE `peliculaactor`
  ADD CONSTRAINT `peliculaactor_ibfk_1` FOREIGN KEY (`PeliculaID`) REFERENCES `peliculas` (`PeliculaID`),
  ADD CONSTRAINT `peliculaactor_ibfk_2` FOREIGN KEY (`ActorID`) REFERENCES `actores` (`ActorID`);

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`DirectorID`) REFERENCES `directores` (`DirectorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
