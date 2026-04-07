-- SOLUCIÓN
-- CONTAR LA CANTIDAD TOTAL DE PARTICIPANTES
select count(id_participante) as total_participantes from participante;
-- OBTENER LA LISTA COMPLETA DE TODOS LOS PARTICIPANTES
select * from participante;
-- OBTENER LA LISTA COMPLETA DE TODAS LAS CATEGORIAS
select * from categoria;
-- OBTENER LA CANTIDAD DE PARTICIPANTES MUJERES, SIN IMPORTAR LA CATEGORIA
select COUNT(*) as total_mujeres_participantes from participante where sexo = 'F';
-- OBTENER EL NOMBRE Y APELLIDO DE LOS INSCRITOS EN LA CATEGORIA "CABALLEROS B"
select
    p.nombre,
    p.apellido,
    c.nombre
from participante p
inner join inscripcion i on p.id_participante = i.id_participante
inner join categoria c on i.id_categoria = c.id_categoria and c.nombre = 'Caballeros B';
-- OBTENER LOS DATOS DE LOS PARTICIPANTES QUE TENGAN ENTRE 25 Y 37 AÑOS, SIN IMPORTAR EL GENERO
select * from participante
where edad between 25 and 37;
-- OBTENER LA LISTA COMPLETA DE INSCRIPCIONES, ESPECIFICANDO EL NOMBRE Y APELLIDO DE CADA UNO DE LOS INSCRITOS, SIN IMPORTAR LA CATEGORIA
select
    p.nombre,
    p.apellido,
    i.id_inscripcion,
    i.abono_inscripcion,
    i.fecha_inscripcion
from participante p
inner join inscripcion i on p.id_participante = i.id_participante;