create schema streaming_pro collate utf8mb4_spanish_ci;

use streaming_pro;

create table usuarios(
    id_usuario int primary key auto_increment,
    nombre varchar(255) not null,
    email varchar(255) not null
);

create table perfiles_premium(
    id_perfiles_premium int primary key auto_increment,
    fecha_vencimiento date not null,
    tipo_suscripcion varchar(255) not null ,
    fk_id_usuario int not null unique,
    foreign key (fk_id_usuario) references usuarios(id_usuario)
);

create table generos(
    id_genero int primary key auto_increment,
    nombre varchar(255) not null
);

create table contenido(
    id_contenido int primary key auto_increment,
    titulo varchar(255) not null,
    duracion int not null,
    fk_id_genero int not null,
    foreign key (fk_id_genero) references generos(id_genero)
);

create table historial_vistas(
    id_historial_vistas int primary key auto_increment,
    fecha_visto date default (current_date),
    fk_id_usuario int not null,
    fk_id_contenido int not null,
    foreign key (fk_id_usuario) references usuarios(id_usuario),
    foreign key (fk_id_contenido) references contenido(id_contenido)
);


insert into usuarios (nombre, email) values
('Emilia Perez', 'emilia.perez@correo.com'),
('Ana del Monte', 'ana.monte@correo.com'),
('Susana Dominguez', 'susana.dominguez@correo.com'),
('Juan Ramirez', 'juan.ramirez@correo.com'),
('Ramon Elizalde', 'ramon.elizalde@correo.com');

insert into generos (nombre) values
('Documentales'),
('Terror'),
('Drama'),
('Si-fi');

insert into contenido (titulo, duracion, fk_id_genero) values
('El teléfono negro', 108, 2),
('La sustancia', 114, 2),
('Amor ciego', 104, 3),
('La vida es bella', 123, 3),
('Seven: Los siete pecados capitales', 117, 2),
('Tenet', 128, 4);

INSERT INTO historial_vistas (fk_id_usuario, fk_id_contenido, fecha_visto) VALUES
(1, 1, '2026-04-01'),
(1, 2, '2026-04-02'),
(1, 6, '2026-04-03'),
(2, 1, '2026-04-05'),
(2, 5, '2026-04-06'),
(3, 3, '2026-04-10'),
(3, 4, '2026-04-11'),
(3, 6, '2026-04-12'),
(4, 1, '2026-04-15'),
(4, 2, '2026-04-16'),
(4, 3, '2026-04-17'),
(4, 4, '2026-04-18'),
(5, 6, '2026-04-20'),
(1, 4, '2026-04-21'),
(4, 6, '2026-04-21');

INSERT INTO perfiles_premium (fecha_vencimiento, tipo_suscripcion, fk_id_usuario) VALUES
('2027-01-01', 'Anual Gold', 1),
('2026-12-01', 'Mensual Plata', 3);