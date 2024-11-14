SELECT E.NOMBRE AS ESPECIE,EC.NOMBRE AS ESTADO_CONSERVACION,FA.NOMBRECOMUN
FROM ESPECIE E
INNER JOIN ESTADO_CONSERVACION EC ON E.IDESTADOCONSERVACION = EC.ID
INNER JOIN FAMILIA FA ON E.IDFAMILIA = FA.ID
WHERE E.NOMBRE LIKE '%Delfín%';
--INNER JOIN: Listar animales con el nombre de su cuidador y el hábitat en el que viven
SELECT 
    AN.NOMBRE AS ANIMAL,
    CUI.NOMBRE AS CUIDADOR,
    HAB.NOMBRE AS HABITAT
FROM 
    ANIMALES AN
INNER JOIN 
    CUIDADOR CUI ON AN.IDCUIDADOR = CUI.ID
INNER JOIN 
    HABITAT HAB ON AN.IDHABITAT = HAB.ID;
--LEFT JOIN: Listar todos los animales, incluyendo aquellos que no tienen hábitat asignado
SELECT 
    AN.NOMBRE AS ANIMAL,
    HAB.NOMBRE AS HABITAT
FROM 
    ANIMALES AN
LEFT JOIN 
    HABITAT HAB ON AN.IDHABITAT = HAB.ID;
--RIGHT JOIN: Listar todos los cuidadores y los animales que tienen asignados, incluyendo cuidadores que no tienen animales a su cargo
SELECT 
    CUI.NOMBRE AS CUIDADOR,
    AN.NOMBRE AS ANIMAL
FROM 
    ANIMALES AN
RIGHT JOIN 
    CUIDADOR CUI ON AN.IDCUIDADOR = CUI.ID;
--FULL JOIN: Listar todas las especialidades y los cuidadores que las poseen, incluyendo especialidades
--que no están asignadas a ningún cuidador y cuidadores sin especialidad
SELECT 
    ESP.NOMBRE AS ESPECIALIDAD,
    CUI.NOMBRE AS CUIDADOR
FROM 
    ESPECIALIDAD ESP
FULL JOIN 
    CUIDADOR CUI ON ESP.ID = CUI.IDESPECIALIDAD;
--SELF JOIN: Encontrar pares de animales que están bajo el mismo cuidador
SELECT 
    A1.NOMBRE AS ANIMAL_1,
    A2.NOMBRE AS ANIMAL_2,
    CUI.NOMBRE AS CUIDADOR
FROM 
    ANIMALES A1
JOIN 
    ANIMALES A2 ON A1.IDCUIDADOR = A2.IDCUIDADOR AND A1.ID <> A2.ID
JOIN 
    CUIDADOR CUI ON A1.IDCUIDADOR = CUI.ID;

