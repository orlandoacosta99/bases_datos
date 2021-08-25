create table Peliculas
(
    ID      NUMBER(10),
    Titulo      VARCHAR(50),
    Annnio       DATE,
    Productora       VARCHAR(50),
    Genero      CHAR(4) --- ACC, DRA, RONM
);


CREATE TABLE Ejemplares
(
    Id_Ejemplar         NUMBER(10),
    Estado_Conservacion      CHAR(1),
    Formato         char(4),
    NRO         char(2),
    Id_Pelicula      NUMBER(10)
);


CREATE TABLE Actores_Pelicula
(
    Id_Pelicula         NUMBER(10),
    Id_Actor         NUMBER(10),
    ROL      VARCHAR(50),
    ID_PEL      NUMBER(10),
    Id_Act      NUMBER(10),
);


CREATE TABLE Actores
(
    ID      NUMBER(10),
    NOMBRE      VARCHAR(60),
    NACIONALIDAD        VARCHAR(50)
);


-- SE ALTERAN LAS TABLAS PARA IMPONER LAS RESTRICCION PRIMARY KEY, FOREIGN KEY, CHECK, NOT NULL

ALTER TABLE 
    ADD CONSTRAINT PK_PELICULAS
        PRIMARY KEY (ID);

ALTER TABLE Actores
    ADD CONSTRAINT PK_ACTORES
        PRIMARY KEY (ID);

ALTER TABLE Ejemplares
    ADD CONSTRAINT PK_Ejemplares
        PRIMARY KEY (Id_Ejemplar);

ALTER TABLE ACTORES_Peliculas
    ADD CONSTRAINT PK_ACT_PEL
        PRIMARY KEY (Id_Pelicula, Id_Actor);


-- ALTERAMOS PARA IMPONER LA RESTRICCION FORANEA A LAS COLUMNAS CORRESPONDIENTES

ALTER TABLE Ejemplares
    ADD CONSTRAINT FK_EJE_PEL
        FOREIGN KEY (Id_Pelicula)
            REFERENCES Peliculas(ID);


ALTER TABLE Actores_Pelicula
    ADD CONSTRAINT FK_AP_PEL
        FOREIGN KEY (Id_Pelicula)
            REFERENCES Peliculas(ID);

ALTER TABLE Actores_Pelicula
    ADD CONSTRAINT FK_AP_ACT
        FOREIGN KEY (Id_Actor)
            REFERENCES Actores (ID);


