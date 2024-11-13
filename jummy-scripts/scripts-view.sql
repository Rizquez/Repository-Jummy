-- Vista con los datos de los usuarios, tanto comensales como restaurates
CREATE VIEW v_usuarios AS
SELECT 
    id, 
    REGEXP_REPLACE(nombre, '[^A-Za-z0-9]', '') AS user, 
    email, 
    password, 
    telefono,
    'comensal' AS tipo_usuario
FROM 
    comensales
UNION ALL
SELECT 
    id, 
    REGEXP_REPLACE(cif, '[^A-Za-z0-9]', '') AS user, 
    email, 
    password, 
    telefono,
    'restaurante' AS tipo_usuario
FROM 
    restaurantes;


-- Vista los datos base de los restaurantes disponibles

CREATE VIEW v_restaurantes_gastronomias AS
SELECT 
    r.nombre_comercial,
    r.descripcion,
    g.gastronomia
FROM 
    restaurantes AS r
INNER JOIN 
    gastronomias AS g ON r.id_gastronomia = g.id;