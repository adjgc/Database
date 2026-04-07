create schema torneo_tenis collate utf8mb4_spanish_ci;

create table participante
(
    id_participante  int auto_increment
        primary key,
    dni_participante varchar(15) not null,
    nombre           varchar(30) not null,
    apellido         varchar(30) not null,
    direccion        varchar(50) not null,
    edad             int         not null,
    telefono         varchar(10) null,
    sexo             varchar(1)  not null
);

create table categoria
(
    id_categoria int auto_increment
        primary key,
    nombre       varchar(30) not null,
    edad_minima  int         not null,
    edad_maxima  int         not null,
    sexo         varchar(1)  not null
);

create table inscripcion
(
    id_inscripcion    int auto_increment
        primary key,
    fecha_inscripcion date    not null,
    abono_inscripcion BOOLEAN not null,
    id_categoria      int     not null,
    id_participante   int     not null,
    constraint fk_id_categoria
        foreign key (id_categoria) references categoria (id_categoria),
    constraint fk_id_participante
        foreign key (id_participante) references participante (id_participante)
);

USE torneo_tenis;

-- 1. Insertar las Categorías exactas
INSERT INTO torneo_tenis.categoria (nombre, edad_minima, edad_maxima, sexo) VALUES
('Damas A', 18, 34, 'F'),
('Damas B', 35, 45, 'F'),
('Damas C', 46, 100, 'F'),
('Caballeros A', 18, 34, 'M'),
('Caballeros B', 35, 50, 'M'),
('Caballeros C', 51, 100, 'M'),
('Juvenil Varones', 13, 17, 'M'),
('Juvenil Mujeres', 13, 17, 'F');

-- 2. Procedimiento para generar 100 participantes e inscripciones aleatorias
DELIMITER //

CREATE PROCEDURE PoblarTorneo()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre VARCHAR(30);
    DECLARE v_apellido VARCHAR(30);
    DECLARE v_sexo VARCHAR(1);
    DECLARE v_edad INT;
    DECLARE v_dni VARCHAR(15);
    DECLARE v_id_participante INT;
    DECLARE v_id_categoria INT;

    WHILE i <= 100 DO
        -- Generar Sexo Aleatorio
        SET v_sexo = IF(RAND() > 0.5, 'M', 'F');

        -- Generar Edad Aleatoria entre 13 y 70
        SET v_edad = FLOOR(13 + (RAND() * 58));

        -- Nombres aleatorios simples
        SET v_nombre = ELT(FLOOR(1 + (RAND() * 10)), 'Juan', 'Maria', 'Pedro', 'Ana', 'Luis', 'Elena', 'Diego', 'Lucia', 'Carlos', 'Sofia');
        SET v_apellido = ELT(FLOOR(1 + (RAND() * 10)), 'Gomez', 'Lopez', 'Perez', 'Rodriguez', 'Garcia', 'Martinez', 'Sanchez', 'Romero', 'Diaz', 'Torres');
        SET v_dni = FLOOR(10000000 + (RAND() * 90000000));

        -- Insertar Participante
        INSERT INTO participante (dni_participante, nombre, apellido, direccion, edad, telefono, sexo)
        VALUES (v_dni, v_nombre, v_apellido, CONCAT('Calle ', i), v_edad, CONCAT('555', FLOOR(1000000 + RAND() * 9000000)), v_sexo);

        SET v_id_participante = LAST_INSERT_ID();

        -- Buscar la categoría que le corresponde según edad y sexo
        SELECT id_categoria INTO v_id_categoria
        FROM categoria
        WHERE v_edad BETWEEN edad_minima AND edad_maxima
          AND sexo = v_sexo
        LIMIT 1;

        -- Insertar Inscripción (si se encontró categoría válida)
        IF v_id_categoria IS NOT NULL THEN
            INSERT INTO inscripcion (fecha_inscripcion, abono_inscripcion, id_categoria, id_participante)
            VALUES (DATE_ADD('2026-01-01', INTERVAL FLOOR(RAND() * 90) DAY), RAND() > 0.3, v_id_categoria, v_id_participante);
        END IF;

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

-- 3. Ejecutar el procedimiento y luego borrarlo
CALL PoblarTorneo();
-- DROP PROCEDURE PoblarTorneo;

-- EJERCICIOS: 
-- CONTAR LA CANTIDAD TOTAL DE PARTICIPANTES
-- OBTENER LA LISTA COMPLETA DE TODOS LOS PARTICIPANTES
-- OBTENER LA LISTA COMPLETA DE TODAS LAS CATEGORIAS
-- OBTENER LA CANTIDAD DE PARTICIPANTES MUJERES, SIN IMPORTAR LA CATEGORIA
-- OBTENER EL NOMBRE Y APELLIDO DE LOS INSCRITOS EN LA CATEGORIA "CABALLEROS B"
-- OBTENER LOS DATOS DE LOS PARTICIPANTES QUE TENGAN ENTRE 25 Y 37 AÑOS, SIN IMPORTAR EL GENERO
-- OBTENER LA LISTA COMPLETA DE INSCRIPCIONES, ESPECIFICANDO EL NOMBRE Y APELLIDO DE CADA UNO DE LOS INSCRITOS, SIN IMPORTAR LA CATEGORIA
