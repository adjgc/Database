DELIMITER //
CREATE  TRIGGER tr_insertar_auditoria_envio
AFTER INSERT ON envios
FOR EACH ROW
BEGIN
    INSERT INTO auditorias_envios (mensaje, fk_id_envio) VALUES
    (CONCAT('Nueva auditoría para envio con ID: ', NEW.id_envio), NEW.id_envio);
END //
DELIMITER ;

insert into envios (peso_kg, fecha_despacho, fk_id_cliente) values
(2100, '2026-03-01', 2),
(500, '2026-03-05', 1),
(4200, '2026-03-05', 3);
