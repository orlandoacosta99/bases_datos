create database Ejemplo1; 

/*seleccionamos la base que vamos a utilizar*/
use ejemplo1;

/*creacion de las 5 tablas*/
create table Materias (id_materia int not null auto_increment, Materia varchar(30) not null unique, primary key (id_materia)); 

create table Asignaturas (id_Asignatura int not null auto_increment, asignatura varchar(30) not null, materia_asignatura int not null, primary key (id_asignatura), foreign key (materia_asignatura) references Materias(id_materia)); 

create table Cursos (id_Curso int not null auto_increment, Nombre varchar(30) not null, asignatura_curso int not null, primary key (id_curso), foreign key (asignatura_curso) references Asignaturas (id_asignatura)); 

create table Estudiantes (id_estudiante int not null auto_increment, Documento varchar(15) not null unique, Nombre varchar(30), Apellido varchar(30), Fecha_Nacimiento date, Edad smallint, FechaIngreso Date, Primary key (id_estudiante)); 

create table Inscripciones (id_inscripciones_curso int not null auto_increment, Estudiante_Inscrito int not null, Curso_Inscrito int not null, Primary key (id_inscripciones_curso), foreign key (Estudiante_Inscrito) references Estudiantes (id_estudiante), foreign key (Curso_Inscrito) references Cursos(id_curso)); 

/*Ingresando datos a las tablas */
Insert INTO Asignaturas (Asignatura, Materia_Asignatura) values ('Cálculo 1', 1), ('Geometria', 1), ('Programacion', 2); 

Insert into Cursos(Nombre, asignatura_curso) values ('Cálculo complejos', 1), ('Java', 3), ('Pascal', 3); 

insert into inscripciones(Estudiante_Inscrito, Curso_Inscrito) values ( last_insert_id(), 1); 

insert into estudiantes (documento, Nombre,Apellido, Edad, FechaIngreso) values( '123545654', 'Vladimir', 'Rodriguez', 32, curdate()), ('1235452353', 'Juan', 'Rodriguez', 32, curdate());

insert into inscripciones(Estudiante_Inscrito, Curso_Inscrito) values ( last_insert_id(), 2); 

/*mirar los datos de las tablas*/
select id_Adignatura, Asignatura from Asignaturas;

select Asignaturas.id_asignatura, Asignaturas.asignatura from Asignaturas; 

Select Materias.Materia Materias.Materia, Asignaturas.Asignatura from Materias, Asignaturas where Materias.id_materia =  Asignaturas.materia_asignatura; 

Select Materias.id_Materia, Materias.Materia, Asignaturas.id_Asignatura, Asignaturas.Asignatura from Materias, Asignaturas where Materias.id_materia =  Asignaturas.materia_asignatura; 

Select Materias.id_Materia, Materias.Materia, Asignaturas.id_Asignatura, Asignaturas.Asignatura from Materias, Asignaturas where Materias.id_materia =  Asignaturas.materia_asignatura order by Materia, Asignatura; 

Select  Materias.Materia,  Asignaturas.Asignatura, Cursos.Nombre from Materias, Asignaturas, Cursos  where Asignaturas.materia_asignatura = Materias.id_materia and Cursos.asignatura_curso = Asignaturas.id_asignatura; 

select Materias.Materia, count(*) from Materias, Asignaturas  where  asignaturas.materia_asignatura = Materias.id_materia group by materias.Materia; 

select Materias.Materia,Asignaturas.Asignatura from Materias, Asignaturas  where  Materias.id_materia = asignaturas.materia_asignatura; 

select * from estudiantes; 

select Materias.Materia, Asignaturas.asignatura, Cursos.Nombre as curso, Estudiantes.Documento, 
Estudiantes.Nombre, Estudiantes.Apellido from Materias, asignaturas, cursos, inscripciones, estudiantes
where Materias.id_materia = asignaturas.materia_asignatura and  asignaturas.id_asignatura =cursos.asignatura_curso and  
cursos.id_Curso = inscripciones.Curso_Inscrito and  estudiantes.id_estudiante = inscripciones.Estudiante_Inscrito; 

 


