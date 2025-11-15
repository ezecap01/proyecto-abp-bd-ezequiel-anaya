create database CineABP
use CineABP;

CREATE TABLE Membresias (
    id_membresia INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    id_membresia INT NOT NULL,
    CONSTRAINT fk_Usuarios_Membresias 
        FOREIGN KEY (id_membresia) REFERENCES Membresias(id_membresia)
);
CREATE TABLE Tipos_Comidas (
    id_tipo_comida INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Comidas (
    id_comida INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    id_tipo_comida INT NOT NULL,
    CONSTRAINT fk_tipo_comida 
        FOREIGN KEY (id_tipo_comida) REFERENCES Tipos_Comidas(id_tipo_comida)
);

CREATE TABLE Salas (
    id_sala INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    capacidad INT NOT NULL CHECK (capacidad > 0)
);
CREATE TABLE Peliculas (
    id_pelicula INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL UNIQUE,
    duracion INT NOT NULL CHECK (duracion > 0)
);

INSERT INTO Membresias (nombre)
VALUES ('Gold'), ('Premium'), ('Común'), ('Plata'), ('Black');

INSERT INTO Usuarios (nombre, apellido, email, telefono, id_membresia)
VALUES
('Juan', 'Gómez', 'juan@gmail.com', '351222111', 1),
('Ana', 'Martínez', 'ana@gmail.com', '351999888', 2),
('Sara', 'Pérez', 'sara@gmail.com', '351111222', 3),
('Lucas', 'Rivas', 'lucas@gmail.com', '351333444', 4),
('Mario', 'López', 'mario@gmail.com', '351555666', 5);

INSERT INTO Tipos_Comidas (nombre)
VALUES ('Bebida'), ('Snack'), ('Combo'), ('Dulces'), ('Comida Rápida');

INSERT INTO Comidas (nombre, precio, stock, id_tipo_comida)
VALUES
('Coca Cola', 1500, 100, 1),
('Fanta', 1500, 100, 1),
('Pochoclo Salado', 2500, 60, 2),
('Pochoclo Dulce', 2600, 50, 2),
('Combo Familiar', 5000, 30, 3);

INSERT INTO Salas (nombre, capacidad)
VALUES ('1A', 40), ('2A', 50), ('3A', 60), ('4A', 70), ('5A', 80);

INSERT INTO Peliculas (titulo, duracion)
VALUES
('Avengers Endgame', 148),
('Avengers Infinity War', 149),
('Metegol', 106),
('Homo Argentum', 98),
('Spiderman 2', 127);

CREATE INDEX idx_Peliculas_titulo ON Peliculas(titulo);

CREATE INDEX idx_Comidas_tipo ON Comidas(id_tipo_comida);

CREATE INDEX idx_Usuarios_membresia ON Usuarios(id_membresia);
