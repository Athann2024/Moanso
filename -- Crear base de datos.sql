-- Crear base de datos
CREATE DATABASE ProyectoTalma;
USE ProyectoTalma;

------------------------------------------
-- TABLA TRABAJADOR 
------------------------------------------
CREATE TABLE Trabajador (
    ID_Trabajador INT PRIMARY KEY IDENTITY(1,1),
    DNI CHAR(8) UNIQUE NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Telefono CHAR(9) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    ID_Lider INT NULL  -- autorelacion (supervisor/lider)
)

-- Agregar la clave foranea del lider (autorelacion)
ALTER TABLE Trabajador
ADD CONSTRAINT FK_Trabajador_Lider 
FOREIGN KEY (ID_Lider) REFERENCES Trabajador(ID_Trabajador);

-- =======================
-- TABLA CARNET
-- =======================
CREATE TABLE Carnet (
    ID_Carnet INT PRIMARY KEY IDENTITY(1,1),
    Codigo_RFID VARCHAR(30) UNIQUE NOT NULL,
    Fecha_Emision DATE NOT NULL,
    ID_Trabajador INT UNIQUE, -- Relacion 1:1
    CONSTRAINT FK_Carnet_Trabajador FOREIGN KEY (ID_Trabajador) 
    REFERENCES Trabajador(ID_Trabajador)
)

------------------------------------------
-- TABLA PEA 
------------------------------------------
CREATE TABLE PEA (
    ID_PEA INT PRIMARY KEY IDENTITY(1,1),
    Numero_PEA INT NOT NULL,
    Capacidad INT NOT NULL,
    Descripcion VARCHAR(20) 
)

-- =======================
-- TABLA ASIGNACION
-- =======================
CREATE TABLE Asignacion (
    ID_Asignacion INT PRIMARY KEY IDENTITY(1,1),
    ID_Trabajador INT NOT NULL,
    ID_PEA INT NOT NULL,
    Fecha DATE NOT NULL,
    CONSTRAINT FK_Asignacion_Trabajador FOREIGN KEY (ID_Trabajador) REFERENCES Trabajador(ID_Trabajador),
    CONSTRAINT FK_Asignacion_PEA FOREIGN KEY (ID_PEA) REFERENCES PEA(ID_PEA)
)

------------------------------------------
-- TABLA AREA 
------------------------------------------
CREATE TABLE Area (
    Nombre_Area VARCHAR(30) PRIMARY KEY
)

-- =======================
-- TABLA ASIGNACION_AREA
-- =======================
CREATE TABLE Asignacion_Area (
    ID_Asignacion_Area INT PRIMARY KEY IDENTITY(1,1),
    ID_Trabajador INT NOT NULL,
    Nombre_Area VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    CONSTRAINT FK_AsignacionA_Trabajador FOREIGN KEY (ID_Trabajador) REFERENCES Trabajador(ID_Trabajador),
    CONSTRAINT FK_AsignacionA_Area FOREIGN KEY (Nombre_Area) REFERENCES Area(Nombre_Area)
)

-- =======================
-- TABLA VUELOS
-- =======================
CREATE TABLE Vuelos (
    ID_Vuelo INT PRIMARY KEY IDENTITY(1,1),
    ID_Lider INT NOT NULL,
    Modelo_Avion VARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL,
    Tiempo_Aeronave VARCHAR(30),
    CONSTRAINT FK_Vuelo_Lider FOREIGN KEY (ID_Lider) REFERENCES Trabajador(ID_Trabajador)
)

-- =======================
-- TABLA ASIGNACION_VUELO
-- =======================
CREATE TABLE Asignacion_Vuelo (
    ID_Trabajador INT NOT NULL,
    ID_Vuelo INT NOT NULL,
    CONSTRAINT PK_Asignacion_Vuelo PRIMARY KEY (ID_Trabajador, ID_Vuelo),
    CONSTRAINT FK_AsignacionV_Trabajador FOREIGN KEY (ID_Trabajador) REFERENCES Trabajador(ID_Trabajador),
    CONSTRAINT FK_AsignacionV_Vuelo FOREIGN KEY (ID_Vuelo) REFERENCES Vuelos(ID_Vuelo)
)

------------------------------------------
-- Insertar datos
------------------------------------------

--correo, numero, direccion

-- Insertar lideres
INSERT INTO Trabajador VALUES
('11112222','Luis','Perez Rojas','perezrojas@gmail.com','901283745','Av. Primavera # 125, Surco', NULL),
('22223333','Maria','Campos Diaz','camposdiaz@gmail.com','902374856','Av. Los Álamos # 342, Surco', NULL),
('33334444','Carlos','Ramirez Torres','ramireztorres@gmail.com','903465987','Av. El Bosque # 578, Surco', NULL),
('49172638', 'Juan', 'Perez Gomez','perezgomez@gmail.com','904576198','Av. Las Camelias # 311, Surco', NULL),
('83751042', 'Maria', 'Gonzalez Lopez','gonzalezlopez@gmail.com','905687219','Av. Los Geranios # 429, Surco', NULL),
('26580193', 'Carlos', 'Ramirez Torres','ramireztorres@gmail.com','906798320','Av. San Luis # 903, Surco', NULL),
('91048275', 'Ana', 'Torres Delgado','torresdelgado@gmail.com','907819431','Av. Huayna Capac # 256, Surco', NULL),
('34892710', 'Luis', 'Fernandez Rivas','fernandezrivas@gmail.com','908920542','Av. El Pinar # 760, Surco', NULL),
('70529183', 'Carmen', 'Herrera Vargas','herreravargas@gmail.com','909031653','Av. San Borja Norte # 482, Surco', NULL),
('19287354', 'Jose', 'Martinez Castro','martinezcastro@gmail.com','910142764','Av. Universitaria # 1125, Los Olivos', NULL);

--correo, numero, direccion

-- Insertar trabajadores
INSERT INTO Trabajador VALUES
('44445555','Jose','Ramirez Soto','ramirezsoto@gmail.com','911253875','Av. Huandoy # 884, Los Olivos','1'),
('55556666','Lucia','Martinez Quispe','martinezquispe@gmail.com','912364986','Av. Los Fresnos # 473, Los Olivos','2'),
('66667777','Miguel','Suarez Reyes','suarezreyes@gmail.com','913475097','Av. Los Nogales # 699, Los Olivos','1'),
('77778888','Sofia','Navarro Leon','navarroleon@gmail.com','914586208','Av. Domingo Orue # 250, Los Olivos','3'),
('68103527', 'Laura', 'Morales Diaz','moralesdiaz@gmail.com','915697319','Av. Carlos Izaguirre # 317, Los Olivos', '1'),
('57219304', 'Miguel', 'Lopez Reyes','lopezreyes@gmail.com','916708420','Av. El Milagro # 902, Los Olivos', '7'),
('69482073', 'Sofia', 'Cerna Lima','cernalima@gmail.com','917819531','Av. Jose Galvez # 540, Los Olivos', '1'),
('18073495', 'Andres', 'Castro Romero','castroromero@gmail.com','918920642','Av. Las Acacias # 771, Los Olivos', '7'),
('40259187', 'Daniela', 'Ortiz Campos','ortizcampos@gmail.com','919031753','Av. Arequipa # 1432, San Isidro', '7'),
('76391082', 'Ricardo', 'Silva Cabrera','silvacabrera@gmail.com','920142864','Av. El Bosque # 658, San Isidro', '7'),
('52180364', 'Valeria', 'Rojas Molina','rojasmolina@gmail.com','921253975','Av. Victor Andres Belaunde # 329, San Isidro', '1'),
('93627841', 'Francisco', 'Medina Torres','medinatorres@gmail.com','922364086','Av. Javier Prado # 2560, San Isidro', '1'),
('15739082', 'Elena', 'Cabrera Soto','cabrerasoto@gmail.com','923475197','Av. Republica de Panama # 490, San Isidro', '1'),
('80472691', 'David', 'Reyes Marquez','reyesmarquez@gmail.com','924586308','Av. Jose Pardo # 711, San Isidro', '2'),
('23851097', 'Lucia', 'Vargas Fuentes','vargasfuentes@gmail.com','925697419','Av. Los Ingenieros # 125, San Isidro', '2'),
('61598032', 'Jorge', 'Delgado Ramos','delgadoramos@gmail.com','926708520','Av. Camino Real # 937, San Isidro', '2'),
('39420815', 'Natalia', 'Soto Aguilar','sotoaguilar@gmail.com','927819631','Av. Petit Thouars # 804, San Isidro', '4'),
('75102938', 'Sergio', 'Aguilar Dominguez','aguilardominguez@gmail.com','928920742','Av. Brasil # 618, Jesus Maria', '4'),
('28519306', 'Gabriela', 'Campos Herrera','camposherrera@gmail.com','929031853','Av. 28 de Julio # 233, Jesus Maria', '4'),
('94752068', 'Pedro', 'Flores Cordero','florescordero@gmail.com','930142964','Av. 9 de Diciembre # 475, Jesus Maria', '4'),
('16092894', 'Julia', 'Arias Nuñez','ariasnuñez@gmail.com','931253075','Av. San Felipe # 329, Jesus Maria', '2'),
('53829470', 'Raul', 'Dominguez Bravo','dominguezbravo@gmail.com','932364186','Av. Arequipa # 893, Jesus Maria', '2'),
('80271394', 'Patricia', 'Leon Salazar','leonsalazar@gmail.com','933475297','Av. Jose Pardo # 187, Jesus Maria', '10'),
('21485739', 'Manuel', 'Fuentes Vega','fuentesvega@gmail.com','934586308','Av. Petit Thouars # 600, Jesus Maria', '9'),
('67915408', 'Claudia', 'Nuñez Ortiz','nuñezortiz@gmail.com','935697419','Av. Ricardo Palma # 442, Jesus Maria', '8'),
('93512085', 'Tomas', 'Herrera Lozano','herreralozano@gmail.com','936708530','Av. Juan de Arona # 715, Jesus Maria', '5'),
('24837192', 'Carolina', 'Vega Ramirez','vegaramirez@gmail.com','937819641','Av. Arequipa # 1205, Lince', '9'),
('50738941', 'Alejandro', 'Cruz Navarro','cruznavarro@gmail.com','938920752','Av. 28 de Julio # 942, Lince', '9'),
('72601953', 'Beatriz', 'Molina Suarez','molinasuarez@gmail.com','939031863','Av. Aviacion # 1324, Lince', '10'),
('18392046', 'Fernando', 'Paredes Castaño','paredescastaño@gmail.com','940142974','Av. Petit Thouars # 575, Lince', '8'),
('95480127', 'Monica', 'Ramirez Castillo','ramirezcastillo@gmail.com','941253085','Av. Jose Galvez # 860, Lince', '8'),
('37521964', 'Oscar', 'Bravo Mendez','bravomendez@gmail.com','942364196','Av. La Marina # 303, Lince', '8'),
('64185703', 'Teresa', 'Lozano Peña','lozanopeña@gmail.com','943475207','Av. Arenales # 707, Lince', '5'),
('29073589', 'Ivan', 'Cordero Silva','corderosilva@gmail.com','944586318','Av. Enrique Meiggs # 412, Lince', '4'),
('86321094', 'Andrea', 'Peña Romero','peñaromero@gmail.com','945697429','Av. Bonsucesso # 937, Lince', '4'),
('17280491', 'Guillermo', 'Marquez Ortega','marquezortega@gmial.com','946708540','Av. San Borja Sur # 611, Surco', '4'),
('70958216', 'Paola', 'Salinas Herrera','salinasherrera@gmail.com','947819651','Av. El Polo # 1287, Surco', '5'),
('78012004','Fernando','Martinez Figueroa','martinezfigueroa@gmail.com','948920762','Av. Las Lomas # 367, Surco','7')

------------------------------------------
-- Insertar PEAs
------------------------------------------
INSERT INTO PEA VALUES
(1, 5, 'Embarque pequeño'),
(2, 15, 'Carga grande'),
(3, 10, 'Carga mediana'),
(4, 5, 'Embarque pequeño'),
(5, 10, 'Carga mediana'),
(6, 15, 'Carga grande'),
(7, 10, 'Carga mediana'),
(8, 5, 'Embarque pequeño'),
(9, 15, 'Carga grande'),
(10, 5, 'Embarque pequeño'),
(11, 10, 'Carga mediana'),
(12, 5, 'Embarque pequeño'),
(13, 15, 'Carga grande'),
(14, 10, 'Carga mediana'),
(15, 5, 'Embarque pequeño'),
(16, 15, 'Carga grande'),
(17, 10, 'Carga mediana'),
(18, 5, 'Embarque pequeño'),
(19, 15, 'Carga grande'),
(20, 10, 'Carga mediana'),
(21, 5, 'Embarque pequeño'),
(22, 15, 'Carga grande'),
(23, 5, 'Embarque pequeño'),
(24, 10, 'Carga mediana'),
(25, 15, 'Carga grande'),
(26, 5, 'Embarque pequeño'),
(27, 10, 'Carga mediana'),
(28, 15, 'Carga grande'),
(29, 5, 'Embarque pequeño'),
(30, 10, 'Carga mediana'),
(31, 15, 'Carga grande'),
(32, 5, 'Embarque pequeño'),
(33, 10, 'Carga mediana'),
(34, 15, 'Carga grande'),
(35, 5, 'Embarque pequeño'),
(36, 15, 'Carga grande'),
(37, 10, 'Carga mediana'),
(38, 5, 'Embarque pequeño'),
(39, 10, 'Carga mediana'),
(40, 15, 'Carga grande'),
(41, 5, 'Embarque pequeño'),
(42, 10, 'Carga mediana'),
(43, 15, 'Carga grande'),
(44, 5, 'Embarque pequeño'),
(45, 15, 'Carga grande'),
(46, 10, 'Carga mediana'),
(47, 5, 'Embarque pequeño'),
(48, 10, 'Carga mediana'),
(49, 15, 'Carga grande'),
(50, 5, 'Embarque pequeño');

------------------------------------------
-- Insertar Areas
------------------------------------------
INSERT INTO Area VALUES
('Aduanas'),('Cabina'),('Rampa');

------------------------------------------
-- Asignar trabajadores a areas
------------------------------------------
INSERT INTO Asignacion_Area (ID_Trabajador, Nombre_Area, Fecha) VALUES
(11,'Cabina','2025-03-01'),
(12,'Aduanas','2025-03-02'),
(13,'Rampa','2025-03-03'),
(14,'Cabina','2025-03-04'),
(15,'Cabina','2025-03-05'),
(16,'Rampa','2025-03-06'),
(17,'Cabina','2025-03-07'),
(18,'Cabina','2025-03-08'),
(19,'Rampa','2025-03-09'),
(20,'Cabina','2025-03-10'),
(21,'Cabina','2025-03-11'),
(22,'Rampa','2025-03-12'),
(23,'Aduanas','2025-03-13'),
(24,'Aduanas','2025-03-14'),
(25,'Rampa','2025-03-15'),
(26,'Rampa','2025-03-16'),
(27,'Rampa','2025-03-17'),
(28,'Aduanas','2025-03-18'),
(29,'Rampa','2025-03-19'),
(30,'Aduanas','2025-03-20'),
(31,'Aduanas','2025-03-21'),
(32,'Aduanas','2025-03-22'),
(33,'Aduanas','2025-03-23'),
(34,'Cabina','2025-03-24'),
(35,'Cabina','2025-03-25'),
(36,'Cabina','2025-03-26'),
(37,'Cabina','2025-03-27'),
(38,'Cabina','2025-03-28'),
(39,'Rampa','2025-03-29'),
(40,'Rampa','2025-03-30'),
(41,'Rampa','2025-03-31'),
(42,'Rampa','2025-04-01'),
(43,'Rampa','2025-04-02'),
(44,'Rampa','2025-04-03'),
(45,'Rampa','2025-04-04'),
(46,'Rampa','2025-04-05'),
(47,'Rampa','2025-04-06'),
(48,'Rampa','2025-04-07'),
(49,'Rampa','2025-04-08'),
(50,'Rampa','2025-04-09');

------------------------------------------
-- Insertar vuelos
------------------------------------------
INSERT INTO Vuelos (ID_Lider, Modelo_Avion, Capacidad, Tiempo_Aeronave)
VALUES 
(1, 'Airbus A320', 5, '3min'),
(1, 'Boeing 737-800', 10, '5min'),
(1, 'Airbus A319', 8, '10min'),
(1, 'Boeing 737 MAX 8', 12, '12min'),
(2, 'Airbus A321', 9, '7min'),
(2, 'Boeing 757', 11, '15min'),
(2, 'Boeing 737 MAX 9', 14, '20min'),
(2, 'Embraer 190', 6, '6min'),
(3, 'Boeing 787 Dreamliner', 15, '45min'),
(3, 'Airbus A350-900', 20, '1h'),
(3, 'Boeing 747-8', 22, '1h 30min'),
(4, 'Airbus A321neo', 5, '3min'),
(4, 'Boeing 777-200', 15, '1h'),
(4, 'Boeing 767-300', 12, '50min'),
(4, 'Embraer 175', 8, '25min'),
(5, 'Airbus A220', 9, '18min'),
(5, 'Boeing 737-900ER', 10, '20min'),
(5, 'Airbus A320neo', 11, '30min'),
(5, 'Airbus A321LR', 12, '35min'),
(6, 'Embraer E190', 7, '30min'),
(6, 'Boeing 737 Classic', 9, '25min'),
(6, 'Boeing 757-300', 18, '40min'),
(6, 'Airbus A310', 20, '45min'),
(7, 'Airbus A330-200', 14, '50min'),
(7, 'Boeing 777-300ER', 20, '1h 10min'),
(7, 'Boeing 737 MAX 9', 16, '30min'),
(8, 'Boeing 747-400', 25, '2h'),
(8, 'Airbus A380', 30, '3h'),
(8, 'Boeing 787-9', 22, '1h 40min'),
(8, 'Airbus A350-1000', 24, '1h 50min'),
(9, 'Boeing 737 MAX 9', 20, '2h'),
(9, 'Airbus A321neo', 12, '1h'),
(9, 'Airbus A319', 10, '40min'),
(9, 'Boeing 767-300ER', 15, '1h 20min'),
(10, 'Airbus A320', 5, '3min'),
(10, 'Boeing 737-700', 8, '5min'),
(10, 'Airbus A321neo', 10, '8min'),
(10, 'Embraer 175', 7, '6min');