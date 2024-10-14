-- Vista con los datos de los usuarios, tanto comensales como restaurates
CREATE VIEW v_usuarios AS
SELECT 
    id, 
    nombre AS user, 
    email, 
    password, 
    telefono,
    'comensal' AS tipo_usuario
FROM 
    comensales
UNION ALL
SELECT 
    id, 
    nombre_fiscal AS user, 
    email, 
    password, 
    telefono,
    'restaurante' AS tipo_usuario
FROM 
    restaurantes;

    