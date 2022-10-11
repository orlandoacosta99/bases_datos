create database AdministracionCursos; 

/*seleccionamos la base que vamos a utilizar*/
use AdministracionCursos; 

/*creacion de las 5 tablas*/
CREATE TABLE IF NOT EXISTS Materias 
(   
    idMateria INTEGER Primary KEY AUTOINCREMENT,
    Materia TEXT   
); 

CREATE TABLE IF NOT EXISTS Asignaturas 
(
    idAsignatura INTEGER Primary KEY AUTOINCREMENT,
    Asignatura TEXT not null UNIQUE,
    MateriaAsignatura INTEGER not null, 
    foreign key (MateriaAsignatura) references Materias(idMateria)
); 

create table Cursos
(
    idCurso INTEGER Primary KEY AUTOINCREMENT,
    Nombre TEXT not null,
    AsignaturaCurso INTEGER not null, 
    foreign key (AsignaturaCurso) references Asignaturas (idAsignatura)
); 

create table Estudiantes (
    idRstudiante INTEGER Primary KEY AUTOINCREMENT,
    Documento TEXT not null UNIQUE,
    Nombre TEXT not null, 
    Apellido TEXT not null,
    FechaNacimiento TEXT, 
    Edad INTEGER, 
    FechaIngreso TEXT
); 

create table InscripcionesCursos
(
    idInscripcionesCurso INTEGER Primary KEY AUTOINCREMENT,
    EstudianteInscrito INTEGER not null, 
    CursoInscrito INTEGER not null,     
    foreign key (EstudianteInscrito) references Estudiantes (idEstudiante), 
    foreign key (CursoInscrito) references Cursos(idCurso)
); 

/*Ingresando datos a las tablas */

UPDATE Materias SET Materia= 'Informatica';


select * from marterias;

.mode column
.header on

--Inserciones en sql lite

Insert INTO Asignaturas (Asignatura, MateriaAsignatura) values ('Cálculo 1', 1);
 
Insert into Cursos (Nombre, asignaturacurso) values  ('Java', 1); 


insert into estudiantes (documento, Nombre,Apellido, Edad, FechaIngreso) 
values( '123545654', 'Vladimir', 'Rodriguez', 32, date('now'));

insert into InscripcionesCursos (EstudianteInscrito, CursoInscrito) 
values ( last_insert_rowid(),1); 



/*mirar los datos de las tablas*/


select Materias.Materia, Asignaturas.asignatura, Cursos.Nombre as curso, Estudiantes.Documento, Estudiantes.Nombre, Estudiantes.Apellido 
    from Materias, asignaturas, cursos, InscripcionesCursos, estudiantes
    where Materias.idmateria = asignaturas.materia_asignatura and asignaturas.idasignatura =cursos.asignaturacurso and  
          cursos.idCurso = inscripciones.CursoInscrito and  estudiantes.idestudiante = InscripcionesCursos.EstudianteInscrito; 

 


