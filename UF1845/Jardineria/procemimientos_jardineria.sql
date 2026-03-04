
use jardineria;

-- Plantilla de procedimiento almacenado

/*
drop procedure if exists <nombre>;

delimiter $$

create procedure <nombre>()
begin


end $$

delimiter ;


*/

drop procedure if exists saludo;

delimiter $$

create procedure saludo()
begin
	select "Bienvenido al maravilloso mundo del SQL.";
end $$

delimiter ;

call saludo();  

-- ---------------------------

drop procedure if exists saludo_p;

delimiter $$

create procedure saludo_p(in v_persona varchar(10))
begin
	select concat("Bienvenido al maravilloso mundo del SQL",
				  ", "
				 ,v_persona) ;
end $$

delimiter ;


call jardineria.saludo_p("Teo");

-- -------------------
-- 1. Devuelve un  listado con el código de oficina y la ciudad donde hay oficinas

drop procedure if exists oficina_ciudad;

delimiter $$

create procedure oficina_ciudad()
begin
	select o.codigo_oficina , o.ciudad 
	from oficina o ;

end $$

delimiter ;


call oficina_ciudad();

-- ------------------
drop procedure if exists oficina_ciudad_pais;

delimiter $$

create procedure oficina_ciudad_pais(v_pais varchar(50), out ok varchar(50))
begin
	select o.codigo_oficina , o.ciudad 
	from oficina o 
	where o.pais = v_pais;
	
	set ok = "Todo perfecto";

end $$

delimiter ;


call oficina_ciudad_pais('España', @resultado);

select @resultado;

-- ----------------------
drop procedure if exists ins_gama_producto;

delimiter $$

create procedure ins_gama_producto(v_gama varchar(50), v_desc varchar(100), v_desc_html varchar(100), v_imagen varchar(256))
begin

	INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES (v_gama, v_desc, v_desc_html, v_imagen);
	
	SELECT * FROM gama_producto AS gp WHERE gp.gama = v_gama;
	
end $$

delimiter ;

-- ----------------------

drop procedure if exists del_gama_producto;

delimiter $$

create procedure del_gama_producto(v_gama varchar(50))
begin

	DELETE FROM gama_producto gp WHERE gp.gama = v_gama;

end $$

delimiter ;

call del_gama_producto('Otro2');

-- ----------------------

-- Obtener todos los datos del pedido

drop procedure if exists sel_pedido;

delimiter $$

create procedure sel_pedido(v_id_pedido int)
begin

	SELECT p.codigo_pedido, dp.numero_linea, p.estado, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega , c.nombre_cliente,
	p2.descripcion, dp.cantidad, dp.precio_unidad 
	FROM pedido p 
	JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
	JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido 
	JOIN producto p2 ON p2.codigo_producto = dp.codigo_producto 
	WHERE p.codigo_pedido = v_id_pedido
	ORDER BY dp.numero_linea;

end $$

delimiter ;

call sel_pedido(8)