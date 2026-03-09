-- Triggers
-- --------------------------------------------------------

DROP TRIGGER IF EXISTS trg_primero;

DELIMITER $$

CREATE TRIGGER trg_primero
BEFORE INSERT ON gama_producto
FOR EACH ROW
BEGIN
	IF NEW.descripcion_texto IS NULL THEN
		SET NEW.descripcion_texto = "Sin descripción";
	END IF;

END$$

DELIMITER ;

INSERT INTO gama_producto (gama) VALUES ("Prueba trg");

-- --------------------------------------------------------

DROP TRIGGER IF EXISTS trg_update;

DELIMITER $$

CREATE TRIGGER trg_update
BEFORE UPDATE ON gama_producto
FOR EACH ROW
BEGIN
	DECLARE desc_html varchar(50) DEFAULT "<h1>producto</h1>";

	IF NEW.descripcion_texto <> OLD.descripcion_texto THEN
		SET NEW.descripcion_html = desc_html; 
	END IF;
	
	INSERT INTO tabla_log (texto) VALUES (CONCAT_WS(" ", "Gama producto actualizado", NEW.gama));
	
END$$

DELIMITER ;

UPDATE gama_producto gp SET gp.descripcion_texto = "Hola___" WHERE gp.gama = "Prueba trg";

-- ---------------------------------------------------------

DROP TRIGGER IF EXISTS trg_update_producto;

DELIMITER $$

CREATE TRIGGER trg_update_producto
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
	
	IF NEW.cantidad_en_stock > OLD.cantidad_en_stock THEN
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "STOCK INSUFICIENTE.";
	ELSE
		SET NEW.cantidad_en_stock = OLD.cantidad_en_stock - NEW.cantidad_en_stock;
	END IF;
	
END$$

DELIMITER ;

UPDATE producto p SET p.cantidad_en_stock = 5 WHERE p.codigo_producto = '11679';

-- ---------------------------------------------------------

DROP TRIGGER IF EXISTS trg_actualiza_stock;

DELIMITER $$

CREATE TRIGGER trg_actualiza_stock
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
	
	UPDATE producto SET cantidad_en_stock = cantidad_en_stock - NEW.cantidad
	WHERE codigo_producto = NEW.codigo_producto;
	
END$$

DELIMITER ;

INSERT INTO detalle_pedido (codigo_pedido, numero_linea, codigo_producto, cantidad, precio_unidad) 
VALUES (128, 3, '11679', 2, 14);
