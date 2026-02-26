CREATE VIEW coches_personas AS
SELECT p.dni, p.nombre, m.marca, v.modelo, c.nombre_color FROM personas p
JOIN vehiculos_personas vp ON vp.id_persona = p.id 
JOIN vehiculos v ON v.id = vp.id
JOIN colores c ON c.id = v.id_color
JOIN marcas m ON m.id = v.id_marca;