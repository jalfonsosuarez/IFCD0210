-- Devolver la cantidad de productos de una gama.
-- Devolver NO EXISTE si la gama no existe.

drop procedure if exists productos_por_gama;

delimiter $$

create procedure productos_por_gama(v_gama varchar(50))
begin

	declare v_existe int;
	
	SELECT count(*) into v_existe FROM producto p 
	WHERE p.gama = v_gama;
	
	IF v_existe = 0 THEN 
		SELECT "NO EXISTE" as respuesta;
	ELSE
		SELECT v_existe as respuesta;
	END IF;
		

end $$

delimiter ;

call productos_por_gama("Frutales")

call productos_por_gama("Merengues")