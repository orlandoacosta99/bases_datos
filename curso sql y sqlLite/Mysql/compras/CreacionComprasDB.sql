CREATE DATABASE ComprasDB;

USE ComprasDB;

-- SI EXISTE LA TABLA
DROP TABLE IF EXISTS Personas;
DROP TABLE IF EXISTS ComprasPersonas;
DROP TABLE IF EXISTS Productos;

--creamos las tablas 

--ahora si existe la base se utiliza asi

CREATE TABLE IF NOT EXIST Personas
(
    idPersona INT AUTO_INCREMENT,
    Nombre VARCHAR(15),
    Apellido VARCHAR(15),
    Documento VARCHAR(15) UNIQUE, 
    PRIMARY KEY(idPersona)
);

CREATE table IF NOT EXIST Productos (
    idProducto INT AUTO_INCREMENT, 
    Nombre VARCHAR(20),
    Codigo VARCHAR(30) not null,
    Precio DECIMAL,
    PRIMARY key(idProducto)
);
CREATE Table IF NOT EXIST ComprasPersonas( 
    idComprasPersona int AUTO_INCREMENT,
    idPersona int not NULL, 
    idProducto int not null, 
    Cantidad int DEFAULT(1) not null,
    Monto DECIMAL, 
    PRIMARY KEY (idComprasPersona),
    Foreign Key (idPersona) REFERENCES Personas(idPersona),
    Foreign Key (idProducto) REFERENCES Productos(idProducto)
);


INSERT INTO Personas (Nombre,Apellido,Documento) VALUES
('Vladimir','Rodriguez','2250'),
('Analía', 'Romero', '455'),
('Marta','Smith','987');



INSERT INTO Productos (Nombre, Codigo, Precio) VALUES
('Harina', '78987', '12.5'),
('Leche', '987', '32.9');

SELECT @PersonaID := Personas.idPersona from Personas where Nombre='Analía';

SELECT @ProductoID := Productos.idProducto, @ProductoPrecio := Productos.Precio
from Productos where Productos.Codigo ='78987';


INSERT INTO ComprasPersonas( idPersona, idProducto, Cantidad, Monto) VALUES
( @PersonaID, @ProductoID, 3, 3 * @ProductoPrecio);


