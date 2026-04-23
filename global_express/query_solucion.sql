-- Ejercicio
-- Muestra el nombre del conductor y la placa de su camión, pero solo de aquellos conductores que han transportado
-- envíos de clientes que viven en un país diferente al país de destino de la ruta

SELECT DISTINCT
    con.nombre,
    cam.placa
FROM conductores con
JOIN camiones cam on con.fk_id_camion = cam.id_camion
JOIN ruta_envios re on cam.id_camion = re.fk_id_camion
JOIN envios e on e.id_envio = re.fk_id_envio
JOIN clientes cl on cl.id_cliente = e.fk_id_cliente
WHERE cl.pais_origen != re.pais_destino;