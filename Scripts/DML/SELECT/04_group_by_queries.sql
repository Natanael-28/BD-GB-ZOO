-- Contar el número de animales por hábitat
SELECT H.NOMBRE AS HABITAT, 
       COUNT(A.ID) AS TOTAL_ANIMALES
FROM ANIMALES A
JOIN HABITAT H ON A.IDHABITAT = H.ID
GROUP BY H.NOMBRE;

-- Calcular el salario promedio de los cuidadores 
-- por especialidad
SELECT E.NOMBRE AS ESPECIALIDAD, 
       ROUND(AVG(C.SALARIO),2) AS SALARIO_PROMEDIO
FROM CUIDADOR C
JOIN ESPECIALIDAD E ON C.IDESPECIALIDAD = E.ID
GROUP BY E.NOMBRE;
