-- SOLUCION
-- Listar todos los alumnos inscritos en el curso de "Guitarra Intermedio"
select  *
from alumno a, inscripcion i
where
    a.id_alumno = i.id_alumno
  and i.id_curso = (select c.id_curso from curso c where c.nombre = 'Guitarra Intermedio');

-- Mosrar todas las inscripciones realizadas después del 1 de marzo del 2026
select *
from inscripcion i
where i.fecha_inscripcion >= '2026-03-1';
-- Contar la cantidad de alumnos que han abandonado la inscripción
select count(a.id_alumno) as alumno_sin_curso
from alumno a
where
    a.id_alumno not in (
        select id_alumno
        from inscripcion i
        );
-- Listar los cursos disponibles para alumnos avanzados
select *
from curso c
where
    c.nivel_habilidad = 'Avanzado';

-- Listar los nombres y apellidos de los alumnos junto con los nombres de los cursos a los que están inscritos
select
    a.nombre,
    a.apellido,
    c.nombre
from alumno a
inner join inscripcion i on a.id_alumno = i.id_inscripcion
inner join curso c on i.id_curso = c.id_curso;
-- Mostrar el nombre del curso y la cantidad de alumnos inscritos en cada curso
select
    c.nombre,
    count(i.id_curso) as total_alumnos_inscritos
from curso c
inner join inscripcion i on c.id_curso = i.id_curso
group by i.id_curso;

-- Listar el nombre y apellido de los alumnos que no han pagado su inscripcion, sin importar el curso
select
    a.nombre,
    a.apellido
from alumno a
inner join inscripcion i on a.id_alumno = i.id_alumno and i.abono_inscripcion = false;
-- Obtener el nombre de los cursos que tienen al menos un alumno menor a 10 años inscrito
select
    c.nombre
from
    curso c
inner join inscripcion i on c.id_curso = i.id_curso
inner join alumno a on i.id_alumno = a.id_alumno and a.edad < 10;
-- Listar el nombre y apellido de los alumnos junto con los nombres de los cursos que están inscritos, pero solo para
-- aquellos que se inscribieron en febrero del 2026
select
    a.nombre,
    a.apellido,
    c.nombre
from
    alumno a
inner join inscripcion i on a.id_alumno = i.id_alumno and i.fecha_inscripcion between '2026-01-31' and '2026-03-01'
inner join curso c on i.id_curso = c.id_curso;
