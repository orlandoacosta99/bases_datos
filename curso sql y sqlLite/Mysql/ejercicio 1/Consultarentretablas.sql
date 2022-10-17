select * from AdministracionCursos.materias;
select * from AdministracionCursos.asignaturas;

select Materias.Materia, Asignaturas.Asignatura
from Materias, Asignaturas
where Materias.idMateria = Asignaturas.Materiaasignatura;


-- union interna entre tablas

select Materias.Materia, Asignaturas.Asignatura
from Materias
INNER JOIN Asignaturas on Materias.idMateria = Asignaturas.Materiaasignatura;


select * from AdministracionCursos.cursos;


select Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso
from Materias, Asignaturas, cursos
where Materias.idmateria = asignaturas.materiaasignatura and Asignaturas.idAsignatura = Cursos.idCurso;


select Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso
from Materias
inner join Asignaturas on Materias.idmateria = asignaturas.materiaasignatura
inner join cursos on Asignaturas.idAsignatura = Cursos.idCurso;
inner join cursos on Asignaturas.idAsignatura = Cursos.idCurso;



select * from administracioncursos.inscripciones;
select * from administracioncursos.estudiantes;


select Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso, Estudiantes.Nombre, estudiantes.apellido
from Materias, Asignaturas, cursos,  estudiantes, inscripciones
where Materias.idmateria = asignaturas.materiaasignatura and 
	Asignaturas.idAsignatura = Cursos.asignaturaCurso and
    estudiantes.idEstudiante = inscripciones.estudianteInscrito;


select Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso, Estudiantes.Nombre, estudiantes.apellido
from Materias
INNER JOIN asignaturas ON Materias.idMateria = asignaturas.MateriaAsignatura 
INNER JOIN cursos ON Asignaturas.idAsignatura = Cursos.asignaturaCurso
INNER JOIN inscripciones ON cursos.idCurso = inscripciones.CursoInscrito
inner join estudiantes on estudiantes.idEstudiante = inscripciones.estudianteInscrito;



Select * from administracioncursos.asignaturas;

select Materias.materia, Asignaturas.asignatura
from materias, asignaturas
where materias.idMateria = Asignaturas.MateriaAsignatura;



Select Materias.materia, Asignaturas.asignatura
from materias
Left JOIN Asignaturas On Materias.idMAteria = Asignaturas.MateriaAsignatura;
--Inner JOIN Asignaturas On Materias.idMAteria = Asignaturas.MateriaAsignatura;
--Right JOIN Asignaturas On Materias.idMAteria = Asignaturas.MateriaAsignatura;


SELECT Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso
FROM Materias
LEFT JOIN Asignaturas On Materias.idMAteria = Asignaturas.MateriaAsignatura
LEFT JOIN Cursos On Asignaturas.idAsignatura = Cursos.AsignaturaCurso;

SELECT Materias.Materia, Asignaturas.Asignatura, Cursos.Nombre as Curso
FROM Materias
RIGHT JOIN Asignaturas On Materias.idMAteria = Asignaturas.MateriaAsignatura
RIGHT JOIN Cursos On Asignaturas.idAsignatura = Cursos.AsignaturaCurso;


Select * from administracioncursos.materias;

SELECT Materias.Materia, Asignaturas.Asignatura 
From Materias, Asignaturas
where Materias.idMATERIA = Asignaturas.MateriaAsignatura;


CREATE Table MateriasYAsignaturas(
    id int AUTO_INCREMENT,
    Materia VARCHAR(15),
    Asignatura VARCHAR(15),
    PRIMARY key(id)
);





