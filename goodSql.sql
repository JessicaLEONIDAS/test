BEGIN; --début de la transaction


DROP TABLE IF EXISTS "brand";

CREATE TABLE "brand" (
  "brand_id" INT NOT NULL PRIMARY KEY,  
  "name" varchar(15) NOT NULL
);


INSERT INTO "brand" (brand_id, name) VALUES
(11, 'BMW'),
(12, 'CHEVROLET'),
(13, 'CITROEN'),
(14, 'MERCEDES'),
(15, 'RENAULT'),
(16, 'VOLKSWAGEN');


DROP TABLE  IF EXISTS "model";

CREATE TABLE "model"(
  "model_id" INT NOT NULL PRIMARY KEY,
  "name" VARCHAR (35) NOT NULL
);


INSERT INTO "model"(model_id, name) VALUES
(11, 'Z4'),
(12, 'captiva'),
(13, 'C3'),
(14, 'SLK'),
(15, 'Modus'),
(16, 'Golf V'),
(17, 'Golf VI');


DROP TABLE IF EXISTS "serie";

CREATE TABLE "serie" (
  "serie_id" int NOT NULL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL
);

INSERT INTO "serie" (serie_id, name) VALUES
(11, 'E85'),
(12, '2.4 LT 2WD'),
(13, '1.4 16S XTR SENSODRIVE'),
(14, '1.6 16S CONFORT PACK AIR DYNAMIQUE'),
(15, 'III COUPE 180 BLUEEFFICIENCY EDITION'),
(16, '230 KROMPRESSOR FACELIFT'),
(17, '1.4 75 AirPlay'),
(18, '1.4 TSI 160 CARAT EDITION 5P'),
(19, '2.0 TSFI 200 GTI 3P');


DROP TABLE IF EXISTS "engine";

CREATE TABLE "engine" (
  "engine_id" int NOT NULL PRIMARY KEY,
  "name" VARCHAR(15) NOT NULL);
  

INSERT INTO "engine" (engine_id,name) VALUES
(1,'gasoil'),
(2,'essence'),
(3,'electrique'),
(4,'GPL');




DROP TABLE IF EXISTS "user";

CREATE TABLE "user" (
  "user_id" int NOT NULL PRIMARY KEY,
  "isAdmin" BOOLEAN NOT NULL,
  "firstname" varchar(25) NOT NULL,
  "lastname" varchar (25) NOT NULL,
  "phone" INTEGER,
  "email" VARCHAR(20),
  "password"VARCHAR(20)
);

DROP TABLE IF EXISTS "main_picture";

CREATE TABLE "main_picture"(

"main_picture_id" INT NOT NULL PRIMARY KEY,
"picture_title" VARCHAR(90) NOT NULL
);


INSERT INTO "user" ( "user_id" ,"isAdmin","firstname","lastname" ,"phone" ,"email","password")
VALUES (1,TRUE,'Jhon','Doe','0606060606','jhondoe@gmail.com','admin');

DROP TABLE IF EXISTS "carDetails";

CREATE TABLE "carDetails" (
  "id" INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  "title" VARCHAR (255) NOT NULL,

"model_id" INT NOT NULL,
  FOREIGN KEY(model_id) 
  REFERENCES model(model_id) ON DELETE CASCADE ON UPDATE CASCADE,

 "brand_id" INT NOT NULL,
  FOREIGN KEY(brand_id) 
  REFERENCES brand(brand_id) ON DELETE CASCADE ON UPDATE CASCADE,

  "serie_id" INT NOT NULL,
   FOREIGN KEY(serie_id) 
   REFERENCES serie(serie_id) ON DELETE CASCADE ON UPDATE CASCADE,

   "engine_id" INT NOT NULL,
    FOREIGN KEY(engine_id)
   REFERENCES engine(engine_id) ON DELETE CASCADE ON UPDATE CASCADE,

  "main_picture_id" INT NOT NULL,
   FOREIGN KEY(main_picture_id)
   REFERENCES main_picture(main_picture_id) ON DELETE CASCADE ON UPDATE CASCADE,


  "front_picture" VARCHAR(90),
  "right_picture" VARCHAR(90),
  "left_picture" VARCHAR(90),
  "back_picture" VARCHAR(90),
  "interior_picture" VARCHAR(90), 
  "other_picture1" VARCHAR(90),
  "other_picture2" VARCHAR(90),
  "other_picture3" VARCHAR(90),
  "other_picture4" VARCHAR(90),

  "year" DATE NOT NULL,
  "category" varchar NOT NULL,
  "kilometers" numeric(7) NOT NULL,
  "color" varchar NOT NULL,
  "price" numeric(8,2) NOT NULL,
  "date_create" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "date_update" TIMESTAMPTZ 
);


DROP TABLE IF EXISTS "simple_add_car";

CREATE TABLE "simple_add_car" (

  
  
  "model_id" INT NOT NULL,
  FOREIGN KEY(model_id) 
  REFERENCES model(model_id) ON DELETE CASCADE ON UPDATE CASCADE,

  "brand_id" INT NOT NULL,
  FOREIGN KEY(brand_id) 
  REFERENCES brand(brand_id) ON DELETE CASCADE ON UPDATE CASCADE,

  "serie_id" INT NOT NULL,
   FOREIGN KEY(serie_id) 
   REFERENCES serie(serie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    
   "main_picture_id" INT NOT NULL,
   FOREIGN KEY(main_picture_id)
   REFERENCES main_picture(main_picture_id)ON DELETE CASCADE ON UPDATE CASCADE, 

  "kilometers" numeric(7) NOT NULL,
  "year" date NOT NULL,
  "price" numeric(8,2) NOT NULL,
  "date_create" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "date_update" TIMESTAMPTZ 
);



--
COMMIT; -- fin de la transaction