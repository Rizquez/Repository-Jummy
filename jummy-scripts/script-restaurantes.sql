USE bzyltuzdyjcjudmbjtog;

INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFJAP001', 'Restaurante Japonés 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'japones1@correo.com', 'Sushi A', 'El mejor sushi de la ciudad.', 'logo_sushi_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa')),
('CIFJAP002', 'Restaurante Japonés 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'japones2@correo.com', 'Sushi B', 'Auténtica comida japonesa.', 'logo_sushi_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa')),
('CIFJAP003', 'Restaurante Japonés 3 S.L.', 'Plaza Mayor 5, Ciudad C', 'Ciudad C', '10003', '123123123', 'japones3@correo.com', 'Sushi C', 'Sushi fresco cada día.', 'logo_sushi_c.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa')),
('CIFJAP004', 'Restaurante Japonés 4 S.L.', 'Calle Luna 8, Ciudad D', 'Ciudad D', '10004', '321321321', 'japones4@correo.com', 'Sushi D', 'Variedad de sushi y ramen.', 'logo_sushi_d.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa')),
('CIFJAP005', 'Restaurante Japonés 5 S.L.', 'Avenida Sol 10, Ciudad E', 'Ciudad E', '10005', '456456456', 'japones5@correo.com', 'Sushi E', 'Experiencia japonesa auténtica.', 'logo_sushi_e.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa'));

INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFITA001', 'Restaurante Italiano 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'italiano1@correo.com', 'Pasta A', 'La mejor pasta de la ciudad.', 'logo_pasta_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana')),
('CIFITA002', 'Restaurante Italiano 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'italiano2@correo.com', 'Pasta B', 'Auténtica comida italiana.', 'logo_pasta_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana')),
('CIFITA003', 'Restaurante Italiano 3 S.L.', 'Plaza Mayor 5, Ciudad C', 'Ciudad C', '10003', '123123123', 'italiano3@correo.com', 'Pasta C', 'Pasta fresca cada día.', 'logo_pasta_c.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana')),
('CIFITA004', 'Restaurante Italiano 4 S.L.', 'Calle Luna 8, Ciudad D', 'Ciudad D', '10004', '321321321', 'italiano4@correo.com', 'Pasta D', 'Variedad de pasta y pizza.', 'logo_pasta_d.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana')),
('CIFITA005', 'Restaurante Italiano 5 S.L.', 'Avenida Sol 10, Ciudad E', 'Ciudad E', '10005', '456456456', 'italiano5@correo.com', 'Pasta E', 'Experiencia italiana auténtica.', 'logo_pasta_e.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana'));

-- Insertar datos en la tabla restaurantes para gastronomía española
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFESP001', 'Restaurante Español 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'espanol1@correo.com', 'Tapas A', 'Las mejores tapas de la ciudad.', 'logo_tapas_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española')),
('CIFESP002', 'Restaurante Español 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'espanol2@correo.com', 'Tapas B', 'Auténtica comida española.', 'logo_tapas_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española')),
('CIFESP003', 'Restaurante Español 3 S.L.', 'Plaza Mayor 5, Ciudad C', 'Ciudad C', '10003', '123123123', 'espanol3@correo.com', 'Tapas C', 'Tapas frescas cada día.', 'logo_tapas_c.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española')),
('CIFESP004', 'Restaurante Español 4 S.L.', 'Calle Luna 8, Ciudad D', 'Ciudad D', '10004', '321321321', 'espanol4@correo.com', 'Tapas D', 'Variedad de tapas y paellas.', 'logo_tapas_d.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española')),
('CIFESP005', 'Restaurante Español 5 S.L.', 'Avenida Sol 10, Ciudad E', 'Ciudad E', '10005', '456456456', 'espanol5@correo.com', 'Tapas E', 'Experiencia española auténtica.', 'logo_tapas_e.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española'));

-- Insertar datos en la tabla restaurantes para gastronomía venezolana
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFVEN001', 'Restaurante Venezolano 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'venezolano1@correo.com', 'Arepas A', 'Las mejores arepas de la ciudad.', 'logo_arepas_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana')),
('CIFVEN002', 'Restaurante Venezolano 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'venezolano2@correo.com', 'Arepas B', 'Auténtica comida venezolana.', 'logo_arepas_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana')),
('CIFVEN003', 'Restaurante Venezolano 3 S.L.', 'Plaza Mayor 5, Ciudad C', 'Ciudad C', '10003', '123123123', 'venezolano3@correo.com', 'Arepas C', 'Arepas frescas cada día.', 'logo_arepas_c.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana')),
('CIFVEN004', 'Restaurante Venezolano 4 S.L.', 'Calle Luna 8, Ciudad D', 'Ciudad D', '10004', '321321321', 'venezolano4@correo.com', 'Arepas D', 'Variedad de arepas y cachapas.', 'logo_arepas_d.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana')),
('CIFVEN005', 'Restaurante Venezolano 5 S.L.', 'Avenida Sol 10, Ciudad E', 'Ciudad E', '10005', '456456456', 'venezolano5@correo.com', 'Arepas E', 'Experiencia venezolana auténtica.', 'logo_arepas_e.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana'));

-- Insertar datos en la tabla restaurantes para gastronomía mexicana
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFMEX001', 'Restaurante Mexicano 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'mexicano1@correo.com', 'Tacos A', 'Los mejores tacos de la ciudad.', 'logo_tacos_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana')),
('CIFMEX002', 'Restaurante Mexicano 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'mexicano2@correo.com', 'Tacos B', 'Auténtica comida mexicana.', 'logo_tacos_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana')),
('CIFMEX003', 'Restaurante Mexicano 3 S.L.', 'Plaza Mayor 5, Ciudad C', 'Ciudad C', '10003', '123123123', 'mexicano3@correo.com', 'Tacos C', 'Tacos frescos cada día.', 'logo_tacos_c.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana')),
('CIFMEX004', 'Restaurante Mexicano 4 S.L.', 'Calle Luna 8, Ciudad D', 'Ciudad D', '10004', '321321321', 'mexicano4@correo.com', 'Tacos D', 'Variedad de tacos y enchiladas.', 'logo_tacos_d.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana')),
('CIFMEX005', 'Restaurante Mexicano 5 S.L.', 'Avenida Sol 10, Ciudad E', 'Ciudad E', '10005', '456456456', 'mexicano5@correo.com', 'Tacos E', 'Experiencia mexicana auténtica.', 'logo_tacos_e.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana'));

-- Insertar datos en la tabla restaurantes para gastronomía tailandesa
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFTHAI001', 'Restaurante Tailandés 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'tailandes1@correo.com', 'Thai A', 'La mejor comida tailandesa de la ciudad.', 'logo_thai_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa')),
('CIFTHAI002', 'Restaurante Tailandés 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'tailandes2@correo.com', 'Thai B', 'Auténtica comida tailandesa.', 'logo_thai_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa')),
('CIFTHAI003', 'Restaurante Tailandés 3 S.L.', 'Plaza Mayor 5, Ciudad C', 'Ciudad C', '10003', '123123123', 'tailandes3@correo.com', 'Thai C', 'Comida tailandesa fresca cada día.', 'logo_thai_c.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa')),
('CIFTHAI004', 'Restaurante Tailandés 4 S.L.', 'Calle Luna 8, Ciudad D', 'Ciudad D', '10004', '321321321', 'tailandes4@correo.com', 'Thai D', 'Variedad de curry y pad thai.', 'logo_thai_d.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa')),
('CIFTHAI005', 'Restaurante Tailandés 5 S.L.', 'Avenida Sol 10, Ciudad E', 'Ciudad E', '10005', '456456456', 'tailandes5@correo.com', 'Thai E', 'Experiencia tailandesa auténtica.', 'logo_thai_e.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa'));