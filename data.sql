
CREATE TABLE "user" (
  "id" BIGSERIAL NOT NULL PRIMARY   KEY,
  "email" varchar(50) NOT NULL UNIQUE,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "password" varchar(80) NOT NULL
) ;

INSERT INTO "user" (email,first_name,last_name,password) /* default password : 123 */
VALUES 
('serg@gmail.com','Serg', 'Udodov', '$2a$10$Czq50X/l/AZudt/nzr4mZO3/XKgRIDr.IxdAEXPVQ6C/kKj9RSV5y'),
('jack@gmail.com','Jack', 'Austin', '$2a$10$Czq50X/l/AZudt/nzr4mZO3/XKgRIDr.IxdAEXPVQ6C/kKj9RSV5y'),
('kate@gmail.com','Kate', 'Shepherd', '$2a$10$Czq50X/l/AZudt/nzr4mZO3/XKgRIDr.IxdAEXPVQ6C/kKj9RSV5y'),
('conor@gmail.com','Conor', 'McGregor', '$2a$10$Czq50X/l/AZudt/nzr4mZO3/XKgRIDr.IxdAEXPVQ6C/kKj9RSV5y');


CREATE TABLE "role" (
  "id" BIGSERIAL NOT NULL PRIMARY   KEY,
  "name" varchar(50) DEFAULT NULL
);

INSERT INTO "role" (name)
VALUES 
('ROLE_USER'),
('ROLE_ADMIN');


CREATE TABLE "users_roles" (
  "user_id" BIGSERIAL NOT NULL,
  "role_id" BIGSERIAL NOT NULL,
  
  PRIMARY KEY ("user_id","role_id"),
  
  CONSTRAINT "FK_USER_01" FOREIGN KEY ("user_id") 
  REFERENCES "user" ("id") 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT "FK_ROLE_01" FOREIGN KEY ("role_id") 
  REFERENCES "role" ("id") 
  ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO "users_roles" (user_id,role_id)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(4, 2);


CREATE TABLE "drawing" (
  "id" BIGSERIAL NOT NULL PRIMARY   KEY,
  "designation" varchar(255) NOT NULL,
  "name" text NOT NULL,
  "version" BIGSERIAL NOT NULL,
  "date" varchar(20) NOT NULL,
  imageURL text
);

INSERT INTO "drawing" (designation,name,version,date,imageURL)
VALUES 
('2311194СБ', 
'Сборочный чертеж',
1,
'25.04.2023 23:49:44', 
'https://www.teslarati.com/wp-content/uploads/2020/11/Sentinel-6A-Falcon-9-B1063-SLC-4E-112120-SpaceX-launch-landing-2-c-2048x1127.jpg'),

('2340208', 
'Ступенька',
1,
'24.04.2023 11:34:15', 
'https://estestvoznanye.ru/sites/default/files/izo/motokross-2.jpg'),

('2340388', 
'Скоба',
1,
'23.04.2023 16:27:43', 
'https://adonius.club/uploads/posts/2022-08/1661514983_18-adonius-club-p-severnii-tigr-zhivotnie-krasivo-foto-25.jpg');


CREATE TABLE "drawing_users" (
  "drawing_id" BIGSERIAL NOT NULL,
  "user_id" BIGSERIAL NOT NULL,
  
  PRIMARY KEY ("drawing_id","user_id"),
  
  CONSTRAINT "FK_DRAWING_01" FOREIGN KEY ("drawing_id") 
  REFERENCES "drawing" ("id") 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT "FK_USER_02" FOREIGN KEY ("user_id") 
  REFERENCES "user" ("id") 
  ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO "drawing_users" (drawing_id,user_id)
VALUES 
(1, 1),
(2, 1),
(3, 4);






