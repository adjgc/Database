DELIMITER //
CREATE TRIGGER tr_bloquear_borrado_envio
    BEFORE DELETE ON envios
    FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La eliminación de envios está bloqueada, contacte a un administrador.';
    END //
DELIMITER ;

delete from envios where id_envio = 16;
