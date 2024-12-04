-- CREACIÓN DE DATOS PARA LAS TABLAS

-- CLIENTE
INSERT INTO cliente(id_cliente , id_cc , id_cf,nombre_cliente) VALUES (1,100,300,'Tuqsa');
INSERT INTO cliente(id_cliente , id_cc , id_cf,nombre_cliente) VALUES (2,101,301,'Lumilagro');
INSERT INTO cliente(id_cliente , id_cc , id_cf,nombre_cliente) VALUES (3,102,302,'XAMPP');
INSERT INTO cliente(id_cliente , id_cc , id_cf,nombre_cliente) VALUES (4,103,303,'Galimetal');
INSERT INTO cliente(id_cliente , id_cc , id_cf,nombre_cliente) VALUES (5,104,304,'Artudia');

-- PROYECTO
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 1','Ahi esta el tiburon',1);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit',2);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 3','Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',3);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 4','Sed do eiusmod tempor incididunt ut labore',4);
INSERT INTO proyecto(nombre , descripcion , id_cliente) VALUES ('Proyecto 5','Et dolore magna aliqua. Ut enim ad minim veniam',5);

-- ROL
INSERT INTO rol(descripcion) VALUES ('Project Manager');
INSERT INTO rol(descripcion) VALUES ('Desarrollador');
INSERT INTO rol(descripcion) VALUES ('DevOps');
INSERT INTO rol(descripcion) VALUES ('Tester');
INSERT INTO rol(descripcion) VALUES ('Administrador');

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

-- ASIGNACIÓN_HORAS
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (36,NOW(),1,2);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (50,NOW(),4,2);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (25,NOW(),2,3);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (80,NOW(),5,1);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (12,NOW(),2,2);
INSERT INTO asignacion_horas(cantidad_horas,fecha_ah,legajo,id_proyecto) VALUES (15,NOW(),3,4);

-- LIQUIDACIÓN
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (1,2,2,36,'2020-01-31');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (2,2,2,50,'2020-02-25');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (3,3,2,25,'2020-03-31');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (4,1,2,80,'2020-04-15');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (1,2,1,45,'2020-04-30');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (2,4,1,15,'2020-05-10');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (3,1,3,120,'2020-05-26');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (4,4,4,90,'2020-06-02');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (3,4,2,75,'2020-07-29');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (3,4,5,30,'2020-08-04');
INSERT INTO liquidacion(id_rol,id_proy,id_cliente,cantidad_horas,fecha_liq ) VALUES (4,4,2,60,'2020-08-30');

-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------

-- EJECUCIÓN DE LOS STORED PROCEDURES POR PRIMERA VEZ

CALL RendicionDeHoras ('diario',1,2,'2020-02-18',9); 
CALL RendicionDeHoras ('semanal',4,10,'2020-10-25',8);
CALL RendicionDeHoras ('mensual',3,4,'2020-06-01',5);

CALL CalcularLiquidacionMensual (2,1,1,'2021-05-02'); 

-- VUELVO A RENDIR LAS HORAS DIARIAS DEL PROYECTO 1 PARA EL MISMO MES Y AÑO

CALL RendicionDeHoras ('diario',1,2,'2020-11-30',9); 

-- VUELVO A LIQUIDAR LAS HORAS PARA EL PROYECTO 1.

CALL CalcularLiquidacionMensual (2,1,1,'2021-05-31'); 

-- PROBAMOS CAMBIAR LAS HORAS LIQUIDADAS REGISTRADAS BAJO EL ID 6 EN LA TABLA LIQUIDACIÓN
UPDATE liquidacion SET cantidad_horas = 80 WHERE id_liquidacion = 6;

-- PROBAMOS CAMBIAR HORAS ASIGNADAS YA LIQUIDADAS EN LA TABLA ASIGNACION_HORAS
UPDATE asignacion_horas SET cantidad_horas = 90 WHERE id_proyecto = 1 AND fecha_ah = '2021-04-22'; 
UPDATE asignacion_horas SET cantidad_horas = 10 WHERE id_proyecto = 4 AND fecha_ah = '2020-10-25';