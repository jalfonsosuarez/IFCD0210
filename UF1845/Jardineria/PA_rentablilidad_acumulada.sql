drop procedure if exists rentabilidad_acumulada;

delimiter $$

create procedure rentabilidad_acumulada(desde date, hasta date)
begin

	SELECT sum(dp.cantidad * dp.precio_unidad) - sum(dp.cantidad * p.precio_proveedor) AS rentabilidad FROM detalle_pedido dp 
	JOIN producto p ON p.codigo_producto = dp.codigo_producto 
	JOIN pedido p2 ON p2.codigo_pedido = dp.codigo_pedido 
	WHERE p2.fecha_pedido BETWEEN desde AND hasta;

end $$

delimiter ;

call rentabilidad_acumulada('2006-01-01', '2026-05-25');