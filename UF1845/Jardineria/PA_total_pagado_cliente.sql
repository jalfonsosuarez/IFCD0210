-- Total pagado por un cliente

drop procedure if exists total_pagado_cliente;

delimiter $$

create procedure total_pagado_cliente(in cod_cliente int, out total_pagado decimal(10,2))
begin

	SELECT sum(p.total) INTO total_pagado FROM pago p 
	WHERE p.codigo_cliente = cod_cliente;


end $$

delimiter ;

call total_pagado_cliente(3, @total);

SELECT @total;
