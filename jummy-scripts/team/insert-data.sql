-- Gastronomias
USE bzyltuzdyjcjudmbjtog;
INSERT INTO gastronomias (gastronomia) VALUES ('japonesa');
INSERT INTO gastronomias (gastronomia) VALUES ('italiana');
INSERT INTO gastronomias (gastronomia) VALUES ('española');
INSERT INTO gastronomias (gastronomia) VALUES ('venezolana');
INSERT INTO gastronomias (gastronomia) VALUES ('mexicana');
INSERT INTO gastronomias (gastronomia) VALUES ('tailandesa');

-- NOTA: El numero de telefono ha sido modificado posteriormente mediante un UPDATE para cumplir con el formato E. 164 (format movil phone number)
USE bzyltuzdyjcjudmbjtog;

-- Gastronomia japonesa
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFJAP001', 'Restaurante Japonés 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'japones1@correo.com', 'Sushi A', 'El mejor sushi de la ciudad.', 'logo_sushi_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa')),
('CIFJAP002', 'Restaurante Japonés 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'japones2@correo.com', 'Sushi B', 'Auténtica comida japonesa.', 'logo_sushi_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'japonesa')),

INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) 
VALUES 
('Edamame', 'Judías de soja hervidas y saladas.', 'Edamame, sal', 4.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi A')),
('Sashimi de Salmón', 'Finas lonchas de salmón fresco.', 'Salmón fresco', 12.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi A')),
('Matcha Cheesecake', 'Pastel de queso con té verde matcha.', 'Queso crema, matcha, galleta', 6.50, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi A')),
('Té Verde', 'Té verde japonés.', 'Té verde, agua caliente', 2.50, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi A')),
('Gyozas', 'Empanadillas japonesas rellenas de cerdo.', 'Harina, carne de cerdo, col, ajo', 5.50, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi B')),
('Ramen de Cerdo', 'Sopa japonesa con fideos y cerdo.', 'Fideos, caldo de cerdo, huevo', 11.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi B')),
('Mochi', 'Postre japonés de arroz glutinoso relleno.', 'Harina de arroz, azúcar, pasta de frijol rojo', 4.00, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi B')),
('Sake', 'Bebida alcohólica de arroz.', 'Arroz, agua', 8.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Sushi B'));

-- Gastronomia italiana
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUE
('CIFITA001', 'Restaurante Italiano 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'italiano1@correo.com', 'Pasta A', 'La mejor pasta de la ciudad.', 'logo_pasta_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana')),
('CIFITA002', 'Restaurante Italiano 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'italiano2@correo.com', 'Pasta B', 'Auténtica comida italiana.', 'logo_pasta_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'italiana')),

INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) 
VALUES 
('Bruschetta', 'Pan tostado con tomate y albahaca.', 'Pan, tomate, ajo, albahaca', 5.50, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta A')),
('Tagliatelle Bolognese', 'Pasta con salsa boloñesa.', 'Tagliatelle, carne, tomate, especias', 13.50, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta A')),
('Tiramisú', 'Postre italiano con café y mascarpone.', 'Mascarpone, bizcochos, café, cacao', 6.50, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta A')),
('Vino Chianti', 'Vino tinto italiano.', 'Uvas', 15.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta A')),
('Caprese', 'Ensalada de tomate, mozzarella y albahaca.', 'Tomate, mozzarella, albahaca, aceite', 7.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta B')),
('Pizza Margarita', 'Pizza clásica italiana con tomate y albahaca.', 'Masa, tomate, mozzarella, albahaca', 9.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta B')),
('Cannoli', 'Postre crujiente relleno de ricotta.', 'Ricotta, harina, azúcar', 4.50, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta B')),
('Limoncello', 'Licor de limón italiano.', 'Limones, alcohol, azúcar', 5.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Pasta B'));

-- Gastronomia española
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFESP001', 'Restaurante Español 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'espanol1@correo.com', 'Tapas A', 'Las mejores tapas de la ciudad.', 'logo_tapas_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española')),
('CIFESP002', 'Restaurante Español 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'espanol2@correo.com', 'Tapas B', 'Auténtica comida española.', 'logo_tapas_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'española')),

INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) 
VALUES 
('Tortilla Española', 'Tortilla de patata tradicional.', 'Patatas, huevo, cebolla', 6.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas A')),
('Paella Valenciana', 'Arroz con mariscos y pollo.', 'Arroz, pollo, mariscos, azafrán', 14.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas A')),
('Churros con Chocolate', 'Churros fritos con chocolate caliente.', 'Harina, agua, azúcar, chocolate', 5.50, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas A')),
('Sangría', 'Bebida española con vino y frutas.', 'Vino, frutas, azúcar', 7.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas A')),
('Patatas Bravas', 'Patatas fritas con salsa picante.', 'Patatas, tomate, especias', 5.50, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas B')),
('Cochinillo Asado', 'Cerdo asado típico de Segovia.', 'Cerdo, sal, especias', 18.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas B')),
('Tarta de Santiago', 'Tarta de almendra tradicional.', 'Almendra, azúcar, huevo', 6.00, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas B')),
('Cerveza Artesanal', 'Cerveza elaborada localmente.', 'Malta, lúpulo, agua', 4.50, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tapas B'));

-- Gastronomia venezolana
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFVEN001', 'Restaurante Venezolano 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'venezolano1@correo.com', 'Arepas A', 'Las mejores arepas de la ciudad.', 'logo_arepas_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana')),
('CIFVEN002', 'Restaurante Venezolano 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'venezolano2@correo.com', 'Arepas B', 'Auténtica comida venezolana.', 'logo_arepas_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'venezolana')),

INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) 
VALUES 
('Tequeños', 'Palitos de masa rellenos de queso, fritos.', 'Masa, queso', 4.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas A')),
('Arepa Reina Pepiada', 'Arepa rellena de pollo y aguacate.', 'Arepa, pollo, aguacate', 8.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas A')),
('Quesillo', 'Flan venezolano de leche condensada.', 'Leche condensada, huevos, azúcar', 5.50, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas A')),
('Guarapita', 'Bebida alcohólica con jugo de frutas y ron.', 'Jugo de frutas, ron', 6.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas A')),
('Empanadas de Pabellón', 'Empanadas rellenas de carne, caraotas y plátano.', 'Masa, carne, caraotas, plátano', 5.50, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas B')),
('Arepa Pelúa', 'Arepa rellena de carne mechada y queso.', 'Arepa, carne mechada, queso', 7.50, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas B')),
('Torta de Casabe', 'Tarta hecha con casabe, acompañada de miel de panela.', 'Casabe, miel, panela', 4.00, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas B')),
('Café con Leche', 'Bebida venezolana con café y leche.', 'Café, leche, azúcar', 3.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Arepas B'));

-- Gastronomia mexicana
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFMEX001', 'Restaurante Mexicano 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'mexicano1@correo.com', 'Tacos A', 'Los mejores tacos de la ciudad.', 'logo_tacos_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana')),
('CIFMEX002', 'Restaurante Mexicano 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'mexicano2@correo.com', 'Tacos B', 'Auténtica comida mexicana.', 'logo_tacos_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'mexicana')),

INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) 
VALUES 
('Guacamole con Totopos', 'Aguacate triturado con especias acompañado de totopos.', 'Aguacate, cebolla, tomate, cilantro', 5.50, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos A')),
('Tacos al Pastor', 'Tacos con carne de cerdo marinada y piña.', 'Carne de cerdo, piña, cebolla, tortillas', 9.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos A')),
('Churros con Cajeta', 'Churros con un dulce de leche caramelizado.', 'Harina, azúcar, leche, cajeta', 6.00, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos A')),
('Margarita', 'Cóctel a base de tequila, limón y sal.', 'Tequila, limón, sal', 7.50, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos A')),
('Sopes', 'Bocadillos de masa con carne, frijoles y salsa.', 'Masa, carne, frijoles, salsa', 6.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos B')),
('Enchiladas Verdes', 'Tortillas rellenas de pollo bañadas en salsa verde.', 'Pollo, tortilla, salsa verde, crema', 11.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos B')),
('Flan Mexicano', 'Flan cremoso con caramelo.', 'Leche, huevo, azúcar, vainilla', 5.00, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos B')),
('Tequila Sunrise', 'Cóctel con tequila, naranja y granadina.', 'Tequila, jugo de naranja, granadina', 8.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Tacos B'));

-- Gastronomia tailandesa
INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
VALUES
('CIFTHAI001', 'Restaurante Tailandés 1 S.L.', 'Calle Falsa 123, Ciudad A', 'Ciudad A', '10001', '123456789', 'tailandes1@correo.com', 'Thai A', 'La mejor comida tailandesa de la ciudad.', 'logo_thai_a.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa')),
('CIFTHAI002', 'Restaurante Tailandés 2 S.L.', 'Avenida Siempre Viva 742, Ciudad B', 'Ciudad B', '10002', '987654321', 'tailandes2@correo.com', 'Thai B', 'Auténtica comida tailandesa.', 'logo_thai_b.png', 'password123', (SELECT id FROM gastronomias WHERE gastronomia = 'tailandesa')),

INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) 
VALUES 
('Samosas Tailandesas', 'Empanadas rellenas de verduras y especias.', 'Masa, verduras, especias', 4.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai A')),
('Pad Thai', 'Fideos de arroz con camarones, huevo y cacahuetes.', 'Fideos de arroz, camarones, huevo, cacahuetes', 10.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai A')),
('Mango Sticky Rice', 'Postre tailandés con arroz y mango.', 'Arroz glutinoso, mango, leche de coco', 6.50, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai A')),
('Té Thai', 'Té tailandés con leche y azúcar.', 'Té, leche condensada, azúcar', 4.00, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai A')),
('Satay de Pollo', 'Brochetas de pollo marinadas en salsa de cacahuete.', 'Pollo, salsa de cacahuete, especias', 6.00, NULL, 1, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai B')),
('Tom Yum', 'Sopa tailandesa picante con camarones.', 'Camarones, hierba de limón, chile, caldo', 9.00, NULL, 2, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai B')),
('Sticky Rice con Durian', 'Postre de arroz glutinoso con durian.', 'Arroz glutinoso, durian, leche de coco', 7.00, NULL, 3, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai B')),
('Thai Iced Tea', 'Té helado tailandés con leche condensada.', 'Té, leche condensada, hielo', 4.50, NULL, 4, (SELECT id FROM restaurantes WHERE nombre_comercial = 'Thai B'));
