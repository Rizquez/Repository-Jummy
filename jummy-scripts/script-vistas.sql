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


    