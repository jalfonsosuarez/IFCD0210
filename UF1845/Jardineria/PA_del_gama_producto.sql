drop procedure if exists del_gama_producto;

delimiter $$

create procedure del_gama_producto(v_gama varchar(50))
begin

	DELETE FROM gama_producto gp WHERE gp.gama = v_gama;

end $$

delimiter ;

call del_gama_producto('Nuevo');