create schema global_express collate utf8mb4_spanish_ci;

use global_express;

create table clientes(
    id_cliente int primary key auto_increment not null,
    nombre varchar(255) not null,
    pais_origen varchar(255) not null
);

create table envios(
    id_envio int primary key auto_increment not null,
    peso_kg double default (0.0),
    fecha_despacho date default (current_date),
    fk_id_cliente int not null,
    foreign key (fk_id_cliente) references clientes(id_cliente)
);

create table camiones(
    id_camion int primary key auto_increment not null,
    placa varchar(255) not null,
    capacidad_max_kg double default (0.0)
);

create table conductores(
    id_conductor int primary key auto_increment not null,
    nombre varchar(255) not null,
    fk_id_camion int not null unique,
    foreign key (fk_id_camion) references camiones(id_camion)
);

create table ruta_envios(
    id_ruta_envios int primary key auto_increment not null,
    pais_destino varchar(255),
    fk_id_envio int not null,
    fk_id_camion int not null,
    foreign key (fk_id_envio) references envios(id_envio),
    foreign key (fk_id_camion) references camiones(id_camion)
);


insert into clientes (nombre, pais_origen) values
('Mario Mario', 'Israel'),
('Luigi Mario', 'Francia'),
('Princess Peach', 'Rusia'),
('Yoshi', 'Brasil'),
('Toad', 'Perú');

insert into envios (peso_kg, fecha_despacho, fk_id_cliente) values
(2100, '2026-01-01', 2),
(500, '2026-01-01', 1),
(4200, '2026-01-01', 3),
(700, '2026-01-02', 4),
(1300, '2026-01-03', 4),
(1400, '2026-01-03', 5),
(3500, '2026-01-06', 1),
(4000, '2026-01-06', 3),
(2800, '2026-01-06', 3),
(2300, '2026-01-06', 3),
(3000, '2026-01-11', 2),
(600, '2026-01-11', 4),
(1000, '2026-01-15', 5),
(1300, '2026-01-16', 4),
(2100, '2026-01-17', 2);

insert into camiones (placa, capacidad_max_kg) values
('1234567890', 2500),
('0987654321', 4200),
('1029384756', 1500),
('0192837465', 2200),
('5647382910', 750);

insert into conductores (nombre, fk_id_camion) values
('Wario', 1),
('Bowser', 2),
('Champi', 3),
('Daisy', 4),
('Donky Kong', 5);

insert into ruta_envios (pais_destino, fk_id_envio, fk_id_camion) values
('Francia', 1, 4),
('Israel', 2, 5),
('México', 3, 2),
('Israel', 4, 5),
('Rusia', 5, 3),
('Egipto', 6, 3),
('Brasil', 7, 2),
('Perú', 8, 2),
('Perú', 9, 2),
('Francia', 10, 1),
('Venezuela', 11, 2),
('China', 12, 5),
('Japón', 13, 3),
('Francia', 14, 3),
('Rusia', 15, 1);