FROM ANIMALES A
INNER JOIN HABITAT HA ON A.IDHabitat = HA.ID
GROUP BY HA.NOMBRE
HAVING AVG(EXTRACT(YEAR FROM AGE(A.FechaNac))) > 5;
HAVING AVG(EXTRACT(YEAR FROM AGE(A.FechaNac))) > 5;
-- Calcular el top 5 de los animales 
-- mas viejos del zoologico. 
SELECT
       A.NOMBRE AS ANIMAL,
       E.NOMBRE AS ESPECIE,
       A.FechaNac AS FECHA_NACIMIENTO,
       DATE_PART('year', AGE(A.FechaNac)) AS EDAD
FROM
       ANIMALES A
INNER JOIN ESPECIE E ON A.IdEspecie = E.ID
GROUP BY A.NOMBRE, E.NOMBRE, A.FechaNac
ORDER BY EDAD DESC
LIMIT 5;
-- Calcular el promedio de edad de los animales 
-- por especies y mostrar solo las especies donde
-- el promedio de edad supera los 6 años
-- ordenados alfabeticamente, por el nombre de especie.
SELECT ESP.NOMBRE AS ESPECIE,
       ROUND(AVG(DATE_PART('year',AGE(A.FechaNac)))) AS EDAD_PROMEDIO
FROM ANIMALES A
INNER JOIN ESPECIE ESP ON A.IdEspecie= ESP.ID
GROUP BY ESP.NOMBRE
HAVING AVG(DATE_PART('year',AGE(A.FechaNac))) > 6
ORDER BY ESP.NOMBRE;
