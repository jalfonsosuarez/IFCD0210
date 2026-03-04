CREATE VIEW resumen_pedidos AS
	SELECT p.codigo_pedido, dp.numero_linea, p.estado, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega , c.nombre_cliente,
	p2.descripcion, dp.cantidad, dp.precio_unidad 
	FROM pedido p 
	JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
	JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido 
	JOIN producto p2 ON p2.codigo_producto = dp.codigo_producto 


