-- Calcular importe medio de los pedidos de un cliente

drop procedure if exists importe_medio_cliente;

delimiter $$

create procedure importe_medio_cliente(v_cod_cli int)
begin

	SELECT avg(dp.cantidad * dp.precio_unidad) AS media FROM pedido p 
	JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido 
	WHERE p.codigo_cliente = v_cod_cli;

end $$

delimiter ;

call importe_medio_cliente(5)