create schema escuela_musica collate utf8mb4_spanish_ci;

use escuela_musica;

create table alumno
(
    id_alumno  int auto_increment primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    edad int not null,
    direccion varchar(50) not null,
    telefono varchar(10) not null,
    email varchar(50) not null
);

create table curso
(
  id_curso int auto_increment primary key,
  nombre varchar(30) not null,
  nivel_habilidad varchar(15) not null,
  tipo_instrumento varchar(20) not null
);

create table inscripcion
(
    id_inscripcion int auto_increment primary key,
    fecha_inscripcion date not null,
    abono_inscripcion boolean not null,
    id_alumno int not null,
    id_curso int not null,
    constraint fk_id_alumno foreign key (id_alumno) references alumno (id_alumno),
    constraint fk_id_curso foreign key (id_curso) references curso (id_curso)
);

-- 1. Insertar los Cursos
INSERT INTO curso (nombre, nivel_habilidad, tipo_instrumento) VALUES
('Guitarra Principiante', 'Principiante', 'Cuerda'),
('Guitarra Intermedio', 'Intermedio', 'Cuerda'),
('Guitarra Avanzado', 'Avanzado', 'Cuerda'),
('Piano Principiante', 'Principiante', 'Teclado'),
('Piano Intermedio', 'Intermedio', 'Teclado'),
('Piano Avanzado', 'Avanzado', 'Teclado'),
('Violín Principiante', 'Principiante', 'Cuerda'),
('Violín Intermedio', 'Intermedio', 'Cuerda'),
('Violín Avanzado', 'Avanzado', 'Cuerda');

-- 2. Procedimiento para población aleatoria
DELIMITER //

CREATE PROCEDURE PoblarEscuelaMusica()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre VARCHAR(30);
    DECLARE v_apellido VARCHAR(30);
    DECLARE v_edad INT;
    DECLARE v_id_alumno INT;
    DECLARE v_id_curso INT;
    DECLARE v_quiere_inscribirse BOOLEAN;

    WHILE i <= 100 DO
        -- Generar datos básicos
        SET v_nombre = ELT(FLOOR(1 + (RAND() * 10)), 'Mateo', 'Valeria', 'Sebastian', 'Camila', 'Alejandro', 'Daniela', 'Nicolas', 'Mariana', 'Joaquin', 'Victoria');
        SET v_apellido = ELT(FLOOR(1 + (RAND() * 10)), 'Pinto', 'Rojas', 'Morales', 'Castro', 'Ortiz', 'Silva', 'Mendez', 'Villanueva', 'Herrera', 'Quintana');
        SET v_edad = FLOOR(8 + (RAND() * 60)); -- Alumnos desde niños hasta adultos

        -- Insertar Alumno
        INSERT INTO alumno (nombre, apellido, edad, direccion, telefono, email)
        VALUES (
            v_nombre,
            v_apellido,
            v_edad,
            CONCAT('Av. Musical ', i),
            CONCAT('55', FLOOR(10000000 + RAND() * 89999999)),
            LOWER(CONCAT(v_nombre, '.', v_apellido, i, '@mail.com'))
        );

        SET v_id_alumno = LAST_INSERT_ID();

        -- Lógica de inscripción: solo el 65% de los alumnos se inscribirán
        SET v_quiere_inscribirse = (RAND() <= 0.65);

        IF v_quiere_inscribirse THEN
            -- Elegir un curso al azar (del 1 al 9)
            SET v_id_curso = FLOOR(1 + (RAND() * 9));

            INSERT INTO inscripcion (fecha_inscripcion, abono_inscripcion, id_alumno, id_curso)
            VALUES (
                DATE_ADD('2026-02-01', INTERVAL FLOOR(RAND() * 60) DAY), -- Fechas en febrero y marzo
                RAND() > 0.4, -- El 60% ha pagado
                v_id_alumno,
                v_id_curso
            );
        END IF;

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

-- 3. Ejecutar y limpiar
CALL PoblarEscuelaMusica();
-- DROP PROCEDURE PoblarEscuelaMusica;

-- REVISION DE ALUMNOS NO INSCRITOS A NINGUN CURSO
SELECT COUNT(*) AS alumnos_sin_curso
FROM alumno a
LEFT JOIN inscripcion i ON a.id_alumno = i.id_alumno
WHERE i.id_inscripcion IS NULL;

-- EJERCICIOS:
-- Listar todos los alumnos inscritos en el curso de "Guitarra Intermedio"
-- Mosrar todas las inscripciones realizadas después del 1 de marzo del 2026
-- Contar la cantidad de alumnos que han abandonado la inscripción
-- Listar los cursos disponibles para alumnos avanzados
-- Listar los nombres y apellidos de los alumnos junto con los nombres de los cursos a los que están inscritos
-- Mostrar el nombre del curso y la cantidad de alumnos inscritos en cada curso
-- Listar el nombre y apellido de los alumnos que no han pagado su inscripcion, sin importar el curso
-- Obtener el nombre de los cursos que tienen al menos un alumno menor a 10 años inscrito
-- Listar el nombre y apellido de los alumnos junto con los nombres de los cursos que están inscritos, pero solo para aquellos que se inscribieron en febrero del 2026
