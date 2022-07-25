create database tarea1;

use tarea1;

create table Materias
(
	id_Materia int (11) not null auto_increment, 
	Materia varchar(45) not null unique,
	Eliminado tinyint(4), 
	primary key (id_Materia)
); 

create table Asignaturas
(
	id_Asignatura int(11) not null auto_increment, 
	Nombre_Asignatura varchar(45) not null, 
	Materia_Asignatura int (11) not null,
	Eliminado tinyint (4), 
	primary key (id_Asignatura), 
	foreign key (Materia_Asignatura) references Materias(id_Materia)
); 

create table Cursos
(
    id_Curso int not null auto_increment, 
    Nombre_cURSO varchar(45) not null, 
    Docente int (11) not null, 
    Puntaje int(11),
    Asignatura_Curso int (11) not null,
    Edificio int (11),
    Anno int(11),
    Eliminado tinyint (4), 
    Estado_ENUM VARCHAR(30) NOT NULL, 
    primary key (id_Curso), 
    foreign key (Asignatura_Curso) references Asignaturas (id_Asignatura), 
    foreign key (Docente) references Docentes (id_Docente)
); 
create table Docentes (
    id_Docente int not null auto_increment, 
    Documento varchar(15) not null unique, 
    Nombre_Docente varchar(30), 
    Apellido_Docente varchar(30), 
    Fecha_Nacimiento date, 
    Edad smallint, FechaIngreso Date,
    Fecha_Ingreso date,
    Eliminado Tinyint (4), 
    Primary key (id_Docente)
); 
create table Inscripciones 
(
    id_Inscripcion_Curso int not null auto_increment, 
    Estudiante_Inscrito int not null, 
    Curso_Inscrito int not null, 
    Estado ENUM VARCHAR (30),
    Nota SMALLINT(6) not null,
    Eliminado TINYINT (4),
    Primary key (id_Inscripciones_Curso), 
    foreign key (Estudiante_Inscrito) references Estudiantes (id_Estudiante), 
    foreign key (Curso_Inscrito) references Cursos(id_curso)
); 
create table Estudiantes (
    id_Estudiante int not null auto_increment, 
    Documento varchar(15) not null unique, 
    Nombre_Estudiante varchar(30), 
    Apellido_Estudiante varchar(30), 
    Fecha_Nacimiento date, 
    Edad smallint, 
    FechaIngreso Date, 
     Eliminado Tinyint (4), 
    Primary key (id_Estudiante)
); 
create table Rediciones_Examen (
    id_Redicion_Examen int not null auto_increment, 
    Examen_Nota int (11) not null, 
    Inscripcion_Nota int (11) not null,  
    Nota smallint (6), 
    Eliminado Tinyint (4),
    Primary key (id_Redicion_Examen),
    foreign key (Inscripcion_Nota) references Inscripciones(id_Inscripcion_Curso),
    foreign key (Examen_Nota) references Examenes(id_Examen)

); 

create table Examenes (
    id_Examen int not null auto_increment, 
    Curso int (11) not null, 
    Fecha date, 
    Eliminado Tinyint (4),
    Primary key (id_Examen),
    foreign key (Curso) references Cursos(id_Curso)
); 



