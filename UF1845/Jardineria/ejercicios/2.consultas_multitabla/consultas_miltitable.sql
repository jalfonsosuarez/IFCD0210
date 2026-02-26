-- Consultas multitabla (Composición interna)
-- ------------------------------------------


-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

SELECT c.nombre_cliente, CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2 ) as representante FROM empleado e 
JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas 

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT DISTINCT c.nombre_cliente, CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2 ) as representante FROM empleado e 
JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN pago p  ON p.codigo_cliente = c.codigo_cliente 

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

SELECT DISTINCT c.nombre_cliente, CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2 ) as representante FROM empleado e 
JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT OUTER JOIN pago p  ON p.codigo_cliente = c.codigo_cliente 

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a 
-- la que pertenece el representante.


-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a 
-- la que pertenece el representante.

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

	SELECT DISTINCT c.nombre_cliente, c.ciudad, o.linea_direccion1 FROM cliente c 
	JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas 
	JOIN oficina o ON o.codigo_oficina  = e.codigo_oficina 
	WHERE LOWER(c.ciudad) = 'fuenlabrada'

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
	
	SELECT DISTINCT c.nombre_cliente, c.ciudad, e.nombre, o.linea_direccion1 FROM cliente c 
	JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas 
	JOIN oficina o ON o.codigo_oficina  = e.codigo_oficina 
	
-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
	
	SELECT CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2) AS empleado, CONCAT_WS(' ', e2.nombre, e2.apellido1, e2.apellido2) AS jefe FROM empleado e 
	JOIN empleado e2 WHERE e2.codigo_empleado  = e.codigo_jefe 
	
-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
