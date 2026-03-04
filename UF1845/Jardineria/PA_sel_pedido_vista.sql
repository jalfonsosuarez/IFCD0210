-- Obtener todos los datos del pedido

drop procedure if exists sel_pedido_vta;

delimiter $$

create procedure sel_pedido_vta(v_id_pedido int)
begin

	SELECT * FROM resumen_pedidos rp
	WHERE rp.codigo_pedido = v_id_pedido
	ORDER BY rp.numero_linea;

end $$

delimiter ;

call sel_pedido_vta(3)