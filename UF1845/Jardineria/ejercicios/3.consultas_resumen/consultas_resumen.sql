-- Consultas resumen
-- ----------------------

-- 1. ¿Cuántos empleados hay en la compañía?
-- 2. ¿Cuántos clientes tiene cada país?
-- 3. ¿Cuál fue el pago medio en 2009?
-- 4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

SELECT count(*) as total_pedidos, estado FROM pedido GROUP BY estado ORDER BY total_pedidos DESC

-- 5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

SELECT max(precio_venta) AS maximo, min(precio_venta) AS minimo FROM producto

-- 5a. Producto mas rentable

SELECT nombre, precio_venta - precio_proveedor as beneficio FROM producto ORDER BY beneficio DESC LIMIT 1

-- 6. Calcula el número de clientes que tiene la empresa.

SELECT count(*) as numero_clientes FROM cliente

-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

SELECT count(*) clientes_madrid FROM cliente WHERE lower(ciudad) = "madrid" 

-- 8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

SELECT ciudad, count(*) numero_clientes FROM cliente WHERE lower(ciudad) LIKE "m%" GROUP BY ciudad

-- 9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

SELECT CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2) as representante, count(c.codigo_cliente) as numero_clientes
FROM cliente c 
JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas 
GROUP BY c.codigo_empleado_rep_ventas 
ORDER BY numero_clientes DESC

-- 10. Calcula el número de clientes que no tiene asignado representante de ventas.

SELECT count(*) clientes_sin_representante FROM cliente WHERE codigo_empleado_rep_ventas IS NULL

-- 11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. 
-- El listado deberá mostrar el nombre y los apellidos de cada cliente.

SELECT c.nombre_cliente, MIN(p.fecha_pago) as primer_pago, MAX(p.fecha_pago), SUM(p.total) as importe FROM cliente c
JOIN pago p ON p.codigo_cliente = c.codigo_cliente
GROUP BY p.codigo_cliente 
ORDER BY nombre_cliente

-- 12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.



-- 13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.



-- 14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. 
-- El listado deberá estar ordenado por el número total de unidades vendidas.



-- 15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. 
-- La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. 
-- El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.



-- 16. La misma información que en la pregunta anterior, pero agrupada por código de producto.



-- 17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.



-- 18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, 
-- total facturado y total facturado con impuestos (21% IVA).


-- 19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.