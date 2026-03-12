-- Examen UF1845 - Parte práctica
-- ------------------------------

-- Ejercicios SQL sobre la base de datos jardineria

-- 1. Obtener el nombre y precio de venta de todos los productos.

	SELECT p.nombre, p.precio_venta FROM producto p;
	
	-- 2. Mostrar los clientes que pertenecen a España.
	
	SELECT * FROM cliente c WHERE lower(c.pais) IN ('españa', 'spain');
	
-- 3. Mostrar los productos ordenados por precio de venta de mayor a menor.
	
	SELECT * FROM producto p ORDER BY p.precio_venta DESC;
	
-- 4. Mostrar el nombre del cliente y el código de los pedidos que ha realizado.
	
	SELECT c.nombre_cliente, p.codigo_pedido  FROM cliente c 
	JOIN pedido p ON p.codigo_cliente = c.codigo_cliente;
	
-- 5. Mostrar el nombre del cliente, el código del pedido y el nombre del producto comprado.
	
	SELECT c.nombre_cliente, p.codigo_pedido, p2.nombre FROM cliente c 
	JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
	JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido
	JOIN producto p2 ON p2.codigo_producto = dp.codigo_producto;
	
-- 6. Contar cuántos clientes hay registrados en la base de datos.
	
	SELECT count(*) as total_clientes FROM cliente c;
	
-- 7. Calcular el precio medio de venta de los productos.
	
	SELECT avg(p.precio_venta) as precio_medio_venta FROM producto p;
	
-- 8. Mostrar cuántos productos hay en cada gama de productos.
	
	SELECT p.gama, count(p.gama) as productos_por_gama FROM producto p
	GROUP BY p.gama;
	
-- 9. Actualizar el teléfono del cliente con código 10 a '600123456'.
	
	UPDATE cliente SET telefono = '600123456' WHERE codigo_cliente = 10;
	
	SELECT telefono FROM cliente WHERE codigo_cliente = 10;
	
-- 10. Eliminar los pagos realizados antes del 1 de enero de 2005.
	
	DELETE FROM pago WHERE fecha_pago < '2005-01-01';