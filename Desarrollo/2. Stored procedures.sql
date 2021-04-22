delimiter $$
DROP PROCEDURE if EXISTS RendicionDeHoras;
CREATE PROCEDURE RendicionDeHoras(IN caso VARCHAR(50), IN id_proy INT, IN id_legajo INT, IN fecha DATE, IN horas_rendidas INT) 

BEGIN
   DECLARE fecha_actual DATE;
	
	/* Rendición de horas por día */ 
  if caso = 'diario'
 	 then
 	 INSERT INTO asignacion_horas (cantidad_horas, fecha_ah, legajo, id_proyecto) 
	  		VALUES (horas_rendidas, fecha, id_legajo, id_proy);
	 END if; 
	 
  /* Rendición de horas por semana */	 
  if caso = 'semanal'
 	 then
  	 SET fecha_actual = ADDDATE(fecha, INTERVAL 1 WEEK);
  	 while fecha < fecha_actual 
		DO 
 	 		INSERT INTO asignacion_horas (cantidad_horas, fecha_ah, legajo, id_proyecto)  
	  			VALUES (horas_rendidas, fecha, id_legajo, id_proy);
	  		SET fecha = ADDDATE(fecha, INTERVAL 1 DAY);
	 END while;
  END if;   
	    
  /* Rendición de horas por mes */	 
  if caso = 'mensual'
 	 then
  	 SET fecha_actual = ADDDATE(fecha, INTERVAL 1 MONTH);
  	 while fecha < fecha_actual 
		DO 
 	 		INSERT INTO asignacion_horas (cantidad_horas, fecha_ah, legajo, id_proyecto) 
	  			VALUES (horas_rendidas, fecha, id_legajo, id_proy);
	  		set fecha = ADDDATE(fecha, INTERVAL 1 day);
	 END while;
  END if;  
      
END
$$

delimiter $$
DROP PROCEDURE if EXISTS CalcularLiquidacionMensual;
CREATE PROCEDURE CalcularLiquidacionMensual(IN id_rol_aux INT, IN id_proy_clm INT, IN id_cliente_aux INT, IN fecha_liq_aux DATE)

BEGIN	
	DECLARE horas_rendidas INT DEFAULT 0;
	SET horas_rendidas = (SELECT SUM(ah.cantidad_horas) FROM asignacion_horas ah 
	                        INNER JOIN proyecto p ON p.id_proyecto = ah.id_proyecto
									   WHERE ah.id_proyecto = id_proy_clm);
				
	if horas_rendidas IS NULL 
	   then 
         SET horas_rendidas = 0;
	END if;


  	If horas_rendidas > 0 
	  then
			INSERT INTO liquidacion (id_rol, id_proy, id_cliente, cantidad_horas, fecha_liq) 
				VALUES (id_rol_aux, id_proy_clm, id_cliente_aux, horas_rendidas, fecha_liq_aux);
			SET horas_rendidas = 0;
  	END if;						
END
$$

-- IMPLEMENTAMOS UN TRIGGER PARA EVITAR QUE SE MODIFIQUEN LAS HORAS LIQUIDADAS DE UN PROYECTO
delimiter $$
DROP TRIGGER if EXISTS no_modificar_horas;
CREATE TRIGGER no_modificar_horas
	BEFORE UPDATE
	ON liquidacion FOR EACH ROW
BEGIN
	IF OLD.cantidad_horas != NEW.cantidad_horas then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: Las horas ya liquidadas no pueden ser modificadas.';
	END IF;
END;
$$

-- IMPLEMENTAMOS UN TRIGGER PARA EVITAR QUE SE MODIFIQUEN LAS HORAS ASIGNADAS YA LIQUIDADAS
delimiter $$
DROP TRIGGER if EXISTS no_modificar_horas_asignadas;
CREATE TRIGGER no_modificar_horas_asignadas
	BEFORE UPDATE
	ON asignacion_horas FOR EACH ROW
BEGIN
	IF OLD.cantidad_horas != NEW.cantidad_horas 
	then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: Las horas asignadas ya liquidadas no pueden ser modificadas.';
	END IF;
	
	IF (SELECT ah.fecha_ah FROM asignacion_horas ah) < (SELECT l.fecha_liq FROM liquidacion l)
	then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: Las horas asignadas ya liquidadas no pueden ser modificadas.';
	END IF;
	 
	IF (SELECT l.id_proy FROM liquidacion l) = (SELECT ah.id_proyecto FROM asignacion_horas ah)
	then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: Las horas asignadas ya liquidadas no pueden ser modificadas.';
	END IF;
END;
$$