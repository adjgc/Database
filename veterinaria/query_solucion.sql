-- SOLUCIÓN
-- OBTENER EL NOMBRE DE CADA PACIENTE Y LA LISTA DE TRATAMIENTOS (nombre y fecha de tratamiento) QUE HA TENIDO, ORDENAR ALFABÉTICAMENTE POR NOMBRE DEL PACIENTE,
select
    p.nombre_paciente,
    t.tipo_tratamiento,
    t.fecha_tratamiento
from paciente p
INNER JOIN tratamiento t on p.id_paciente = t.id_paciente
order by p.nombre_paciente asc;

-- OBTENER LA CANTIDAD TOTAL DE TRATAMIENTOS ASIGNADOS A UN MISMO PACIENTE ENTRE DOS FECHAS
select
    p.nombre_paciente,
    count(id_tratamiento) as total_tratamiento
from paciente p
inner join tratamiento t on p.id_paciente = t.id_paciente
where
    t.fecha_tratamiento between '2024-01-20' and '2024-04-02' and p.id_paciente = 5;

-- EL PACIENTE CON MAYOR CANTIDAD DE TRATAMIENTOS REALIZADOS
select
    p.nombre_paciente,
    count(id_tratamiento) as total_tratamiento
from paciente p
inner join tratamiento t on p.id_paciente = t.id_paciente
group by p.id_paciente
order by total_tratamiento desc
limit 1;