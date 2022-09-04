BEGIN; --début de la transaction
--
-- Structure de la table 'brand'
--
DROP TABLE IF EXISTS "brand";

CREATE TABLE "brand" (
  "id" INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" varchar(15) NOT NULL,
);

--
-- Contenu de la table 'brand'
--

INSERT INTO "brand" ("id", "name") VALUES
(11, BMW),
(12, CHEVROLET),
(13, CITROEN),
(14, MERCEDES),
(15, RENAULT),
(16, VOLKSWAGEN),

--
-- Structure de la table 'model'
--

DROP TABLE IF EXISTS "model";

CREATE TABLE "model" (
  "id" int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "brandId" INT NOT NULL REFERENCES"brand"("id"),
  "name" VARCHAR (35) NOT NULL
);

--
-- Contenu de la table "model"(seeding)
--

INSERT INTO "model" ("brandId", "name") VALUES
(11, 'Z4'),
(12, 'captiva'),
(13, 'C3'),
(13, 'C3'),
(14, 'Classe C'),
(14, 'SLK'),
(15, 'Modus'),
(16, 'Golf V'),
(16, 'Golf VI'),

--
-- Structure de la table 'serie'
--
DROP TABLE IF EXISTS "serie";

CREATE TABLE "serie" (
  "id" int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" VARCHAR(35) NOT NULL,
);

--
-- Contenu de la table 'serie'
--

INSERT INTO "serie" ("modelId" "name") VALUES
(11, 'E85'),
(12, '2.4 LT 2WD'),
(13, '1.4 16S XTR SENSODRIVE'),
(13, '1.6 16S CONFORT PACK AIR DYNAMIQUE'),
(14, 'III COUPE 180 BLUEEFFICIENCY EDITION'),
(14, '230 KROMPRESSOR FACELIFT'),
(15, '1.4 75 AirPlay'),
(16, '1.4 TSI 160 CARAT EDITION 5P'),
(16, '2.0 TSFI 200 GTI 3P'),
--
-- Structure de la table 'engine'
--
DROP TABLE IF EXISTS "engine";

CREATE TABLE "engine" (
  "id" int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" VARCHAR(15) NOT NULL,
);

--
-- Contenu de la table 'engine'
--

INSERT INTO "engine" ("id", "name") VALUES
(1, gasoil),
(2, essence),
(3, electrique),
(4, GPL),

--
-- Structure de la table 'picture'
--
CREATE TABLE "picture" (
  "id" INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "carAdId" FOREIGN KEY,
  "title" VARCHAR(255),
  "order"
  

);

---INSERT INTO "picture" ("id", "name") VALUES
--
--
DROP TABLE IF EXISTS "carDetails"; 


CREATE TABLE "carDetails" (
  "id" INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "title" VARCHAR (255) NOT NULL,
  "brandId" INTEGER NOT NULL REFERENCES "brand"("id"),
  "serieId" int NOT NULL REFERENCES "serie"("id"),
  "pictureId" int NOT NULL REFERENCES "picture"("id"),
  "year" date NOT NULL,
  "category" varchar NOT NULL,
  "kilometers" numeric(6) NOT NULL,
  "engineId" int NOT NULL,
  "color" varchar NOT NULL,
  "featureId" int NOT NULL REFERENCES "picture"("id"),
  "price" numeric(6,2) NOT NULL,
  "date_create" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "date_update" TIMESTAMPTZ 

);

ALTER TABLE "carDetails"
  ADD PRIMARY KEY (`id`);

--Contenu de la table 'carDetails'

INSERT INTO "carDetails" ("id", "titleId", "brandId", "serieId", "pictureId","year","category", "kilometers", "engineId", "featureId", "price") VALUES
(1, 211, 11, 3, 111, 2007, cabriolet, 110000, essence, Airbags, 14995),
(2, 212, 12, 3, 112, 2012, SUV, 110000, essence, Airbags, 13495),
(3, 213, 13, 3, 113, 2007, citadine, 90000, essence, Airbags, 4750),
(4, 214, 13, 3, 114, 2007, citadine, 120000, essence, Airbags, 6995),
(5, 215, 14, 3, 115, 2007, coupé, 139000, essence, Airbags, 14495),
(6, 216, 15, 3, 116, 2006, monospace, 69000, essence, Airbags, 4995),
(7, 217, 16, 3, 117, 2008, berline, 110000, essence, Airbags, 11795),
(8, 218, 16, 3, 118, 2010, berline, 66000, essence, Airbags, 12495),
(9, 219, 14, 3, 119, 2000, cabriolet, 138000, essence, Airbags, 8495),


--Contenu de la table 'user'

DROP TABLE IF EXISTS "user";

CREATE TABLE "user" (
  "id" int NOT NULL,
  "isAdmin" BOOLEAN NOT NULL,
  "firstname" varchar(25) NOT NULL,
  "lastname" varchar (25) NOT NULL,
  "phone" INTEGER,
  "email" VARCHAR(20),
  "password"VARCHAR(20),
);

--
-- Contenu de la table 'user'
--

INSERT INTO "user" ("id", "isAdmin","firstname", "lastname", "phone","email", "password") VALUES
--
---


--Contenu de la table 'favorite'

DROP TABLE IF EXISTS "favorite";

CREATE TABLE "favorite" (
  "id" int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "userId" INT NOT NULL REFERENCES "userId" ("id"),
  "caradId" INT NOT NULL REFERENCES "caradId"("id"),
);

INSERT INTO "favorite" ("id", "userId","caradId") VALUES



--

COMMIT; -- fin de la transaction