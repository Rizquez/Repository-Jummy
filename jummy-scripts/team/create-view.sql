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


-- Vista con los datos base de los restaurantes disponibles
CREATE VIEW v_restaurantes_gastronomias AS
SELECT 
    r.nombre_comercial,
    r.descripcion,
    g.gastronomia
FROM 
    restaurantes AS r
INNER JOIN 
    gastronomias AS g ON r.id_gastronomia = g.id;


--  Vista con los datos de los platos agrupados por restaurantes
CREATE VIEW v_menus AS
SELECT 
	r.nombre_comercial,
    p.nombre,
    p.descripcion,
    p.ingredientes,
    p.precio,
    tp.tipo_plato,
    p.foto
FROM 
    platos AS p
INNER JOIN 
    restaurantes AS r ON p.id_restaurante = r.id
INNER JOIN 
	tipo_platos AS tp ON p.id_tipo_plato = tp.id


-- Vista con los datos de los pedidos realizados
CREATE VIEW v_detalles_pedidos AS 
SELECT 
    dp.id_pedidos, 
    p.nombre AS nombre_plato, 
    c.email AS email_comensal, 
    ped.estado, 
    r.nombre_comercial,
    r.email AS email_restaurante,
    ped.fecha
FROM 
    detalles_pedido dp
INNER JOIN 
    platos p ON dp.id_platos = p.id
INNER JOIN 
    pedidos ped ON dp.id_pedidos = ped.id
INNER JOIN 
    comensales c ON ped.id_comensales = c.id
INNER JOIN 
    restaurantes r ON r.id = p.id_restaurante;
    