-- 1. Devuelve todas las peliculas
SELECT MOVIE_NAME FROM MOVIES;

-- 2. Devuelve todos los generos existentes
SELECT GENRE_NAME FROM GENRES;

-- 3. Devuelve la lista de todos los estudios de grabación que estén activos
SELECT STUDIO_NAME FROM STUDIOS WHERE STUDIO_ACTIVE = 1;

-- 4. Devuelve una lista de los 20 últimos miembros en anotarse al videoclub
SELECT * FROM MEMBERS ORDER BY MEMBER_DISCHARGE_DATE DESC LIMIT 20 ;

