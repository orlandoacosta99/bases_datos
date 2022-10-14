
Create database pokemondb;

use pokemondb;

CREATE TABLE Categorias 
(
    idCategoria INT NOT NULL, 
    Categoria VARCHAR(10) NOT NULL, 
    PRIMARY KEY(idCategoria)
);


INSERT INTO Categorias VALUES(1, 'Físico'), (2, 'Especial'), (3, 'Estado');


CREATE TABLE `pokemondb`.`tipos` (
  `idTipos` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipos`),
  UNIQUE INDEX `IndiceNombreTipo` (`Nombre` ASC) VISIBLE);


CREATE TABLE `pokemondb`.`relacionestipos` (
  `idRelacionesTipos` INT NOT NULL,
  `TipoAtaque` INT NOT NULL,
  `TipoDefensa` INT NOT NULL,
  `Relacion` DECIMAL NULL,
  PRIMARY KEY (`idRelacionesTipos`),
  INDEX `NombreTipoAtaque_idx` (`TipoAtaque` ASC) VISIBLE,
  INDEX `NombreTipoDefensa_idx` (`TipoDefensa` ASC) VISIBLE,
  CONSTRAINT `NombreTipoAtaque`
    FOREIGN KEY (`TipoAtaque`)
    REFERENCES `pokemondb`.`tipos` (`idTipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NombreTipoDefensa`
    FOREIGN KEY (`TipoDefensa`)
    REFERENCES `pokemondb`.`tipos` (`idTipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `pokemondb`.`items` (
  `idItems` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Compra` VARCHAR(45) NOT NULL,
  `Venta` INT NOT NULL,
  `Estatus` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idItems`));

CREATE TABLE `pokemondb`.`movimientos` (
  `idMovimientos` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Tipo` INT NOT NULL,
  `Categoria` INT NULL,
  `PP` TINYINT(3) NOT NULL,
  `Poder` TINYINT(3) NULL,
  `Precision` TINYINT(3) NULL,
  PRIMARY KEY (`idMovimientos`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE,
  INDEX `TipodeMovimiento_idx` (`Tipo` ASC) VISIBLE,
  INDEX `CategoriaDeMovimiento_idx` (`Categoria` ASC) VISIBLE,
  CONSTRAINT `TipodeMovimiento`
    FOREIGN KEY (`Tipo`)
    REFERENCES `pokemondb`.`tipos` (`idTipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CategoriaDeMovimiento`
    FOREIGN KEY (`Categoria`)
    REFERENCES `pokemondb`.`categorias` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE Especies (
    idEspecies INT NOT NULL,
    Numero INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Variante VARCHAR(20) NOT NULL,
    FrontSprite VARCHAR(45),
    BackSprite VARCHAR(45),
    CantTipos TINYINT(2),
    Tipo1 INT NOT NULL,
    Tipo2 INT,
    PS SMALLINT(3) NOT NULL,
    Ataque SMALLINT(3) NOT NULL,
    Defensa SMALLINT(3) NOT NULL,
    AtaqueSp SMALLINT(3) NOT NULL,
    DefensaSp SMALLINT(3) NOT NULL,
    Velocidad SMALLINT(3) NOT NULL,
    Promedio DECIMAL NOT NULL,
    Desviacion DECIMAL NOT NULL,
    Suma SMALLINT NOT NULL,
    ExpBase SMALLINT(3) NOT NULL,
    PS_EV TINYINT(1) NOT NULL,
    Ataque_EV TINYINT(1) NOT NULL,
    Defensa_EV TINYINT(1) NOT NULL,
    AtaqueSP_EV TINYINT(1) NOT NULL,
    DefensaSP_EV TINYINT(1) NOT NULL,
    Velocidad_ev TINYINT(2) NOT NULL,
    PRIMARY KEY (idEspecies),
    FOREIGN KEY (Tipo1) REFERENCES Tipos(idTipos),
    FOREIGN KEY (Tipo2) REFERENCES Tipos(idTipos));



CREATE TABLE `pokemondb`.`tiposdeevolucion` (
  `idTiposDeEvolucion` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTiposDeEvolucion`),
  UNIQUE INDEX `Tipo_UNIQUE` (`Tipo` ASC) VISIBLE);


CREATE TABLE `pokemondb`.`listaevoluciones` (
  `idListaEvoluciones` INT NOT NULL,
  `Preevolucion` INT NOT NULL,
  `Evolucion` INT NOT NULL,
  `TipoEvolucion` INT NOT NULL,
  PRIMARY KEY (`idListaEvoluciones`),
  INDEX `PreevolucionEspecies_idx` (`Preevolucion` ASC) VISIBLE,
  INDEX `EvolucionEspecies_idx` (`Evolucion` ASC) VISIBLE,
  INDEX `TiposDeEvolucion_idx` (`TipoEvolucion` ASC) VISIBLE,
  CONSTRAINT `PreevolucionEspecies`
    FOREIGN KEY (`Preevolucion`)
    REFERENCES `pokemondb`.`especies` (`idEspecies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EvolucionEspecies`
    FOREIGN KEY (`Evolucion`)
    REFERENCES `pokemondb`.`especies` (`idEspecies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TiposDeEvolucion`
    FOREIGN KEY (`TipoEvolucion`)
    REFERENCES `pokemondb`.`tiposdeevolucion` (`idTiposDeEvolucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE IF NOT EXISTS EvolucionPorNivel (
    idEvolucionPorNivel INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL, 
    Nivel TINYINT(3), 
    PRIMARY KEY (idEvolucionPorNivel),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies));

CREATE TABLE IF NOT EXISTS EvolucionPorPiedra (
    idEvolucionPorPiedra INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL, 
    Piedra INT NOT NULL, 
    PRIMARY KEY (idEvolucionPorPiedra),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Piedra) REFERENCES Items(idItems)
);


CREATE TABLE IF NOT EXISTS EvolucionPorIntercambio (
    idEvolucionPorIntercambio INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL,
    PRIMARY KEY (idEvolucionPorIntercambio),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies)
);

CREATE TABLE IF NOT EXISTS EvolucionPorIntercambioE (
    idEvolucionPorIntercambioE INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL,
    Objeto int not null,
    PRIMARY KEY (idEvolucionPorIntercambioE),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies),
     FOREIGN KEY (Objeto) REFERENCES Items(idItems)
);

CREATE TABLE IF NOT EXISTS EvolucionPorAmistad (
    idEvolucionPorAmistad INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL, 
    Nivel TINYINT(3), 
    Amistad TINYINT(3), 
    PRIMARY KEY (idEvolucionPorAmistad),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies)
);

CREATE TABLE IF NOT EXISTS EvolucionPorAmistadM (
    idEvolucionPorAmistadM INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL, 
    Movimiento INT NOT NULL, 
    Amistad TINYINT(3), 
    PRIMARY KEY (idEvolucionPorAmistadM),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies), 
    FOREIGN KEY (movimiento) REFERENCES movimientos(idmovimientos)
);

CREATE TABLE IF NOT EXISTS EvolucionPorObjetoEquipado (
    idEvolucionPorObjetoEquipado INT NOT NULL, 
    Preevolucion INT NOT NULL,
    Evolucion INT NOT NULL, 
    Objeto INT NOT NULL,  
    PRIMARY KEY (idEvolucionPorObjetoEquipado),
    foreign KEY (Preevolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Evolucion) REFERENCES Especies(idEspecies),
    FOREIGN KEY (Objeto) REFERENCES Items(idItems)
);

