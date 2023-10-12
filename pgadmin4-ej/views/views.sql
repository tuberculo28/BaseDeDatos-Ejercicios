--¿Cuántas películas hay en cada tipo de "rating" (g, pg, pg13, r, nc17)
CREATE VIEW peliculasxrating as
SELECT COUNT(title) as peliculas, rating FROM film
GROUP BY rating 

--¿Cuántas películas hay en cada "categoría"?
CREATE VIEW Peliculasxcategoria AS
SELECT COUNT(f.title) as peliculas, c.name FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name

--Cuales son los 10 actores/actrices que más 
--aparecen en las películas
CREATE VIEW actores as
SELECT count(f.film_id), a.first_name, a.last_name as apariciones 
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY apariciones DESC
LIMIT 10


--¿Cuántas películas distintas hay en cada local? 
--Como no hay nombre del local, poner en su lugar 
--la dirección incluyendo ciudad y país además de la cantidad

CREATE VIEW peliculasdistintasxlocal AS
SELECT COUNT(DISTINCT(i.film_id)), a.address as local, c.country as pais
FROM inventory i
JOIN store s ON i.store_id = s.store_id 
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country c ON ci.country_id = c.country_id
GROUP by local, pais


--¿Cuántos ejemplares (inventory) en total hay en cada local?  
--Como no hay nombre del local, poner en su lugar 
--la dirección incluyendo ciudad y país además de la cantidad
CREATE VIEW inventarioxlocal AS
SELECT count(i.film_id) as copias, a.address as local, c.country as pais
FROM inventory i
JOIN store s ON i.store_id = s.store_id 
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country c ON ci.country_id = c.country_id
GROUP by local, pais

--Título de la película, dirección, ciudad y país del 
--local de todos los ejemplares que están sin devolver.
CREATE VIEW pelisculassindevolver AS
SELECT f.title, a.address, ci.city, c.country FROM film f
JOIN inventory i ON f.film_id = i.inventory_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN store s ON i.store_id = s.store_id 
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country c ON ci.country_id = c.country_id
WHERE return_date IS NULL
GROUP by ci.city, f.title, a.address, c.country

--Mostrar título, categoría, idioma, rating y 
--duración de las películas que estén entre 1 hs y 2 hs.
CREATE VIEW Peliculasde1hsa2hs AS
SELECT f.title, c.name as categoria, l.name as idioma, f.rating, f.length as duracion FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN language l ON f.language_id = l.language_id

--Mostrar nombre, apellido y dirección 
--(con ciudad y país) de los encargados del local.
CREATE VIEW personal AS
SELECT s.first_name, s.last_name, a.address, c.country, ci.city FROM staff s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country c ON ci.country_id = c.country_id

--Calcular el costo de alquiler promedio de cada película.
CREATE VIEW promedioxcategoria As
SELECT avg(f.rental_rate) as promedioxpeli, c.name from film f
JOIN film_category fc on f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
group by c.name

--Mostrar el título, la fecha mínima y 
--máxima de devolución de todas las películas.
CREATE VIEW minmaxdevolucionxpeli AS
SELECT f.title, min(r.return_date) as minima, max(r.return_date) FROM film f
JOIN inventory i ON f.film_id = i.inventory_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title