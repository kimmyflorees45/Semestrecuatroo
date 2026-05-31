-- 1. PREPARACIÓN DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS biologia_db;
USE biologia_db;

-- Limpieza total para evitar errores de duplicados o llaves foráneas
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS fauna_terrestre;
DROP TABLE IF EXISTS fauna_marina;
DROP TABLE IF EXISTS ecosistemas;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. CREACIÓN DE TABLAS (Estructura de 8 columnas por tabla)

-- TABLA PRINCIPAL: Ecosistemas
CREATE TABLE ecosistemas (
    id_ecosistema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    clima VARCHAR(50),
    ubicacion VARCHAR(100),
    temp_media VARCHAR(20),
    precipitacion VARCHAR(50),
    tipo_suelo VARCHAR(50),
    estado_conservacion VARCHAR(50)
) ENGINE=InnoDB;

-- TABLA IZQUIERDA: Fauna Terrestre
CREATE TABLE fauna_terrestre (
    id_terrestre INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comun VARCHAR(100),
    nombre_cientifico VARCHAR(100),
    habitat VARCHAR(100),
    peso_kg VARCHAR(20),
    dieta VARCHAR(50),
    esperanza_vida VARCHAR(20),
    id_ecosistema INT,
    FOREIGN KEY (id_ecosistema) REFERENCES ecosistemas(id_ecosistema) ON DELETE CASCADE
) ENGINE=InnoDB;

-- TABLA DERECHA: Fauna Marina
CREATE TABLE fauna_marina (
    id_marina INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comun VARCHAR(100),
    nombre_cientifico VARCHAR(100),
    profundidad VARCHAR(50),
    alimentacion VARCHAR(50),
    metodo_respiracion VARCHAR(50),
    salinidad_agua VARCHAR(30),
    id_ecosistema INT,
    FOREIGN KEY (id_ecosistema) REFERENCES ecosistemas(id_ecosistema) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. INSERCIÓN DE DATOS: ECOSISTEMAS (20 registros)
INSERT INTO ecosistemas (id_ecosistema, nombre, clima, ubicacion, temp_media, precipitacion, tipo_suelo, estado_conservacion) VALUES 
(1, 'Selva Amazónica', 'Húmedo', 'Brasil', '26°C', '3000mm', 'Arcilloso', 'Amenazado'),
(2, 'Desierto de Sahara', 'Árido', 'Norte de África', '30°C', '100mm', 'Arenoso', 'Estable'),
(3, 'Tundra Ártica', 'Polar', 'Rusia/Canadá', '-10°C', '250mm', 'Permafrost', 'Vulnerable'),
(4, 'Arrecife de Coral', 'Tropical', 'Australia', '24°C', 'N/A', 'Sedimentario', 'Crítico'),
(5, 'Bosque Templado', 'Templado', 'Europa', '15°C', '1000mm', 'Limoso', 'Estable'),
(6, 'Sabana Africana', 'Cálido', 'Kenia/Tanzania', '25°C', '800mm', 'Ferralítico', 'Amenazado'),
(7, 'Manglar Costero', 'Húmedo', 'México', '27°C', '1500mm', 'Fangoso', 'En peligro'),
(8, 'Taiga', 'Frío', 'Escandinavia', '5°C', '500mm', 'Podzol', 'Estable'),
(9, 'Pradera Pampeana', 'Templado', 'Argentina', '18°C', '900mm', 'Chernozem', 'Vulnerable'),
(10, 'Monte Nuboso', 'Neblinoso', 'Costa Rica', '19°C', '2000mm', 'Orgánico', 'Protegido'),
(11, 'Estepa Asiática', 'Continental', 'Mongolia', '10°C', '400mm', 'Castaño', 'Estable'),
(12, 'Páramo Andino', 'Frío Húmedo', 'Colombia/Ecuador', '8°C', '1200mm', 'Andosol', 'Vulnerable'),
(13, 'Chaparral', 'Mediterráneo', 'California', '20°C', '450mm', 'Rocoso', 'Estable'),
(14, 'Selva de Borneo', 'Ecuatorial', 'Indonesia', '28°C', '3500mm', 'Laterítico', 'Amenazado'),
(15, 'Gran Barrera Coral', 'Marino', 'Oceanía', '26°C', 'N/A', 'Coralino', 'Blanqueado'),
(16, 'Pantanal', 'Húmedo', 'Paraguay', '25°C', '1800mm', 'Aluvial', 'Amenazado'),
(17, 'Bosque Seco', '