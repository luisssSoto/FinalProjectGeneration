SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `yukart` DEFAULT CHARACTER SET utf8mb4;
USE `yukart`;


-- TABLA categorias
CREATE TABLE IF NOT EXISTS `yukart`.`categorias`(
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(255),
  PRIMARY KEY (id)
)
ENGINE = InnoDB;

INSERT INTO categorias (nombre, descripcion) 
	VALUES
    ('Accesorios', 'Accesorios para el hogar y la moda'),
  ('Art-hand', 'Obras de arte hechas por manos yucatecas mediante tecnicas ancestrales'),
  ('Juguetes', 'Juguetes y juegos para niños y adultos'),
  ('Máscaras', 'Máscaras para todo tipo de eventos'),
  ('Pinturas', 'Pinturas y material para arte'),
  ('Prendas', 'Ropa y accesorios de moda'),
  ('Utensilios', 'Utensilios de cocina y hogar');
    

-- TABLA productos
CREATE TABLE IF NOT EXISTS `yukart`.`productos`(
   id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES categorias (id)
)


ENGINE = InnoDB;
    
INSERT INTO productos (nombre, descripcion, precio, id_categoria) VALUES
('Aretes lindo cielo', 'Aretes elaborados con chapa de oro, colores celestes', 200.00, 1),
('Mochila', 'Mochila hecha de material sintetico completamente biodegradable', 650.00, 1),
('Gafas', 'Gafas con proteccion contra luz azul', 600.00, 1),
('Cilindro huichol', 'Pieza decorativa que representa la unidad familiar ', 1300.00, 2),
('Craneo huichol', 'Craneo conmemorativo del dia de muertos', 3150.00, 2),
('Pulseras huichol', 'Pulseras condiseños tipicos huicholes', 250.00, 2),
('Yoyo', 'Juguete tradicional mexicano hecho en madera', 50.00, 3),
('Muñeco realista', 'Muñeco minuciosamente detallado de alta durabilidad', 2250.00, 3),
('Trompo', 'Trompo tradicional con colores representativos', 50.00, 3),
('Máscara ogro azul', 'Mascara ceremonial de entidades mitologicas', 1350.00, 4),
('Máscara lobo', 'Mascara representativa del animal sagrado en la cultura nativa', 1730.00, 4),
('Alebrije máscara', 'Mascara representativa de las leyendas locales', 800.00, 4),
('Mundo cuadro', 'Pintura abstracta moderna', 1000.00, 5),
('La noche vaca', 'Cuadro decorativo en tonos oscuros', 750.00, 5),
('Piel de jaguar', 'Pintura con concepto tradicional al etilo contemporaneo', 1350.00, 5),
('Camisa botones', 'Camisa en color intenso', 300.00, 6),
('Conjunto 3 piezas', 'Conjunto típico de la cultura mexicana', 1500.99, 6),
('Sombrero yucateco', 'Sombrero tradicional yucateco de la mas alta calidad', 250.00, 6),
('Molcajete', 'Utencilio especializado para la elaboracion de salsas', 500.00, 7),
('Utensilios de madera', 'Juego de cubiertos indispensable para todo comensal', 250.00, 7),
('Tabla de madera', 'Tabla para picar de la mejor calidad', 300.00, 7);

-- TABLA usuarios
CREATE TABLE IF NOT EXISTS `yukart`.`usuarios`(
     id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(20),
    PRIMARY KEY (id),
    UNIQUE (correo)
)


ENGINE = InnoDB;


-- TABLA carrito de compras
CREATE TABLE IF NOT EXISTS `yukart`.`carrito de compras`(
      id INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
)

ENGINE = InnoDB;

CREATE TABLE productos_carrito (
    id INT NOT NULL AUTO_INCREMENT,
    producto_id INT NOT NULL,
    carrito_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (carrito_id) REFERENCES carrito_de_compras(id)
);



-- TABLA checkout
CREATE TABLE IF NOT EXISTS `yukart`.`checkout`(
      id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    carrito_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    direccion_envio VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (carrito_id) REFERENCES carrito_compras(id)
)

ENGINE = InnoDB;