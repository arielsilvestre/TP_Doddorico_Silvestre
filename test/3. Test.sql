-- CREACIÓN DE DATOS PARA LAS TABLAS
-- ROL
INSERT INTO rol(descripcion) VALUES ('Project Manager');
INSERT INTO rol(descripcion) VALUES ('Desarrollador');
INSERT INTO rol(descripcion) VALUES ('DevOps');
INSERT INTO rol(descripcion) VALUES ('Tester');
INSERT INTO rol(descripcion) VALUES ('Administrador');

-- CLIENTE
INSERT INTO cliente(id_cc , id_cf,nombre_cliente) VALUES (100,300,'Tuqsa');
INSERT INTO cliente(id_cc , id_cf,nombre_cliente) VALUES (101,301,'Lumilagro');
INSERT INTO cliente(id_cc , id_cf,nombre_cliente) VALUES (102,302,'XAMPP');
INSERT INTO cliente(id_cc , id_cf,nombre_cliente) VALUES (103,303,'Galimetal');
INSERT INTO cliente(id_cc , id_cf,nombre_cliente) VALUES (104,304,'Artudia');

-- PROYECTO
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 1','Ahi esta el tiburon',1);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit',2);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 3','Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',3);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 4','Sed do eiusmod tempor incididunt ut labore',4);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 5','Et dolore magna aliqua. Ut enim ad minim veniam',5);

-- PERSONA
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Jaco Pastorius',160,2,'Project Manager',1);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Bill Evans',80,1,'Desarrollador',2);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Bobby Hackett',160,2,'Desarrollador',2);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Victor Bailey',160,3,'Desarrollador',2);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('John Patitucci',80,2,'DevOps',3);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Johnny Dodds',160,5,'Project Manager',1);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Michael League',80,2,'Administrador',5);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Alex Lifeson',160,1,'Tester',4);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Oscar Aleman',160,2,'Tester',4);
INSERT INTO persona(nombre_apellido , horas_mensuales , id_proyecto,rol,id_rol) VALUES ('Bill Laurance',160,4,'Desarrollador',3);

-- ASIGNACIÓN_HORAS
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (36,NOW(),1,2);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (50,NOW(),4,2);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (25,NOW(),2,3);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (80,NOW(),5,1);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (12,NOW(),2,2);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (15,NOW(),3,4);

-- PARTICIPACIÓN
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Jaco Pastorius',1,2,1,'Project Manager',20);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Bill Evans',2,1,2,'Desarrollador',41);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Bobby Hackett',3,2,2,'Desarrollador',23);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Victor Bailey',4,3,2,'Desarrollador',52);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('John Patitucci',5,2,3,'DevOps',23);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Johnny Dodds',6,5,1,'Project Manager',21);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Michael League',7,2,5,'Administrador',12);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Alex Lifeson',8,1,4,'Tester',31);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Oscar Aleman',9,2,4,'Tester',35);
INSERT INTO participacion(persona , legajo , id_proyecto, id_rol, rol, asignacion_horas) VALUES ('Bill Laurance',10,4,2,'Desarrollador',50);

-- LIQUIDACIÓN
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (1,2,2,60,2,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (2,2,2,65,6,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (3,2,2,160,4,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (4,2,2,60,11,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (1,1,1,65,9,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (2,1,1,80,7,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (3,3,3,85,3,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (4,4,4,60,8,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (3,2,2,50,6,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (3,5,5,140,7,2020);
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,mes_liq,anio_liq) VALUES (4,2,2,100,12,2020);

-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------

-- EJECUCIÓN DE LOS STORED PROCEDURES

CALL RendicionDeHoras ('diario',1,2,'2020-02-18',9); 
CALL RendicionDeHoras ('semanal',4,10,'2020-10-25',8);
CALL RendicionDeHoras ('mensual',3,4,'2020-06-01',5);

CALL CalcularLiquidacionMensual (2,1,1,2021,01); IN id_rol_aux INT, IN id_proy_clm INT, IN id_cliente_aux INT, IN anio_clm INT, IN mes_clm INT

SELECT * FROM liquidacion;
SELECT * FROM asignacion_horas;
