	SELECT c.nombre_cliente, sum(dp.cantidad * dp.precio_unidad ) as total FROM pedido p
	INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente 
	INNER JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido 
	GROUP BY p.codigo_cliente
	HAVING total > 5000;