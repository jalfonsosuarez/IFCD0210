drop procedure if exists comprueba_nulos;

delimiter $$

create procedure comprueba_nulos(cadena1 varchar(50), cadena2 varchar(50))
begin

	declare resultado varchar(100);
	
	set resultado = ifnull(concat(cadena1, cadena2), "Las cadenas son nulas.");
	
	select resultado;

end $$

delimiter ;

call comprueba_nulos("43", "ff");∫