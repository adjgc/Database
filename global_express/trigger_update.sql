DELIMITER //
CREATE TRIGGER tr_actualizar_auditoria_envio
    AFTER UPDATE ON ruta_envios
    FOR EACH ROW
    BEGIN
        IF OLD.pais_destino <> NEW.pais_destino THEN
            UPDATE auditorias_envios
            SET mensaje = CONCAT('Ruta actualizada, cambió de ', OLD.pais_destino, ' a ', NEW.pais_destino),
                fecha_registro = NOW()
            WHERE fk_id_envio = NEW.fk_id_envio;
        END IF;
    END //
DELIMITER ;

INSERT into ruta_envios  (pais_destino, fk_id_envio, fk_id_camion) VALUES
('Rusia', 16, 3);

UPDATE ruta_envios
SET pais_destino = 'Italia'
WHERE fk_id_envio = 16;
