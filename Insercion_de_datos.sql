USE PizzeriaCampus;

-- USUARIOS
INSERT INTO usuarios (nombre_usuario, DNI) VALUES
('Juan Perez', 12345678),
('Maria Gomez', 23456789),
('Carlos Rodriguez', 34567890),
('Ana Martinez', 45678901),
('Luis Torres', 56789012);

-- MENU
INSERT INTO Menu (categorias, id_usuario) VALUES
('Pizzas', 1),
('Bebidas', 2),
('Postres', 3),
('Combos Familiares', 4),
('Adiciones', 5);

-- PRODUCTOS
INSERT INTO Productos (nombre_producto, ingredientes, precio_producto, id_menu) VALUES
('Pizza Hawaiana', 'Queso, jamon, pina', 25000.00, 1),
('Pizza Pepperoni', 'Queso, pepperoni', 28000.00, 1),
('Gaseosa Coca-Cola', 'Bebida gaseosa', 5000.00, 2),
('Brownie', 'Chocolate, harina, azucar', 8000.00, 3),
('Pizza Mexicana', 'Queso, carne, jalapenos', 30000.00, 1);

-- ADICIONES
INSERT INTO Adiciones (nombre_adicion, precio_adicion, id_menu) VALUES
('Queso Extra', 3000.00, 5),
('Tocineta', 4000.00, 5),
('Champinones', 2500.00, 5),
('Pollo', 5000.00, 5),
('Maiz', 2000.00, 5);

-- COMBOS
INSERT INTO Combos (nombre_combo, precio_especial, id_menu) VALUES
('Combo Personal', 32000.00, 4),
('Combo Pareja', 55000.00, 4),
('Combo Familiar', 85000.00, 4),
('Combo Amigos', 70000.00, 4),
('Mega Combo', 120000.00, 4);

-- PEDIDOS
INSERT INTO Pedidos (
    pedido_realizado,
    adiciones_seleccionadas,
    pedido_para_entregar,
    precio_total,
    id_usuario
) VALUES
('Pizza Hawaiana', 'Queso Extra', TRUE, 28000.00, 1),
('Pizza Pepperoni', 'Tocineta', FALSE, 32000.00, 2),
('Pizza Mexicana', 'Pollo, Maiz', TRUE, 37000.00, 3),
('Combo Familiar', 'Champinones', TRUE, 87500.00, 4),
('Brownie y Coca-Cola', 'Ninguna', FALSE, 13000.00, 5);