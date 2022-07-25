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

--order by ayuda a ordenar de forma asendente 

SELECT Nombre FROM Inscripciones
ORDER BY Nombre;

-- distinct ayuda a quitar los dUPICADOS    

SELECT distinct Nombre FROM Inscripciones
ORDER BY Nombre;


--order by ayuda a ordenar de forma decendente

SELECT Nombre, Apellido FROM Inscripciones
ORDER BY Nombre desc, Apellido ASC;

--- ORDENAR FILTRO

SELECT * FROM Inscripciones 
wHERE Materia = 'Matematica';

SELECT * FROM Inscripciones 
wHERE Materia = 'Matematica' and Asignatura = ' Algebra Lineal';

SELECT * FROM Inscripciones 
wHERE (Materia = 'Matematica' and Asignatura = ' Algebra Lineal')
Or Materia = 'Fisica';

-- seleciona los estudiantes de la nota sea >=8 y que sea la asignatura programacion


SELECT * FROM Cursos
wHERE Nota>=8 AND asignatura = 'Programacion';



SELECT * FROM Cursos
wHERE Nota>=8 AND (Asignatura = 'Programacion' 
or Asignatura = 'Termodinamica');


SELECT * FROM Cursos
wHERE (Nota>=9 AND Asignatura = 'Programacion') 
or (Nota <=3 AND Asignatura = 'Termodinamica');

--- cosultar asignatura con auto completado %% son comodines

SELECT * FROM Cursos
wHERE Asignatura Like 'Prog%';


SELECT * FROM Cursos
wHERE Asignatura Like '%am%';


-- consulta de un limite de resultados 


SELECT * FROM Inscripciones 
Limit 10;




