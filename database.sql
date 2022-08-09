CREATE DATABASE if NOT EXISTS laravel_master;
use laravel_master;

CREATE Table if not exists users(
id                  int(255) auto_increment NOT NULL,
role                VARCHAR(20),
name                VARCHAR(100),
surname             VARCHAR(200),
nick                VARCHAR(100),
email               VARCHAR(255),
password            VARCHAR(255),
image               VARCHAR(255),
created_at          datetime,
updated_at          datetime,
remember_token      VARCHAR(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO users VALUES(NULL,'user','victor', 'Robles','victorroblesweb','victor@victor.com','pass',null,curtime(), curtime(),null);
INSERT INTO users VALUES(NULL,'user','cecilia', 'garcia','ceciG','ceci@mail.com','pass',null,curtime(), curtime(),null);
INSERT INTO users VALUES(NULL,'user','silvina', 'lopez','silvi027','silvi@mail.com','pass',null,curtime(), curtime(),null);




create table if not exists images(
id                  int(255) auto_increment not null,
user_id             int(255),
image_path          VARCHAR(255),
description         text,
created_at          datetime,
updated_at          datetime,
constraint pk_images PRIMARY KEY(id),
constraint fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;

insert into images VALUES(null,1,'test.jpg','descripcion de prueba 1',curtime(),curtime());
insert into images VALUES(null,2,'test2.jpg','descripcion de prueba 2',curtime(),curtime());
insert into images VALUES(null,1,'test3.jpg','descripcion de prueba 3',curtime(),curtime());

insert into images VALUES(null,3,'test4.jpg','descripcion de prueba 4',curtime(),curtime());



create table if not exists comments(
id                  int(255) auto_increment not null,
user_id             int(255),
image_id            INT(255),
content             text,
created_at          datetime,
updated_at          datetime,
constraint pk_comments PRIMARY KEY(id),
constraint fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
constraint fk_comments_images FOREIGN KEY(image_id) references  images(id)
)ENGINE=InnoDb;


INSERT INTO comments VALUES(NULL,1,4,'buena foto de la familia!!',curtime(),curtime());
INSERT INTO comments VALUES(NULL,1,2,'lindo paisaje!!',curtime(),curtime());
INSERT INTO comments VALUES(NULL,2,3,'con mi amiguiss :)!!',curtime(),curtime());
INSERT INTO comments VALUES(NULL,3,1,'que lindos se ven todos juntos!!',curtime(),curtime());



create table if not exists likes(
id                  int(255) auto_increment not null,
user_id             int(255),
image_id            INT(255),
created_at          datetime,
updated_at          datetime,
constraint pk_likes PRIMARY KEY(id),
constraint fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
constraint fk_likes_images FOREIGN KEY(image_id) references  images(id)
)ENGINE=InnoDb;

insert into likes VALUES(null,1,4,curtime(),curtime());
insert into likes VALUES(null,2,4,curtime(),curtime());
insert into likes VALUES(null,3,1,curtime(),curtime());
insert into likes VALUES(null,3,2,curtime(),curtime());
insert into likes VALUES(null,2,1,curtime(),curtime());

