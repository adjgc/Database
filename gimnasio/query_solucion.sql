-- Ejercicios
-- 1. Obtener el nombre de todos los socios ordenados de la Z a la A.
select s.nombre from socios s order by s.nombre desc;

-- 2. ¿Cuántas clases ofrece el gimnasio en total?
select count(c.id_clase) from clases c;

-- 3. Obtener el nombre de todas las clases que se imparten antes de las 09:00:00
select c.nombre, c.horario from clases c where c.horario < '09:00:00';

-- 4. Obtener el nombre del socio, el nombre de la o las clases en las que está inscrito y la fecha que se inscribió.
select
    s.id_socio,
    s.nombre,
    c.id_clase,
    c.nombre,
    sc.fecha_inscripcion,
    sc.id_socio,
    sc.id_clase
from socios s
RIGHT JOIN socios_clases sc on s.id_socio = sc.id_socio
RIGHT JOIN clases c on c.id_clase = sc.id_clase;

-- 5. Listar el nombre de todos los socios que estén inscritos exclusivamente en Cardio Avanzado
select
    s.nombre,
    c.nombre
from socios s
INNER JOIN socios_clases sc on s.id_socio = sc.id_socio
INNER JOIN clases c on c.id_clase = sc.id_clase
AND c.id_clase = (
    SELECT c2.id_clase
    FROM clases c2
    WHERE c2.nombre = 'Cardio Avanzado'
        );

-- 6. Tomar un ID de socio al azar, mostrar su nombre, el nombre de la clase y el horario de las clases en las que está inscrito.
SELECT
    s.id_socio,
    s.nombre,
    c.nombre,
    c.horario
FROM socios s
INNER JOIN socios_clases sc on s.id_socio = sc.id_socio
INNER JOIN clases c on sc.id_clase = c.id_clase
AND s.id_socio = 4;-- FLOOR(1 + RAND()*100);

-- 7. Obtener el nombre de cada clase y cuántos socios tiene inscritos, ordenar de la más llena a la más vacía.
SELECT
    c.nombre,
    count(sc.id_socios_clases) as inscritos
FROM clases c
JOIN socios_clases sc on c.id_clase = sc.id_clase
group by c.nombre
order by inscritos desc;

-- 8. Encuentra el nombre de todos los socios que se han inscrito en más de 2 clases.
SELECT
    s.nombre,
    count(sc.id_socio) as num_clases_inscritas
FROM socios s
JOIN socios_clases sc on s.id_socio = sc.id_socio
group by s.id_socio
HAVING num_clases_inscritas > 2;

-- 9. Contar el número de socios inscrítos en todas las clases de nivel 'Avanzado'.
SELECT
    c.nombre,
    count(sc.id_socio)
FROM socios_clases sc
JOIN clases c on c.id_clase = sc.id_clase
WHERE c.nombre like '%AVANZADO%'
GROUP BY c.id_clase;

-- 10. Encontrar a los socios (si existen) que estén inscritos en el gimnasio pero no se hayan registrado a ninguna clase.
SELECT
    s.nombre
FROM socios s
WHERE
    s.id_socio not in (SELECT sc.id_socio FROM socios_clases sc);

INSERT INTO socios (nombre, fecha_registro) VALUES ('Emilia Pérez', '2026-05-01');