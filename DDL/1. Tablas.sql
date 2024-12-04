CREATE DATABASE proyecto_bd2;
USE proyecto_bd2;

CREATE TABLE persona(
   legajo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nombre_apellido VARCHAR (100),
   horas_mensuales INT NOT NULL,
   id_proyecto INT NOT NULL,
   rol VARCHAR(100),
   id_rol INT NOT NULL,
   CONSTRAINT fk_id_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
   CONSTRAINT fk_id_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE cliente(
	id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_cc INT NOT NULL, -- ID del Centro de Costos
	id_cf INT NOT NULL, -- ID del Centro de Facturación
	nombre_cliente VARCHAR(100)		
	);
	
CREATE TABLE proyecto(
	id_proyecto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100),
	descripcion VARCHAR(100),
	id_cliente INT NOT NULL,
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	);

CREATE TABLE participacion(
   id_participacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	persona VARCHAR(100),
   legajo INT NOT NULL,
   id_proyecto INT NOT NULL,
   id_rol INT NOT NULL,
   rol VARCHAR(150),
   asignacion_horas INT NOT NULL,
   CONSTRAINT fk_id_pro_p FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
   CONSTRAINT fk_id_rol_pa FOREIGN KEY (id_rol) REFERENCES rol(id_rol),
   CONSTRAINT fk_id_legajo FOREIGN KEY (legajo) REFERENCES persona(legajo)
   );

CREATE TABLE rol(
	id_rol INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(100) 
	);
	
CREATE TABLE asignacion_horas(
	cantidad_horas INT NOT NULL,
	fecha_ah DATE, 
	legajo INT NOT NULL,
	id_proyecto INT NOT NULL,
	CONSTRAINT fk_id_persona FOREIGN KEY (legajo) REFERENCES persona(legajo),
	CONSTRAINT fk_id_pro_ah FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
	);

CREATE TABLE liquidacion(
   id_liquidacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   id_rol INT NOT NULL, 
   id_proy INT NOT NULL, 
   id_cliente INT NOT NULL,
   cantidad_horas INT NOT NULL,
   fecha_liq DATE,
   CONSTRAINT fk_id_rol_l FOREIGN KEY (id_rol) REFERENCES rol(id_rol),
   CONSTRAINT fk_id_pro_l FOREIGN KEY (id_proy) REFERENCES proyecto(id_proyecto),
   CONSTRAINT fk_id_cliente_l FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
