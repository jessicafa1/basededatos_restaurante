-- Crear la base de datos
CREATE DATABASE restaurante;
USE Restaurante;

-- Tabla empleados
CREATE TABLE empleados (
    DNI VARCHAR(20)  NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL ,
    Apellidos VARCHAR(50) NOT NULL,
    Dirección VARCHAR(200) DEFAULT NULL,
    Ciudad VARCHAR(50)DEFAULT NULL,
    Teléfono VARCHAR(20)NOT NULL,
    FechaAlta DATE NOT NULL,
    Categoría VARCHAR(50) NOT NULL,
    Salario INT (200) NOT NULL
);

-- Tabla cocineros
CREATE TABLE cocineros (
    DNI varchar (20) UNIQUE, FOREIGN KEY (DNI) REFERENCES empleados (DNI),
    Puesto VARCHAR(50),
    Especialidad VARCHAR(50)
);

-- Tabla administracion
CREATE TABLE administracion (
    DNI varchar (20) UNIQUE, FOREIGN KEY (DNI) REFERENCES empleados (DNI),
    Cargo VARCHAR(50)
);

-- Tabla camareros
CREATE TABLE camareros (
   DNI varchar (20) UNIQUE, FOREIGN KEY (DNI) REFERENCES empleados (DNI),
   Turno VARCHAR(50),
   Años INT (6),
   DNI_encargado VARCHAR(20) UNIQUE,
   FOREIGN KEY (DNI_encargado) REFERENCES empleados(DNI)
);

-- Tabla comedores
CREATE TABLE comedores (
    CodigoC INT(11) PRIMARY KEY,
    Capacidad VARCHAR(50),
    Nmesas INT(50),
    Localizacion VARCHAR(50)
);

-- Tabla mesas
CREATE TABLE mesas (
    CodigoM INT(6) PRIMARY KEY,
    CodigoC INT(6),
    FOREIGN KEY (CodigoC) REFERENCES comedores (CodigoC),
    Nasientos INT(6),
    DNI_camarero VARCHAR(20) UNIQUE,
    FOREIGN KEY (DNI_camarero) REFERENCES empleados (DNI)
);
-- Tabla HACEN 
CREATE TABLE hacen (
   CodigoM INT(6) ,FOREIGN KEY (CodigoM) REFERENCES mesas (CodigoM),
   CodigoC INT(6),FOREIGN KEY (CodigoC) REFERENCES comedores (CodigoC),
   Nreserva INT (6) PRIMARY KEY,
   NasientoR INT (6)

);
-- Tabla RESERVAS 
CREATE TABLE reservas (
   Nreserva INT (6),FOREIGN KEY (Nreserva) REFERENCES hacen (Nreserva),
   hreserva TIME, 
   Nombre VARCHAR(20), 
   Fhreservada DATETIME,
   Comida_Cena VARCHAR (20), 
   Npersonas INT (20), 
   Varios VARCHAR (100)
);



-- Tabla FACTURAS
CREATE TABLE FACTURAS (
  NFactura INT(6) PRIMARY KEY,
  FechaF DATETIME, 
  CodigoM INT (6),FOREIGN KEY (CodigoM) REFERENCES mesas(CodigoM), 
  CodigoC INT (6), FOREIGN KEY (CodigoC) REFERENCES comedores (CodigoC)
  
  
  )
;

-- Tabla incluyen
CREATE TABLE incluyen (
    NFactura INT(6) NOT NULL,FOREIGN KEY (NFactura) REFERENCES facturas(NFactura), 
    CodigoPl INT(6) NOT NULL PRIMARY KEY ,
    Unidades INT(6)
   
);

-- Tabla platos
CREATE TABLE platos (
    CodigoPl INT ,FOREIGN KEY (CodigoPl) REFERENCES incluyen (CodigoPl),
    Nombre VARCHAR(20) NOT NULL,
    Descripcion TEXT(200),
    Tipo VARCHAR(50),
    Precio DECIMAL(10, 2) NOT NULL
);


-- Tabla Contienen
CREATE TABLE Contienen (
    CodigoPl INT(6),
    FOREIGN KEY (CodigoPl) REFERENCES platos(CodigoPl),
    CodigoPr INT(6) PRIMARY KEY,
    Cantidad INT(6)
);

-- Tabla Productos
CREATE TABLE Productos (
    CodigoPr INT(6),
    FOREIGN KEY (CodigoPr) REFERENCES Contienen(CodigoPr),
    Descripcion TEXT(300),
    Stock INT(20),
    UnidadBase INT(10),
    PrecioU DECIMAL(10, 2),
    Categoria VARCHAR(20),
    CodigoPro INT(6) PRIMARY KEY 
   
);

-- Tabla proveedores
CREATE TABLE proveedores (
    CodigoPro INT(6) ,
    FOREIGN KEY (CodigoPro) REFERENCES Productos(CodigoPro),
    Dirección TEXT(100) ,
    CP INT(6),
    Teléfono VARCHAR(20) NOT NULL,
    Fax VARCHAR(20),
    Contacto VARCHAR(100) 
);
