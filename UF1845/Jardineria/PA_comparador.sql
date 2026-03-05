drop procedure if exists comparador;

delimiter $$

create procedure comparador(primero int, segundo int)
begin
	
	declare relacion varchar(50);
	
	if primero > segundo then
		set relacion = "ES MAYOR QUE";
	elseif primero = segundo then
		set relacion = "ES IGUAL QUE";
	else
		set relacion = "ES MENOR QUE";
	end if;
	
	select CONCAT_WS(" ", primero, relacion, segundo) as resultado;


end $$

delimiter ;

call comparador(7,30);