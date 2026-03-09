
DROP FUNCTION IF EXISTS area_circulo;

delimiter $$

CREATE FUNCTION area_circulo(radio double) RETURNS double
deterministic
begin
	
	return pi() * power(radio, 2);
	
end $$

delimiter ;


SELECT area_circulo(3);

SELECT dp.codigo_pedido, area_circulo(dp.numero_linea) as Area 
	FROM detalle_pedido dp