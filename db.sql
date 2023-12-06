DROP DATABASE IF EXISTS kompatas_db;
CREATE DATABASE kompatas_db;
USE kompatas_db;

CREATE TABLE usuario_admin (
    id_usuario_admin int primary key auto_increment,
    nombre varchar(45),
    apellido_paterno varchar(45),
    apellido_materno varchar(45),
    contrasena varchar(11),
    telefono varchar(11)
);

CREATE TABLE usuario_interesado (
    id_usuario_interesado int primary key auto_increment,
    nombre varchar(45),
    apellido_1 varchar(45),
    apellido_2 varchar(45),
    direccion varchar(100),
    correo varchar(45),
    contrasena varchar(11),
    telefono varchar(11)
);

CREATE TABLE refugio (
    id_refugio int primary key auto_increment,
    nombre_refugio varchar(30),
    tipo_refugio varchar(30),
    descripcion varchar(1000),
    estado varchar(45)
);

CREATE TABLE mascota (
    id_mascota int primary key auto_increment,
    tipo varchar(80),
    nombre_mascota varchar(80),
    color varchar(80),
    tamano varchar(30),
    peso decimal
);

CREATE TABLE adopcion (
    id_adopcion int primary key auto_increment,
    id_mascota int,
    id_usuario_interesado int,
    fecha date,
    estado varchar(45),
    nombre_mascota varchar(45),
    nombre_usuario varchar(45),
    direccion_usuario varchar(500),
    telefono_usuario varchar(11),
    FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota),
    FOREIGN KEY (id_usuario_interesado) REFERENCES usuario_interesado(id_usuario_interesado)
);

-- Insertar datos en la tabla usuario_admin
INSERT INTO usuario_admin (nombre, apellido_paterno, apellido_materno, contrasena, telefono)
VALUES
    ('Julio', 'Gallegos', 'Osorio', 'kompatas25', '9142458325'),
    ('Guadalupe', 'Escalante', 'Ramirez', 'kompatas26', '9142469435'),
    ('Emilio', 'Sanchez', 'Hernández', 'kompatas37', '9142471045'),
    ('Eduardo', 'Custodio', 'Aguilar', 'kompatas38', '9142481155'),
    ('Enrique', 'Jimenez', 'Ramos', 'kompatas39', '9142491265'),
    ('Ruben', 'Díaz', 'Mendez', 'kompatas40', '9142471045');

-- Insertar datos en la tabla usuario_interesado
INSERT INTO usuario_interesado (nombre, apellido_1, apellido_2, direccion, correo, contrasena, telefono)
VALUES
    ('Andrés', 'García', 'De la O', 'Calle Benito Juárez #14 Colonia las lomas', 'andres@gmail.com', 'kompatas12', '9372458325'),
    ('José', 'Gómez', 'Ramos', 'Calle Venustiano Carranza s/n Colonia Gil y Saenz', 'jose@gmail.com', 'kompatas13', '9372469435'),
    ('Carlos', 'Custodio', 'López', 'Calle Benito Juárez #14 Colonia las lomas', 'carlos@gmail.com', 'kompatas14', '9372471045'),
    ('Daniel', 'Cruz', 'Aguilar', 'Calle Rita Estrada #56 Colonia Boulevard', 'Daniel@gmail.com', 'kompatas15', '9372481155'),
    ('Andrea', 'Sanchez', 'Hernández', 'Calle Porfirio Díaz #43 Colonia el aguila', 'andrea@gmail.com', 'kompatas16', '9372491265'),
    ('Antonio', 'Hernández', 'Ocaña', 'Calle Andres Sanchez Magallanes s/n Colonia laa florida', 'antonio@gmail.com', 'kompatas17', '9372471045');

-- Insertar datos en la tabla refugio
INSERT INTO refugio (nombre_refugio, tipo_refugio, descripcion, estado)
VALUES
    ('FAPAM', 'Refugio de perros', 'Federación de Asociaciones Protectoras y de Defensa Animal', 'Tabasco'),
    ('ANAA', 'Refugio de perros', 'Asociación Nacional Amigos de los Animales', 'Tabasco'),
    ('Amigos del Perro', 'Refugio de perros', 'Trabajan desde 1995 en la recogida de animales abandonados y su reinserción en nuevas familias', 'Tabasco'),
    ('Kiwokoadopta', 'Refugio de perros', 'Trabaja para ayudar a los animales que no lo han tenido fácil', 'Tabasco'),
    ('ZarpasyColmillos', 'Refugio de perros', 'Brinda la opción de adoptar y colaborar con la asociación', 'Tabasco');

-- Insertar datos en la tabla mascota
INSERT INTO mascota (tipo, nombre_mascota, color, tamano, peso)
VALUES
    ('Alaskan Klee Kai', 'Rocky', 'Blanco con manchas negras', 'Mediano', 4.6),
    ('Rat Terrier', 'Teo', 'Blanco con manchas negras', 'Mediano', 4.1),
    ('Yorkipoo', 'Max', 'Negro', 'Chico', 3.4),
    ('Pomeranian', 'Leo', 'Café con destellos blancos', 'Chico', 2.5),
    ('Pumi', 'Nilo', 'Gris', 'Chico', 2.0),
    ('Bolonka', 'Lucas', 'Negro', 'Mediano', 3.2),
    ('Bichón frisé', 'Miki', 'Blanco', 'Mediano', 4.1),
    ('Alaskan Klee Kai', 'Luca', 'Blanco con manchas negras', 'Mediano', 4.6),
    ('Buldog', 'Zeus', 'Café', 'Mediano', 5.2),
    ('Dachshund', 'Toby', 'Negro con manchas café', 'Chico', 2.0),
    ('Pug', 'Rey', 'Blanco', 'Mediano', 4.8),
    ('Jack Russell Terrier', 'Zeus', 'Blanco con manchas marrones', 'Chico', 3.5);

-- Insertar datos en la tabla adopcion
INSERT INTO adopcion (id_mascota, id_usuario_interesado, fecha, estado, nombre_mascota, nombre_usuario, direccion_usuario, telefono_usuario)
VALUES
    (2, 3, '2022-04-16', 'En proceso', 'Teo', 'Carlos Custodio', 'Calle Benito Juárez #14 Colonia las lomas', '9372471045'),
    (7, 5, '2023-05-04', 'En proceso', 'Miki', 'Andrea Sanchez', 'Calle Porfirio Díaz #43 Colonia el aguila', '9372491265'),
    (10, 2, '2023-08-10', 'En proceso', 'Toby', 'José Gómez', 'Calle Venustiano Carranza s/n Colonia Gil y Saenz', '9372469435'),
    (1, 6, '2023-10-02', 'En proceso', 'Rocky', 'Antonio Hernández', 'Calle Andres Sanchez Magallanes s/n Colonia la florida', '9372471045'),
    (3, 4, '2023-08-18', 'En proceso', 'Max', 'Daniel Cruz', 'Calle Rita Estrada #56 Colonia Boulevard', '9372481155');
