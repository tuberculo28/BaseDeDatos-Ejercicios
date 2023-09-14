--Ejercicios insert

--2.1

INSERT INTO city(city, country_id)
VALUES('Lugano', (SELECT country_id FROM country WHERE country like '%Argentina%')),
	  ('Palermo',(SELECT country_id FROM country WHERE country like '%Argentina%')),
	  ('San Fernando', (SELECT country_id FROM country WHERE country like '%Argentina%'))
	
--Insertar tres ciudades de argentina a elección en un solo insert 

--2.2

INSERT INTO address(address, city_id, district, phone)
VALUES ('Huddersfield', (SELECT city_id FROM city WHERE city like '%Lugano%'),'', '');
INSERT INTO store(address_id )
VALUES ((SELECT address_id FROM address WHERE address like '%Huddersfield%'))


--Agregar una nueva sucursal (store) en alguna de esas tres ciudades.  
--Para eso hay que crear una dirección primero.

--2.3

INSERT INTO staff(first_name, last_name, address_id, picture, email, store_id, active, username)
VALUES ('Brandon', 'Parra', (SELECT address_id FROM address WHERE address like '%Huddersfield%'),
		'', 'tuberculo@gmail.com', 3, '', 'tuberculo'),
	   ('Takefusa', 'Kubo', (SELECT address_id FROM address WHERE address like '%Huddersfield%'),
	    '', 'takekubo@gmail.com', 3, '', 'Take');

UPDATE store SET
manager_staff_id = (SELECT staff_id FROM staff WHERE email like '%tuberculo@gmail.com%')
WHERE store_id = 3

--tuve que usar el update porque no podia dejar vacio en manager_staff_id
--y tuve que cambiar la tabla para que no sea obligatorio, y poder
--crear un sucursal sin manager_staff_id, porque si no la id de manager
--iba a ser cualquier cosa.

--Poner dos empleados que trabajen en la sucursal que vivan en la misma ciudad.  
--Uno de los dos dos tiene que ser el manager de la sucursal.

--2.4

--Agregar al inventario de la nueva sucursal una sola copia de 
--cada película.