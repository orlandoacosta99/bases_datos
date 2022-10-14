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





