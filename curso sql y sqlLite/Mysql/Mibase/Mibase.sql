CREATE DATABASE MiBase; 

  

CREATE TABLE Inscripciones (Materia varchar(30), Asignatura varchar(30), Nombre varchar(30), Apellido varchar(30), Documento varchar(15)); 


 CREATE TABLE CURSOS (Asignatura varchar(30), Nombre varchar(30), Documento varchar(30), Nota TINYINT);


-- Para mirar los campos  

Describe TABLE Inscripciones; 

select * from Inscripciones; 

-- agregamos datos 

INSERT INTO Inscripciones VALUES('Matemática', 'Cálculo 1', 'Vladimir', 'Rodríguez', '123456');

INSERT INTO Inscripciones VALUES('Matemática', 'Cálculo 2', 'Vladimir', 'Caña', '456123');

INSERT INTO Inscripciones VALUES('Biología', 'Sistema Cardiovascular', 'Lorena', 'Cuello', '456987');


INSERT INTO CURSOS VALUES('Astrofísica', 'Astros masivos', 111111, 8);

INSERT INTO CURSOS VALUES('Ondas', 'Electromagnetismo', 11111123, 4);

INSERT INTO CURSOS VALUES('Estadística', 'Estadística 1', 1111113, 10);

INSERT INTO CURSOS VALUES('Bases de datos', 'MySQL', 1111114, 6);


--ORGANIZAR DATOS
 .header on

 .mode column

-- Insercion masiva de archivos 

-- realizamos la incercion por comando
 .import "C:\\Users\\orlan\\Downloads\\InscripcionesMySQL.txt" Inscripciones
 .import "C:\\SQLite\\h\\CursosSQLite.txt" Cursos

 
--- filtro de seleccion

SELECT Nombre, Apellido, Documento FROM Inscripciones;


SELECT Nombre, Apellido FROM Inscripciones
ORDER BY Nombre, Apellido;

--order by ayuda a ordenar 

SELECT Nombre FROM Inscripciones
ORDER BY Nombre;

-- distinct ayuda a quitar los dUPICADOS    

SELECT distinct Nombre FROM Inscripciones
ORDER BY Nombre;

