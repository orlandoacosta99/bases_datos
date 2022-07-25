LOAD DATA Infile 'C:\\carpeta donde se localice' Into table Inscripciones;

--LOAD DATA Infile 'C:\\Users\\orlan\\Downloads\\CursosMySQL.txt' Into table Cursos;



CREATE TABLE Inscripciones (Materia varchar(30), Asignatura varchar(30), Nombre varchar(30), Apellido varchar(30), Documento varchar(15)); 

CREATE TABLE CURSOS (Asignatura text, Nombre varchar(30), Documento varchar(30), Nota TINYINT);



INSERT INTO Inscripciones VALUES('Matemática', 'Cálculo 1', 'Vladimir', 'Rodríguez', '123456');

INSERT INTO Inscripciones VALUES('Matemática', 'Cálculo 2', 'Vladimir', 'Caña', '456123');

INSERT INTO Inscripciones VALUES('Biología', 'Sistema Cardiovascular', 'Lorena', 'Cuello', '456987');

INSERT INTO CURSOS VALUES('Astrofísica', 'Astros masivos', 111111, 8);

INSERT INTO CURSOS VALUES('Ondas', 'Electromagnetismo', 11111123, 4);

INSERT INTO CURSOS VALUES('Estadística', 'Estadística 1', 1111113, 10);

INSERT INTO CURSOS VALUES('Bases de datos', 'MySQL', 1111114, 6);


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
