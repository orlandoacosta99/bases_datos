create table Peliculas
(
    ID      NUMBER(10),
    Titulo      VARCHAR(50),  --Obligatiro  
    Annnio       DATE, --Obligatiro 
    Productora       VARCHAR(50),
    Genero      CHAR(4) --- ACC, DRA, ROM, TER, COM (OTRAS MAS)
);

ALTER TABLE Peliculas
    ADD CONSTRAINT CHK_PEL_GENERO
        CHECK(  GENERO IN ('ACC', 'DRA', 'ROM', 'TER', 'COM', 'WES'));


ALTER TABLE Peliculas
    ADD CONSTRAINT CHK_NN_PEL_TITULO
          CHECK(  TITULO IS NOT NULL    );


ALTER TABLE Peliculas
    ADD CONSTRAINT CHK_NN_PEL_ANNIO
          CHECK(  ANNIO IS NOT NULL    );


ALTER TABLE Peliculas
    ADD CONSTRAINT CHK_NN_PEL_GENERO
          CHECK(  GENERO IS NOT NULL    );

ALTER TABLE Peliculas
    ADD CONSTRAINT UN_PEL_TITULO
        UNIQUE(TITULO);

CREATE TABLE Ejemplares
(
    Id_Ejemplar         NUMBER(10), -- ES PRIMARY KEY 
    Estado_Conservacion      CHAR(1), --- B,R,M -Obligatiro
    Formato         char(4), -- DVD, CD, VHS, BET -Obligatiro
    NRO         char(2),
    Id_Pelicula      NUMBER(10) ---Obligatiro
);

ALTER TABLE Ejemplares
  ADD CONSTRAINT CHK_EJE_Estado_Conservacion 
        CHECK(  Estado_Conservacion IN ('B', 'R', 'M'));


ALTER TABLE Ejemplares
  ADD CONSTRAINT CHK_EJE_Formato 
        CHECK(  Formato IN ('DVD', 'CD', 'VHS', 'BET', 'BRAY'));

ALTER TABLE Ejemplares
    ADD CONSTRAINT CHK_NN_EJE_Estado_Conservacion
          CHECK(  Estado_Conservacion IS NOT NULL    );

ALTER TABLE Ejemplares
    ADD CONSTRAINT CHK_NN_EJE_Formato
          CHECK(  Formato IS NOT NULL    );´

ALTER TABLE Ejemplares
    ADD CONSTRAINT CHK_NN_EJE_Id_Pelicula 
          CHECK(  Id_Pelicula  IS NOT NULL    );


CREATE TABLE Actores
(
    ID      NUMBER(10),
    NOMBRE      VARCHAR(60),---Obligatiro
    NACIONALIDAD        VARCHAR(50)---Obligatiro
);

ALTER TABLE ACTORES
    ADD CONSTRAINT CHK_NN_ACT_NOMBRE 
          CHECK(  NOMBRE   IS NOT NULL    );
ALTER TABLE ACTORES
    ADD CONSTRAINT CHK_NN_ACT_NACIONALIDAD 
          CHECK(  NACIONALIDAD   IS NOT NULL    );

CREATE TABLE Actores_Pelicula
(
    Id_Pelicula         NUMBER(10),
    Id_Actor         NUMBER(10),
    ROL      VARCHAR(50),
    ID_PEL      NUMBER(10),
    Id_Act      NUMBER(10),
);

delete from Peliculas
 where id=6;

