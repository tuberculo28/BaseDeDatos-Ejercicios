DELETE FROM language WHERE name = "Italian"

--Borrar un lenguaje cualquiera menos el inglés.

DELETE FROM language WHERE language_id not in (SELECT language_id FROM film)

--Borrar los lenguajes que no aparecen en ninguna película.

--DELETE FROM city WHERE city_id not in (SELECT city_id FROM address)

DELETE  FROM country WHERE country_id not in (SELECT country_id FROM city)

--Borrar todas las ciudades que no tienen direcciones 
--y luego todos los países que no tienen ciudades.

DELETE FROM category WHERE name = "Horror"
--DELETE FROM film_category WHERE category_id = ( SELECT category_id FROM category 											WHERE name = "Horror")
--Borrar la categoría “Horror”, pensar que cosas habría que hacer primero para poder borrarla.



--DELETE FROM film_actor WHERE actor_id in (SELECT actor_id FROM film_actor
--WHERE actor_id in (SELECT actor_id FROM actor WHERE first_name like "%matthew%" and last_name
--like "%johansson%"))

DELETE FROM actor WHERE actor_id = 8

--Borrar al actor Matthew Johansson,
--pensar qué cosa habría que borrar primero para poder borrarlo.