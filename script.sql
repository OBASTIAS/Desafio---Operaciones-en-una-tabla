DROP DATABASE POSTS;

\echo '1. Crear una base de datos con nombre “Posts”.'
CREATE DATABASE POSTS;

\echo 'Conectarse a la database posts'
\c posts;

\echo '2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contents y descripción'

CREATE TABLE posts (
    id SERIAL,
    username VARCHAR(255),
    created_at DATE,
    contents VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY(id)
);



\echo '3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".'

INSERT INTO posts(username, created_at, contents, description) VALUES ('Pamela','2021/07/19','Hola soy pamela, y vengo a flotar, bueno chao','soy un post de Pamela');
INSERT INTO posts(username, created_at, contents, description) VALUES ('Pamela','2021/07/20','Hola soy pamela, y vengo a flotar, bueno chao','soy un post de Pamela, y estoy soltera');
INSERT INTO posts(username, created_at, contents, description) VALUES ('Carlos','2021/07/21','Hola mundo Carlos, y vengo a flotar, bueno chao','soy un post de Carlos');


\echo '4.Modificar la tabla post, agregando la columna título.'

ALTER TABLE posts ADD title VARCHAR(255);

\echo '5.Agregar título a las publicaciones ya ingresadas.'

UPDATE posts SET title = 'Developer' WHERE id = 1;
UPDATE posts SET title = 'UX/UI' WHERE id = 2;
UPDATE posts SET title = 'Data scientist' WHERE id = 3;


\echo '6.Insertar 2 post para el usuario "Pedro".'

INSERT INTO posts(username, created_at, contents, description,title) VALUES ('Pedro','2021/07/19','Hola soy Pedro, y vengo a flotar, bueno chao','soy un post de Pedro','veterinary');
INSERT INTO posts(username, created_at, contents, description, title) VALUES ('Pedro','2021/07/20','Hola soy Pedro, y vengo a flotar, bueno chao','soy un post de Pedro, y estoy soltero','veterinary');



\echo '7. Eliminar el post de Carlos'

DELETE FROM posts WHERE username like 'Carlos'; 



\echo '8. Ingresar un nuevo post para el usuario "Carlos".'

INSERT INTO posts(username, created_at, contents, description, title) VALUES ('Carlos','2021/07/21','Hola soy Carlos, y vengo a flotar, bueno chao','soy un post de Carlos', 'Data scientist');

\echo 'parte 2'

\echo '1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contents, que se relacione con la tabla posts.'

CREATE TABLE comentarios (
    id SERIAL,
    created_at DATE,
    hour_time TIME,
    contents VARCHAR(255),
    post_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);
\echo '2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".'

INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/07/23', '09:00:00','Hola mundo soy un comentario de Pamela',1);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/07/23', '10:01:45','Hola mundo soy el segundo comentario de Pamela',1);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/07/23', '14:02:30','Hola mundo soy el primer comentario de Carlos',6);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/06/23', '16:01:56','Hola mundo soy el segundo comentario de Carlos',6);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/04/23', '17:01:20','Hola mundo soy el tercer comentario de Carlos',6);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/01/23', '22:01:10','Hola mundo soy el cuarto comentario de Carlos',6);

\echo '3. Crear un nuevo post para "Margarita".'


INSERT INTO posts(username, created_at, contents, description, title) VALUES ('Margarita','2021/07/23','Hola mundo Carlos, y vengo a flotar, bueno chao','soy un post de Margarita','Actress');

\echo '4. Ingresar 5 comentarios para el post de Margarita.'
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/07/23', '09:00:00','Hola mundo soy el primer comentario de Margarita',7);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/07/24', '10:01:45','Hola mundo soy el segundo comentario de Margarita',7);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/07/25', '14:02:30','Hola mundo soy el tercer comentario de Margarita',7);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/06/26', '16:01:56','Hola mundo soy el cuarto comentario de Margarita',7);
INSERT INTO comentarios(created_at, hour_time, contents, post_id) VALUES ('2021/04/27', '17:01:20','Hola mundo soy el quinto comentario de Margarita',7);

