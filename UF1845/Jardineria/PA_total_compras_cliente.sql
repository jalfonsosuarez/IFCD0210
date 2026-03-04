-- Calcular el total de compras de un cliente

drop procedure if exists total_compras_cliente;

delimiter $$

create procedure total_compras_cliente(v_codigo_cliente int)
begin
	
	SELECT c.nombre_cliente, sum(dp.cantidad * dp.precio_unidad ) as total FROM pedido p
	INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente 
	INNER JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido 
	WHERE p.codigo_cliente = v_codigo_cliente
	GROUP BY p.codigo_cliente;


end $$

delimiter ;

call total_compras_cliente(4)