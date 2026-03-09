-- SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS fecha_aleatoria;

delimiter $$

CREATE FUNCTION fecha_aleatoria() RETURNS date
not deterministic
begin
	
	return date_add(curdate(), interval floor(rand()*30) day);
	
end $$

delimiter ;

SELECT fecha_aleatoria();