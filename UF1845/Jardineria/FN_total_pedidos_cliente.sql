-- Número total de pedidos de un cliente

DROP FUNCTION IF EXISTS fn_total_pedidos_cliente;


DELIMITER $$

CREATE FUNCTION fn_total_pedidos_cliente(cod_cliente INT)
RETURNS INT
deterministic
BEGIN
	
	DECLARE totalPedidos INT;
	
	SELECT count(*) INTO totalPedidos FROM pedido p 
	WHERE p.codigo_cliente = cod_cliente;
	
	return totalPedidos;
	
END $$

DELIMITER ;

SELECT fn_total_pedidos_cliente(1) as totalPedidos;

SELECT c.codigo_cliente, fn_total_pedidos_cliente(c.codigo_cliente ) as totalPedidos FROM cliente c;