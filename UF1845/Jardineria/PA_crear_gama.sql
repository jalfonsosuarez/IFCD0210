-- Insertar una nueva gama. Si ya existe, cancelar operación y devolver un error.
-- Si funciona devolver OK.

drop procedure if exists crear_gama;

delimiter $$

create procedure crear_gama(v_gama varchar(50), v_texto text, v_html text, v_imagen varchar(256))
begin
	
	DECLARE existe int;
	
	SELECT count(*) INTO existe FROM gama_producto WHERE gama = v_gama;
	
	IF existe = 1 THEN
	
		SELECT "GAMA YA EXISTE" as resultado;
	
	ELSE
	
		INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen)
		VALUES (v_gama, v_texto, v_html, v_imagen);
		
		SELECT "OK" as resultado;

	END IF;

end $$

delimiter ;

call crear_gama("Rosales", "Rosales de rosas", null, null)
	
call crear_gama("Frutales", "Rosales de rosas", null, null)