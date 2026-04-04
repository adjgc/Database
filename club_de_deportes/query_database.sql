-- CREACIÓN DEL NUEVO ESQUEMA
create schema club_deportes collate utf8mb4_spanish_ci;

-- CREACIÓN DE TABLA DEPORTE
create table deporte
(
    codigo    int auto_increment
        primary key,
    nombre    varchar(30) not null,
    es_grupal boolean     not null
);

-- CREACIÓN DE TABLA SOCIO - CONSIDERAR DEPENDENCIA DE CLAVE FORANEA
create table socio
(
    num_socio int auto_increment
        primary key,
    nombre    varchar(30) not null,
    apellido  varchar(30) not null,
    dni       varchar(30) not null,
    fk_codigo int         not null,
    constraint fk_codigo
        foreign key (fk_codigo) references deporte (codigo)
);

-- USAMOS LA BASE DE DATOS QUE ACABAMOS DE CREAR
use club_deportes;

-- SE AGREGAN PRIMERO LOS DEPORTES POR LA DEPENDENCIA DE CLAVE FORANEA, EN CASO CONTRARIO SE GENERAR UN ERROR DE CLAVE FORANEA
INSERT INTO deporte (codigo, nombre, es_grupal) VALUES
(1, 'Fútbol', TRUE),
(2, 'Tenis', FALSE),
(3, 'Natación', FALSE);

-- SE AGREGAN LO SOCIOS
INSERT INTO socio (num_socio, nombre, apellido, dni, fk_codigo) VALUES
(101, 'Carlos', 'Gómez', '35123456', 1),
(102, 'Lucía', 'Fernández', '38234567', 1),
(103, 'Marcos', 'Pérez', '32345678', 2),
(104, 'Sofía', 'Rodríguez', '40456789', 3),
(105, 'Diego', 'Sánchez', '37567890', 1),
(106, 'Elena', 'Martínez', '39678901', 2),
(107, 'Javier', 'López', '34789012', 3),
(108, 'Valeria', 'Díaz', '41890123', 1),
(109, 'Tomás', 'Castro', '33901234', 2),
(110, 'Ana', 'Romero', '36012345', 1);
