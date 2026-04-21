create schema gimnasio collate utf8mb4_spanish_ci;

use gimnasio;

create table socios(
    id_socio INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(255) not null,
    fecha_registro date not null default (current_date)
);

create table clases(
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(255) not null,
    horario time not null
);

create table socios_clases(
    id_socios_clases INT PRIMARY KEY AUTO_INCREMENT,
    id_socio INT NOT NULL,
    id_clase INT NOT NULL,
    fecha_inscripcion DATE NOT NULL default (CURRENT_DATE),
    FOREIGN KEY (id_socio) references socios(id_socio),
    FOREIGN KEY (id_clase) references clases(id_clase)
);

INSERT INTO clases (nombre, horario) VALUES
('Cardio Principante', '10:00:00'),
('Cardio Intermedio', '09:00:00'),
('Cardio Avanzado', '08:00:00'),
('Box Principante', '07:00:00'),
('Box Intermedio', '06:00:00'),
('Box Avanzado', '05:00:00'),
('Yoga Principante', '12:00:00'),
('Yoga Intermedio', '11:00:00'),
('Yoga Avanzado', '13:00:00');

DELIMITER //

CREATE PROCEDURE PoblarGimnasio()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT;
    DECLARE num_clases_inscritas INT;
    DECLARE _nombre VARCHAR(255);
    DECLARE _fecha_registro DATE;
    DECLARE _id_socio_actual INT;
    DECLARE _id_clase_aleatoria INT;

    WHILE i <= 100 DO
        SET _nombre = CONCAT(ELT(FLOOR(1 + (RAND() * 10)), 'Juan', 'Maria', 'Pedro', 'Ana', 'Luis', 'Elena', 'Diego', 'Lucia', 'Carlos', 'Sofia'), ' ', ELT(FLOOR(1 + (RAND() * 10)), 'Gomez', 'Lopez', 'Perez', 'Rodriguez', 'Garcia', 'Martinez', 'Sanchez', 'Romero', 'Diaz', 'Torres'));
        SET _fecha_registro = DATE_ADD('2026-01-01', INTERVAL FLOOR(RAND() * 90) DAY);

        INSERT INTO socios (nombre, fecha_registro) VALUES (_nombre, _fecha_registro);

        SET _id_socio_actual = LAST_INSERT_ID();

        SET num_clases_inscritas = FLOOR(1 + (RAND() * 3));
        SET j = 1;

        WHILE j <= num_clases_inscritas DO
            SET _id_clase_aleatoria = FLOOR(1 + (RAND() * 9));

            INSERT IGNORE INTO socios_clases (id_socio, id_clase, fecha_inscripcion)
            VALUES (_id_socio_actual, _id_clase_aleatoria, _fecha_registro);

            SET j = j + 1;
        END WHILE;

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

call PoblarGimnasio();
-- drop PROCEDURE PoblarGimnasio;

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