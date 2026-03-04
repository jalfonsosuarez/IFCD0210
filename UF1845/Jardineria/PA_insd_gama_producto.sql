use jardineria;

drop procedure if exists ins_gama_producto;

delimiter $$

create procedure ins_gama_producto(v_gama varchar(50), v_desc varchar(100), v_desc_html varchar(100), v_imagen varchar(256))
begin

	INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES (v_gama, v_desc, v_desc_html, v_imagen);
	
	SELECT * FROM gama_producto AS gp WHERE gp.gama = v_gama;
	
end $$

delimiter ;

call ins_gama_producto('Otro2', 'Productos de otros2', null, null)