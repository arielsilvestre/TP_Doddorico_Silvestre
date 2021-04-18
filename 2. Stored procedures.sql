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
CREATE PROCEDURE CalcularLiquidacionMensual(IN id_rol_aux INT, IN id_proy_clm INT, IN id_cliente_aux INT, IN anio_clm INT, IN mes_clm INT)

BEGIN	
	DECLARE horas_rendidas INT DEFAULT 0;
	DECLARE horas_liquidadas INT DEFAULT 0;
	DECLARE horas_acumuladas INT DEFAULT 0;
		
	-- SUMO HORAS DEL PROYECTO PASADO COMO PARÁMETRO
	SET horas_rendidas = (SELECT SUM(ah.cantidad_horas) 
							FROM asignacion_horas as ah 
	                        INNER JOIN proyecto p ON p.id_proyecto = ah.id_proyecto
									   WHERE ah.id_proyecto = id_proy_clm);
				
	if horas_rendidas IS NULL 
	   then 
         SET horas_rendidas = 0;
	END if;
								
	-- ME FIJO SI YA HAY HORAS LIQUIDADAS PARA ESTE PROYECTO
	SET horas_liquidadas = (SELECT SUM(l.cantidad_horas) FROM liquidacion l 
										WHERE (l.id_proy = id_proy_clm AND l.anio_liq = anio_clm AND l.mes_liq = mes_clm AND l.id_rol = id_rol_aux)
									);
		
	if horas_liquidadas IS NULL 
	   then 
			SET horas_liquidadas = 0;
	END if; 
	
	SET horas_acumuladas =  horas_rendidas - horas_liquidadas;
  		If horas_acumuladas > 0 then
			INSERT INTO liquidacion (id_rol, id_proy, id_cliente, cantidad_horas, mes_liq, anio_liq) 
				VALUES (id_rol_aux, id_proy_clm, id_cliente_aux, horas_acumuladas, mes_clm, anio_clm);
			SET horas_rendidas = 0;
  	 		SET horas_acumuladas = 0;
  		END if;						
END
$$
