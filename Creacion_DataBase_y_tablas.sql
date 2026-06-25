CREATE DATABASE IF NOT EXISTS PizzeriaCampus;

USE PizzeriaCampus;

CREATE TABLE Menu(
    id_menu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categorias VARCHAR(50) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE usuarios(
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    DNI INT NOT NULL
);


CREATE TABLE Productos(
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(50) NOT NULL,
    ingredientes VARCHAR(100) NOT NULL,
    precio_producto DECIMAL(10,2) NOT NULL,
    id_menu INT NOT NULL,
    FOREIGN KEY(id_menu) REFERENCES Menu(id_menu)
);


CREATE TABLE Adiciones(
    id_adicion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_adicion VARCHAR(50) NOT NULL,
    precio_adicion DECIMAL(10,2) NOT NULL,
    id_menu INT NOT NULL,
    FOREIGN KEY(id_menu) REFERENCES Menu(id_menu)
);


CREATE TABLE Combos(
    id_combo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_combo VARCHAR(50) NOT NULL,
    precio_especial DECIMAL NOT NULL,
    id_menu INT NOT NULL,
    FOREIGN KEY(id_menu) REFERENCES Menu(id_menu)
);


CREATE TABLE Pedidos(
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pedido_realizado VARCHAR(200) NOT NULL,
    adiciones_seleccionadas VARCHAR(100) NOT NULL,
    pedido_para_entregar BOOLEAN NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
);
