sqlite3 MiBase.db

CREATE TABLE Inscripciones (Materia varchar(30), Asignatura varchar(30), Nombre varchar(30), Apellido varchar(30), Documento varchar(15));

 select * from Inscripciones;


 
INSERT INTO Inscripciones VALUES('Matemática', 'Cálculo 1', 'Vladimir', 'Rodríguez', '123456');

INSERT INTO Inscripciones VALUES('Matemática', 'Cálculo 2', 'Vladimir', 'Caña', '456123');

INSERT INTO Inscripciones VALUES('Biología', 'Sistema Cardiovascular', 'Lorena', 'Cuello', '456987');
