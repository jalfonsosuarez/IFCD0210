SELECT p.nombre, c.nombre_color, m.marca , v.modelo  FROM personas p 
JOIN vehiculos_personas vp ON p.id = vp.id_persona 
JOIN vehiculos v ON v.id  = vp.id_vehiculo 
JOIN colores c ON c.id = v.id_color 
JOIN marcas m ON m.id = v.id_marca
WHERE LOWER(c.nombre_color) = LOWER("Verde")