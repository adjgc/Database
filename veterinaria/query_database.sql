create schema veterinaria collate utf8mb4_spanish_ci;

use veterinaria;

create table paciente
(
    id_paciente      int auto_increment
        primary key,
    nombre_paciente  varchar(30) not null,
    fecha_nacimiento date        not null,
    especie          varchar(15) not null
);

create table tratamiento
(
    id_tratamiento int auto_increment primary key,
    id_paciente int not null,
    constraint id_paciente foreign key (id_paciente) references paciente (id_paciente),
    tipo_tratamiento varchar(50) not null,
    fecha_tratamiento date not null
);

INSERT INTO paciente (nombre_paciente, fecha_nacimiento, especie) VALUES
('Max', '2021-05-10', 'Perro'),
('Luna', '2022-08-15', 'Gato'),
('Rocky', '2020-03-22', 'Perro'),
('Coco', '2023-01-05', 'Ave'),
('Bella', '2019-11-30', 'Gato');

INSERT INTO tratamiento (id_paciente, tipo_tratamiento, fecha_tratamiento) VALUES
(1, 'Vacuna Quíntuple', '2024-01-10'), (1, 'Desparasitación Interna', '2024-02-15'),
(1, 'Limpieza Dental', '2024-03-05'), (1, 'Corte de Uñas', '2024-03-20'),
(1, 'Chequeo General', '2024-04-01'),

(2, 'Esterilización', '2024-01-20'), (2, 'Vacuna Triple Felina', '2024-02-10'),
(2, 'Control de Peso', '2024-02-25'), (2, 'Desparasitación Externa', '2024-03-12'),

(3, 'Tratamiento Antipulgas', '2024-01-05'), (3, 'Radiografía de Cadera', '2024-01-15'),
(3, 'Fisioterapia Session 1', '2024-02-01'),

(4, 'Recorte de Pico', '2024-01-12'), (4, 'Desparasitación', '2024-01-28'),

(5, 'Vacuna Leucemia Felina', '2024-01-15'), (5, 'Ecografía Abdominal', '2024-02-05'),
(5, 'Cambio de Dieta Renal', '2024-02-20'), (5, 'Tratamiento Periodontal', '2024-03-10'),
(5, 'Desparasitación Semestral', '2024-03-28'), (5, 'Vacuna Rabia Refuerzo', '2024-04-08');
