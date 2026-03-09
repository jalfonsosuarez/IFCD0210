drop procedure if exists cantidad_pedidos_cliente;

delimiter $$

create procedure cantidad_pedidos_cliente(v_codigo_cliente int)
begin

	SELECT count(*) cantidad_pedidos FROM pedido p 
	WHERE p.codigo_cliente = v_codigo_cliente
	GROUP BY p.codigo_cliente;
	
end $$

delimiter ;

call cantidad_pedidos_cliente(13)