SELECT count(*) as total, color 
FROM vehiculos v 
GROUP BY lower(v.color)