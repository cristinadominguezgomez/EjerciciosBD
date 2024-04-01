-- 5. Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor
SELECT MOVIE_DURATION FROM MOVIES GROUP BY MOVIE_DURATION ORDER BY MOVIE_DURATION DESC LIMIT 20;

-- 6. Devuelve las películas del año 2000 en adelante que empiecen por la letra A
SELECT MOVIE_NAME FROM MOVIES WHERE YEAR(MOVIE_LAUNCH_DATE) >= 2000 AND MOVIE_NAME LIKE 'A%';

-- 7. Devuelve los actores nacidos un mes de Junio
SELECT ACTOR_NAME FROM ACTORS WHERE MONTH(ACTOR_BIRTH_DATE) = 6;

-- 8. Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos
SELECT ACTOR_NAME FROM ACTORS WHERE ACTOR_DEAD_DATE IS NULL AND MONTH(ACTOR_BIRTH_DATE) <> 6;

-- 9. Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos 
SELECT DIRECTOR_NAME, DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) AS "AGE" FROM DIRECTORS WHERE DIRECTOR_DEAD_DATE IS NULL AND DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) <= 50;

-- 10. Devuelve el nombre y la edad de todos los actores menores de 50 años que hayan fallecido
SELECT ACTOR_NAME, DATEDIFF(YEAR, ACTOR_BIRTH_DATE, TODAY()) AS "AGE" FROM ACTORS WHERE ACTOR_DEAD_DATE IS NOT NULL AND DATEDIFF(YEAR, ACTOR_BIRTH_DATE, TODAY()) < 50;

-- 11. Devuelve el nombre de todos los directores menores o iguales de 40 años que estén vivos
SELECT DIRECTOR_NAME, DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) AS "AGE" FROM DIRECTORS WHERE DIRECTOR_DEAD_DATE IS NULL AND DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) > 40;

-- 12. Indica la edad media de los directores vivos
SELECT AVG(DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY())) AS "AVERAGE_AGE_ALIVE" FROM DIRECTORS WHERE DIRECTOR_DEAD_DATE IS NULL;

-- 13. Indica la edad media de los actores que han fallecido
SELECT AVG(DATEDIFF(YEAR, ACTOR_BIRTH_DATE, TODAY())) AS "AVERAGE_AGE_DEAD" FROM ACTORS WHERE ACTOR_DEAD_DATE IS NOT NULL;
