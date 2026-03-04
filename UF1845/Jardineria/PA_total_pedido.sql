-- Calcular total del pedido


drop procedure if exists total_pedido;

delimiter $$

create procedure total_pedido(id_codigo_pedido int) 
begin
	
	SELECT dp.codigo_pedido, sum(dp.cantidad * dp.precio_unidad) as total 
	FROM detalle_pedido dp 
	WHERE dp.codigo_pedido = id_codigo_pedido
	GROUP BY dp.codigo_pedido;
	

end $$

delimiter ;


call total_pedido(3)