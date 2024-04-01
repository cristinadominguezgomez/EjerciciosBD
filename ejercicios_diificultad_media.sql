-- 14. Devuelve el nombre de todas las películas y el nombre del estudio que las ha realizado
SELECT m.MOVIE_NAME, s.STUDIO_NAME
FROM MOVIES m
JOIN STUDIOS s ON m.STUDIO_ID = s.STUDIO_ID;

-- 15. Devuelve los miembros que alquilaron al menos una película entre el año 2010 y el 2015
SELECT DISTINCT m.MEMBER_NAME  FROM MEMBERS m
JOIN MEMBERS_MOVIE_RENTAL mr ON m.MEMBER_ID = mr.MEMBER_ID
WHERE YEAR(mr.MEMBER_RENTAL_DATE) >= 2010 AND 
YEAR(mr.MEMBER_RETURN_DATE) <= 2015;

-- 16. Devuelve cuantas películas hay de cada país
SELECT n.NATIONALITY_NAME, COUNT(*) AS "N_MOVIES" FROM MOVIES m
JOIN NATIONALITIES n ON m.NATIONALITY_ID = n.NATIONALITY_ID
GROUP BY n.NATIONALITY_NAME;

-- 17. Devuelve todas las películas que hay de género documental
SELECT * FROM MOVIES WHERE GENRE_ID = 2;

-- 18. Devuelve todas las películas creadas por directores nacidos a partir de 1980 y que todavía están vivos
SELECT m.MOVIE_NAME,d.DIRECTOR_NAME, d.DIRECTOR_BIRTH_DATE, d.DIRECTOR_DEAD_DATE  FROM MOVIES m
JOIN DIRECTORS d ON m.DIRECTOR_ID = d.DIRECTOR_ID
WHERE d.DIRECTOR_DEAD_DATE IS NULL AND YEAR(d.DIRECTOR_BIRTH_DATE) > 1980;

-- 20. Devuelve el nombre y el año de todas las películas que han sido producidas por un estudio que actualmente no esté activo
SELECT m.MOVIE_NAME, YEAR(m.MOVIE_LAUNCH_DATE) AS "YEAR" FROM MOVIES m
JOIN STUDIOS s ON m.STUDIO_ID = s.STUDIO_ID
WHERE s.STUDIO_ACTIVE = 0
ORDER BY m.STUDIO_ID;

-- 21. Devuelve una lista de las últimas 10 películas que se han alquilado
SELECT m.MOVIE_NAME FROM
(SELECT * FROM MEMBERS_MOVIE_RENTAL mr
ORDER BY MEMBER_RENTAL_DATE DESC LIMIT 10) AS "LAST_TEN_MOVIES"
JOIN MOVIES m ON LAST_TEN_MOVIES.MOVIE_ID = m.MOVIE_ID;

-- 22. Indica cuántas películas ha realizado cada director antes de cumplir 41 años
SELECT DIRECTOR_NAME, COUNT(*) AS "N_MOVIES"  FROM
(SELECT m.*,DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, m.MOVIE_LAUNCH_DATE ) AS "YEARS", d.DIRECTOR_NAME
FROM MOVIES m
JOIN DIRECTORS d ON m.DIRECTOR_ID = d.DIRECTOR_ID 
WHERE DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, m.MOVIE_LAUNCH_DATE) < 41)
GROUP BY DIRECTOR_ID, DIRECTOR_NAME;