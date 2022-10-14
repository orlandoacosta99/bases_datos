create database AdministracionCursos; 

/*seleccionamos la base que vamos a utilizar*/
use AdministracionCursos; 

/*creacion de las 5 tablas*/
create table materias 
(   
    idMateria int not null auto_increment,
    Materia varchar(30) not null unique, 
    Primary key (idMateria)
); 

create table asignaturas 
(
    idAsignatura int not null auto_increment,
    Asignatura varchar(30) not null,
    MateriaAsignatura int not null, 
    primary key (idAsignatura), 
    foreign key (MateriaAsignatura) references Materias(idMateria)
); 

create table cursos
(
    idCurso int not null auto_increment, 
    Nombre varchar(30) not null, 
    AsignaturaCurso int not null, 
    primary key (idCurso), 
    foreign key (AsignaturaCurso) references Asignaturas (idAsignatura)
); 

create table estudiantes (
    idEstudiante int not null auto_increment, 
    Documento varchar(15) not null unique, 
    Nombre varchar(30), Apellido varchar(30), 
    FechaNacimiento date, 
    Edad smallint, FechaIngreso Date, Primary key (idEstudiante)
); 

create table inscripciones 
(
    idInscripcionesCurso int not null auto_increment, 
    EstudianteInscrito int not null, 
    CursoInscrito int not null, 
    Primary key (idInscripcionesCurso), 
    foreign key (EstudianteInscrito) references Estudiantes (idEstudiante), 
    foreign key (CursoInscrito) references Cursos(idCurso)
); 

/*Ingresando datos a las tablas */


INSERT INTO Materias (Materia) VALUES ('Informatica'),('Matematica'); 
/* visualizamos la tabla*/
select *  from Materias;

Insert INTO Asignaturas 
(Asignatura, MateriaAsignatura) values ('Cálculo 1', 1), ('Geometria', 1), ('Programacion', 2); 

select *  from Asignaturas;


-- si queremos ver el nombre de la asignatura

Select Asignaturas.asignatura from Asignaturas;

-- id y nombre 

select idAsignatura, asignatura  from Asignaturas;
-- o se puede utilizar asi select Asignaturas.idAsignatura, Asignaturas.asignatura  from Asignaturas;

-- visualizar marterias y asignaturas 

select Materias.Materia, Asignaturas.Asignatura 
from Materias, Asignaturas
where  Asignaturas.materiaAsignatura = Materias.idMateria;

-- visualizacion con id
Select Materias.idMateria, Materias.Materia, Asignaturas.idAsignatura, Asignaturas.Asignatura 
from Materias, Asignaturas 
where Materias.idMateria = Asignaturas.materiaAsignatura; 

 
-- ordenando los datos
Select Materias.idMateria, Materias.Materia, Asignaturas.idAsignatura, Asignaturas.Asignatura 
from Materias, Asignaturas 
where Materias.idMateria =  Asignaturas.materiaAsignatura 
order by Materia, Asignatura; 

 

--- Ingreso de los datos cursos 
Insert into Cursos
(Nombre, asignaturacurso) values ('Cálculo complejos', 1), ('Java', 3), ('Pascal', 3); 

-- Busqueda de 3 tablas 

Select  Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso from Materias, Asignaturas, Cursos  
where Asignaturas.materiaAsignatura = Materias.idMateria and Cursos.asignaturaCurso = Asignaturas.idAsignatura; 


-- BUSQUEDAS  

select Materias.Materia, count(*) from Materias, Asignaturas  
where asignaturas.materiaAsignatura = Materias.idMateria group by materias.Materia; 

-- Rectificamos que sea verdadero 
Select  Materias.Materia, Asignaturas.Asignatura from Materias, Asignaturas
where Asignaturas.materiaAsignatura = Materias.idMateria

-- contar la cantidad de asignaturas
select Materias.Materia, count(*) as 'Cantidad Asignaturas' from Materias, Asignaturas
where Materias.idMateria = Asignaturas.MateriaAsignatura
Group by  Materias.Materia;


-- funcion de curdate de nos indica el dia, año y mes actual


insert into estudiantes (documento, Nombre, Apellido, Edad, FechaIngreso) 
values( '123545654', 'Vladimir', 'Rodriguez', 32, curdate()), ('1235452353', 'Juan', 'Rodriguez', 32, curdate());

select * from estudiantes;

-- inscribimos al estudiante mediante el ultimo inscrito

insert into inscripciones
(EstudianteInscrito, CursoInscrito) values ( last_insert_id(), 1); 

select * from inscripciones;

insert into inscripciones
(EstudianteInscrito, CursoInscrito) values ( last_insert_id(), 2); 

/*mirar los datos de las tablas*/

select idAdignatura, Asignatura 
    from Asignaturas;

select Asignaturas.idasignatura, Asignaturas.asignatura 
    from Asignaturas; 

Select Materias.Materia Materias.Materia, Asignaturas.Asignatura 
    from Materias, Asignaturas 
    where Materias.idmateria =  Asignaturas.materiaAsignatura; 

Select Materias.idMateria, Materias.Materia, Asignaturas.idAsignatura, Asignaturas.Asignatura 
    from Materias, Asignaturas 
    where Materias.idmateria =  Asignaturas.materiaasignatura; 

Select Materias.idMateria, Materias.Materia, Asignaturas.idAsignatura, Asignaturas.Asignatura 
    from Materias, Asignaturas 
    where Materias.idMateria =  Asignaturas.materiaasignatura 
    order by Materia, Asignatura; 

Select  Materias.Materia,  Asignaturas.Asignatura, Cursos.Nombre 
    from Materias, Asignaturas, Cursos 
    where Asignaturas.materiaasignatura = Materias.idmateria and Cursos.asignaturacurso = Asignaturas.idasignatura; 

select Materias.Materia, count(*) 
    from Materias, Asignaturas  
    where  asignaturas.materiaasignatura = Materias.idmateria 
    group by materias.Materia;

select Materias.Materia,Asignaturas.Asignatura 
    from Materias, Asignaturas  
    where  Materias.idmateria = asignaturas.materiaasignatura; 

select * from estudiantes; 

select Materias.Materia, Asignaturas.asignatura, Cursos.Nombre as curso, Estudiantes.Documento, Estudiantes.Nombre, Estudiantes.Apellido 
    from Materias, asignaturas, cursos, inscripciones, estudiantes
    where Materias.idmateria = asignaturas.materiaasignatura and asignaturas.idasignatura =cursos.asignaturacurso and  
          cursos.idCurso = inscripciones.CursoInscrito and  estudiantes.idestudiante = inscripciones.EstudianteInscrito; 





