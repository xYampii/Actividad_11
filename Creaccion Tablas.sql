-- Creación de la tabla Puestos
CREATE TABLE Puestos (
  id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100)
);

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
  id_cliente INT(6) UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  apellidos VARCHAR(60) NOT NULL,
  NIT VARCHAR(15),
  genero BIT,
  telefono VARCHAR(20),
  correo_electronico VARCHAR(60),
  fechaingreso DATETIME)
;

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
  id_Empleado INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  apellido VARCHAR(60) NOT NULL,
  direccion VARCHAR(50),
  telefono VARCHAR(20),
  DPI VARCHAR(15),
  genero BIT,
  fecha_nacimeinto DATE,
  idPuesto smallint(6) UNSIGNED,
  fecha_inicio_Labores DATE,
  fechaingreso DATETIME,
  FOREIGN KEY (puesto_id) REFERENCES Puestos(id)
);

-- Creación de la tabla Ventas
CREATE TABLE Ventas (
  idventa INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nofactura INT(6) UNSIGNED,
  serie CHAR (1), 
  fechafactura DATE,
  idcliente INT,
  idempleado INT,
  fechaingreso DATETIME, 
  FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- Creación de la tabla Ventas_detalle
CREATE TABLE Ventas_detalle (
  idventa_detalle BIGINT  UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idventa INT(6) UNSIGNED,
  idProducto INT(6) UNSIGNED,
  cantidad VARCHAR(6),
  precio_ DECIMAL(10,2),
  FOREIGN KEY (venta_id) REFERENCES Ventas(id),
  FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Creación de la tabla Productos
CREATE TABLE Productos (
  idproducto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  producto VARCHAR(50) NOT NULL,
  idMarca SMALLINT,
  Descripcion VARCHAR(100),
  Imagen VARCHAR(30),
  precio_costo DECIMAL (8,2), 
  precio_venta DECIMAL (8,2),
  existencia INT(6) UNSIGNED,
  fecha_ingreso DATETIME,
  FOREIGN KEY (marca_id) REFERENCES Marcas(id)
);

-- Creación de la tabla Marcas
CREATE TABLE Marcas (
  idmarca SMALLINT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
  marca VARCHAR(30) NOT NULL
);

-- Creación de la tabla Compras
CREATE TABLE Compras (
  idCOMPRA INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
  no_orden_compra INT, 
  idproveedor INT(6) UNSIGNED,
  fecha_orden DATE,
  fechaingresO DATETIME,
  FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id)
);

-- Creación de la tabla Compras_detalles
CREATE TABLE Compras_detalles (
  idcompra_detalle INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idcompra INT UNSIGNED,
  idproducto INT UNSIGNED,
  cantidad INT,
  precio_costo_unitario DECIMAL(10,2),
  FOREIGN KEY (compra_id) REFERENCES Compras(id),
  FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Creación de la tabla Proveedores
CREATE TABLE Proveedores (
  idProveedores INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  proveedor VARCHAR(70) NOT NULL,
  nit VARCHAR(12),
  direccion VARCHAR (100),
  telefono VARCHAR(30)
);	

