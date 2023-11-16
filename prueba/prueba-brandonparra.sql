--2)Crear una vista (VIEW) que muestre de cada alquiler su duración, 
--el nombre completo del cliente, el nombre de la película 
--y la fecha de alquiler.


CREATE VIEW carateristicaxalquiler AS
SELECT f.title, f.rental_duration, c.first_name, c.last_name, r.rental_date
FROM rental r JOIN inventory i
on r.inventory_id = i.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN film f ON i.film_id = f.film_id

--Elegir una actor o actriz que no esté en el sistema 
--y agregarlo, junto con al menos tres películas en las que haya participado.  
--No es necesario agregar los otros actores/actrices de esa película

INSERT INTO actor (first_name, last_name)
VALUES('Brandon', 'Parra')

INSERT INTO film_actor (actor_id, film_id)
VALUES((SELECT actor_id FROM actor WHERE first_name ILIKE '%brandon%'), 
	   (SELECT film_id FROM film WHERE title ILIKE '%alabama devil%'))

INSERT INTO film_actor (actor_id, film_id)
VALUES((SELECT actor_id FROM actor WHERE first_name ILIKE '%brandon%'), 
	   (SELECT film_id FROM film WHERE title ILIKE '%ace goldfinger%'))

INSERT INTO film_actor (actor_id, film_id)
VALUES((SELECT actor_id FROM actor WHERE first_name ILIKE '%brandon%'), 
(SELECT film_id FROM film WHERE title ILIKE '%adaptation holes%'))


--En la tabla de empleados, se quieren resetear los usuarios y claves.
--Poner el apellido como nombre de usuario y "1234" como clave.

UPDATE staff SET
username = last_name,
password = '1234'
