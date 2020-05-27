CREATE DATABASE NEPTUNO2;

use NEPTUNO2;

CREATE TABLE proveedores(
	idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    NombreCompania VARCHAR (50),
    NombreContacto VARCHAR(50),
    Puesto VARCHAR(50),
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Region VARCHAR(50),
    CodPostal INT,
    Pais VARCHAR (50),
    Telefono VARCHAR(50),
    FAX VARCHAR(50),
    PagPrincipal VARCHAR(50)
);
 
CREATE TABLE productos(
	idProducto INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(50),
    idProveedor INT,
    idCategoria INT,
    CantporUnidad INT,
    PrecioUnidad INT,
    UnidadExistencia INT,
    UnidadPedido INT,
    NivelNuevoPedido VARCHAR(10),
    Suspendido VARCHAR(50)
);

CREATE TABLE categoria(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    NombreCategoria VARCHAR (50),
    Descripcion VARCHAR(100),
    Imagen VARCHAR(50)
);

CREATE TABLE detallesPedidos(
	idPedido INT,
    idProducto INT,
    PrecioUnidad INT,
    Cantidad INT,
    Descuento INT
);

CREATE TABLE empleados(
	idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    Apellidos VARCHAR(50),
    Nombre VARCHAR(50),
    Cargo VARCHAR(50),
    Tratamiento VARCHAR(100),
    FechaNacimiento DATE,
    FechaContratacion DATE,
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Region VARCHAR(50),
    CodPostal INT,
    Pais VARCHAR (50),
    TelDomicilio VARCHAR(50),
    Extencion VARCHAR(10),
    Foto VARCHAR(50),
    Notas VARCHAR(100),
    Jefe VARCHAR(50)
);

CREATE TABLE pedidos(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idEmpleado INT,
    FechaPedido DATE,
    FechaEntrega DATE,
    FechaEnvio DATE,
    FormaEnvio INT,
    Cargo VARCHAR(50),
    Destinatario VARCHAR(50),
    DireccionDestinatario VARCHAR(100),
    CiudadDestinatario VARCHAR(100),
    RegionDestinatario VARCHAR(50),
    CodPostalDestinatario INT,
    PaisDestinatario VARCHAR(50)
);

CREATE TABLE clientes(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    NombreCompania VARCHAR (50),
    NombreContacto VARCHAR(50),
    Puesto VARCHAR(50),
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    Region VARCHAR(50),
    CodPostal INT,
    Pais VARCHAR (50),
    Telefono VARCHAR(50),
    FAX VARCHAR(50)
);

CREATE TABLE companiasEnvios(
	idCompaniaEnvios INT AUTO_INCREMENT PRIMARY KEY,
    NombreCompania VARCHAR(50),
    Telefono VARCHAR(50)
);

ALTER TABLE productos
/*1. Se declara un index para la FK - 2. especificar el campo que tomara ese index
	3. especificar la tabla a relacionar - 4. especificar la PK de la tabla tabla de la paso 3*/
ADD CONSTRAINT FK_product_proveedor FOREIGN KEY (idProveedor) REFERENCES proveedores (idProveedor),
ADD CONSTRAINT FK_product_categoria FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria);

ALTER TABLE detallespedidos
ADD CONSTRAINT FK_detalles_pedido FOREIGN KEY(idPedido) REFERENCES pedidos (idPedido),
ADD CONSTRAINT FK_detalles_producto FOREIGN KEY(idProducto) REFERENCES productos(idProducto);

ALTER TABLE pedidos
ADD CONSTRAINT FK_pedido_empleado FOREIGN KEY(idEmpleado) REFERENCES empleados (idEmpleado),
ADD CONSTRAINT FK_pedido_cliente FOREIGN KEY (idCliente) REFERENCES clientes (idCliente),
ADD CONSTRAINT FK_pedido_formaenvio FOREIGN KEY(FormaEnvio) REFERENCES companiasenvios (idCompaniaEnvios);