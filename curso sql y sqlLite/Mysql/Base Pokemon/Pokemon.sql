
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
