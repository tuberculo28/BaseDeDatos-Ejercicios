--Ejercicio 2:
INSERT INTO user (username, password)
VALUES("KUBO", "2468");
INSERT INTO post (author_id, title, body)
VALUES((SELECT id FROM user WHERE username like "%kubo%"), "解雇されました","私の契約は終了されました...")
--Insert de un usuario y post

--Ejercicio 3:
UPDATE user  SET 
username = "Mitoma",
password = 12345
WHERE id == 1;
UPDATE post SET 
title = "ya no busco una bici, gracias."
WHERE author_id == 1;
--Update de usuario y/o post

--Ejercicio 4:
DELETE FROM post WHERE author_id in (SELECT id FROM user)

--Delete de usuario y/o post

--Ejercicio 5:
INSERT INTO user(username, password)
VALUES ("Leo Messi", (SELECT password FROM user WHERE username like "%kubo%"))

--Agregar un usuario nuevo con la contraseña de alguno de los usuarios
--ya creados (usando subquery buscando el usuario por nombre)

--Ejercicio 6:
UPDATE post SET
title = "ahora hablo espanol",
body = ""
WHERE author_id in (SELECT id from user WHERE username like "%kubo%")

--Actualizar todos los posts de un usuario (seleccionado con subquery
--por nombre) y poner el cuerpo del post en texto vacío ("").

--Ejercicio 7:
DELETE FROM post WHERE author_id in (SELECT id FROM user WHERE username like "%kubo%");
DELETE FROM user WHERE username like "%kubo%";

--Borrar un usuario que tenga posts, haciendo primero un DELETE con
--subquery que borre todos los post de ese usuario.
