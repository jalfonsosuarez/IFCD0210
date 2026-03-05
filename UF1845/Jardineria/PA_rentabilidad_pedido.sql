drop procedure if exists rentabilidad_pedido;

delimiter $$

create procedure rentabilidad_pedido(numero_pedido int)
begin

	SELECT dp.codigo_pedido, sum(dp.cantidad * dp.precio_unidad) - sum(dp.cantidad * p.precio_proveedor) AS rentabilidad FROM detalle_pedido dp 
	JOIN producto p ON p.codigo_producto = dp.codigo_producto 
	WHERE dp.codigo_pedido = numero_pedido
	GROUP BY dp.codigo_pedido;

end $$

delimiter ;

call rentabilidad_pedido(109);