-- Active: 1667224185022@@127.0.0.1@3316@testeoindices
CREATE table Personas(
    documentos VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(10),
    apellido VARCHAR(10)
);

CREATE TABLE Personas2(
    nombre VARCHAR(10)not null,
    apellido VARCHAR(10)not null,
    direccion VARCHAR(50),
    PRIMARY KEY(nombre, apellido)
);

INSERT into Personas2 VALUES ( 'Juan', 'Perez', 'Calle 45'),  ( 'Juan', 'Gomez', 'Calle 23');


CREATE TABLE Productos (idProductos int AUTO_INCREMENT PRIMARY KEY, codigo VARCHAR(10) not null UNIQUE,
                         nombre VARCHAR(10)not null, marca VARCHAR(10));


SELECT * FROM productos where idProductos>10 and codigos<'abdc';

CREATE Table Ventas(
	idVenta int AUTO_INCREMENT PRIMARY KEY, 
    idProducto int not null,
    cantidad int not null, 
    codigo VARCHAR(15), 
	Index CodigoVenta (codigo),
	Foreign Key (idProducto) REFERENCES Productos(idProducto)
);


CREATE TABLE Diccionario (
    palabra VARCHAR(50) PRIMARY KEY,
    significado text not null,
    fulltext (significado)
);


INSERT INTO Diccionario VALUES ('Hacha', 'Herramienta para cortar madera'), ('Auto', 'Vehiculo para transportar');


SELECT * FROM diccionario where Match(significado) against ('para');

