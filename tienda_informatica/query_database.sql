create schema infotienda collate utf8mb4_spanish_ci;

create table fabrica
(
    codigo    int auto_increment
        primary key,
    nombre    varchar(30) not null,
    direccion varchar(50) not null
);

create table producto
(
    codigo            int auto_increment
        primary key,
    nombre            varchar(30) not null,
    precio            double      not null,
    fk_codigo_fabrica int         not null,
    constraint fk_codigo_fabrica
        foreign key (fk_codigo_fabrica) references fabrica (codigo)
);

use infotienda;

INSERT INTO fabrica (nombre, direccion) VALUES
('Logitech Solutions', 'Silicon Valley, California'),
('Asus Tech International', 'Taipei, Taiwan'),
('Corsair Gaming Inc.', 'Fremont, California');

INSERT INTO producto (nombre, precio, fk_codigo_fabrica) VALUES
('Mouse Inalámbrico MX Master 3S', 99.99, 1),   -- Logitech
('Teclado Mecánico G915 TKL', 229.50, 1),       -- Logitech
('Cámara Web C920 Pro HD', 79.00, 1),           -- Logitech
('Monitor ROG Swift 27"', 649.99, 2),          -- Asus
('Placa Base ROG Strix Z790', 380.00, 2),       -- Asus
('Laptop Zenbook S 13 OLED', 1200.00, 2),       -- Asus
('Memoria RAM Vengeance 32GB', 115.00, 3),      -- Corsair
('Fuente de Poder RM850x', 145.50, 3),          -- Corsair
('Enfriamiento Líquido H150i', 189.99, 3),      -- Corsair
('Audífonos HS80 RGB Wireless', 135.00, 3);     -- Corsair
