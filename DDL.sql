Diseño gourmet Delight | Examen mySQL | Oscar Fabian Mantilla Ochoa

#### DDL.sql Comandos de creacion de tablas Y DML.sql Comandos de Inserción de datos
-- Creacion de base de datos
DROP DATABASE IF EXISTS GourmetDelight;
CREATE DATABASE GourmetDelight;

-- Seleccion de base de datos
USE GourmetDelight;

-- Creacion de la tabla gourmetdelight.clientes
CREATE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE,
    CONSTRAINT Clientes_Id PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Creacion de la tabla gourmetdel.pedidos
CREATE TABLE pedidos (
    id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha DATE,
    total DECIMAL(10, 2),
    CONSTRAINT PK_Pedidos_Id PRIMARY KEY(id),
    CONSTRAINT FK_Clientes_Id FOREIGN KEY(id_cliente) REFERENCES clientes(id)
) ENGINE=InnoDB;

-- Creacion de la tabla menus
CREATE TABLE menus (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    precio DECIMAL(10, 2),
    CONSTRAINT Menus_Id PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Creacion de la tabla detallesPedidos
CREATE TABLE detallespedidos (
    id_pedido INT NOT NULL,
    id_menu INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2),
    CONSTRAINT detallespedidos_Id PRIMARY KEY(id_pedido, id_menu),
    CONSTRAINT FK_Pedidos_Id FOREIGN KEY(id_pedido) REFERENCES pedidos(id),
    CONSTRAINT FK_Menus_Id FOREIGN KEY(id_menu) REFERENCES menus(id)
) ENGINE=InnoDB;

