drop procedure if exists rentabilidad_pedido_fechas;

delimiter $$

create procedure rentabilidad_pedido_fechas(desde date, hasta date)
begin

	SELECT dp.codigo_pedido, sum(dp.cantidad * dp.precio_unidad) - sum(dp.cantidad * p.precio_proveedor) AS rentabilidad FROM detalle_pedido dp 
	JOIN producto p ON p.codigo_producto = dp.codigo_producto 
	JOIN pedido p2 ON p2.codigo_pedido = dp.codigo_pedido 
	WHERE p2.fecha_pedido BETWEEN desde AND hasta
	GROUP BY dp.codigo_pedido;

end $$

delimiter ;

call rentabilidad_pedido_fechas('2006-01-01', '2006-05-25');