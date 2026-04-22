-- Ejercicios
-- 1. Listar a todos los usuarios y su tipo de suscripcion, si no cuenta con suscripcion premium debe ponerse como "GRATUITO"
SELECT
    u.nombre,
    ifnull(pp.tipo_suscripcion, 'Gratuito') as suscripcion
FROM
    usuarios u
LEFT JOIN perfiles_premium pp on u.id_usuario = pp.fk_id_usuario;

-- 2. Encuentra los titulos de las 3 películas o series más vistas en la plataforma, mostrando cuántas veces han sido reproducidos
SELECT
    c.titulo,
    count(hv.fk_id_contenido) as num_visto
FROM
    contenido c
JOIN historial_vistas hv on c.id_contenido = hv.fk_id_contenido
GROUP BY titulo
ORDER BY num_visto desc limit 3;

-- 3. Calcular el tiempo que un usuario en específico ha pasado viendo series o peliculas en Streaming Pro
SELECT
    u.nombre,
    sum(c.duracion) as tiempo_visto_min
FROM
    usuarios u
JOIN historial_vistas hv on u.id_usuario = hv.fk_id_usuario
JOIN contenido c on hv.fk_id_contenido = c.id_contenido
WHERE u.id_usuario = 4
GROUP BY u.nombre;

-- 4. Muestra el nombre de los generos que no tiene ningun contenido asociado
SELECT
    g.nombre
FROM
    generos g
LEFT JOIN contenido c on g.id_genero = c.fk_id_genero
WHERE
    c.id_contenido is null;

-- 5. Mostrar el nombre y correo de los usuarios que han visto al menos 3 generos diferentes
SELECT
    u.nombre,
    u.email,
    count(DISTINCT c.fk_id_genero) as generos_vistos
FROM usuarios u
JOIN historial_vistas hv on u.id_usuario = hv.fk_id_usuario
JOIN contenido c on hv.fk_id_contenido = c.id_contenido
JOIN generos g on c.fk_id_genero = g.id_genero
GROUP BY u.id_usuario
HAVING generos_vistos >= 3;