-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `Nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categorias` (
  `idCategorias` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategorias`),
  UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Alias` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(20) NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `rol_usuario_fk_idx` (`rol` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE,
  UNIQUE INDEX `Alias_UNIQUE` (`Alias` ASC) VISIBLE,
  CONSTRAINT `rol_usuario_fk`
    FOREIGN KEY (`rol`)
    REFERENCES `mydb`.`Roles` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comentarios` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `idUsuarios` INT NOT NULL,
  `Contenido` TEXT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `Comentario_autor_fk_idx` (`idUsuarios` ASC) VISIBLE,
  CONSTRAINT `Comentario_autor_fk`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `mydb`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Hilos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hilos` (
  `idHilos` INT NOT NULL AUTO_INCREMENT,
  `ComentarioInicial` INT NOT NULL,
  PRIMARY KEY (`idHilos`),
  INDEX `comentarioIniical_hilo_fk_idx` (`ComentarioInicial` ASC) VISIBLE,
  CONSTRAINT `comentarioIniical_hilo_fk`
    FOREIGN KEY (`ComentarioInicial`)
    REFERENCES `mydb`.`Comentarios` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Comentarios_hilos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comentarios_hilos` (
  `idComentarios_hilos` INT NOT NULL AUTO_INCREMENT,
  `idHilos` INT NOT NULL,
  `idCometarios` INT NOT NULL,
  PRIMARY KEY (`idComentarios_hilos`),
  INDEX `Comentarioshilo_hilo_idx` (`idHilos` ASC) VISIBLE,
  INDEX `Comentariohilos_comentario_idx` (`idCometarios` ASC) VISIBLE,
  CONSTRAINT `Comentarioshilo_hilo`
    FOREIGN KEY (`idHilos`)
    REFERENCES `mydb`.`Hilos` (`idHilos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Comentariohilos_comentario`
    FOREIGN KEY (`idCometarios`)
    REFERENCES `mydb`.`Comentarios` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`Articulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Articulos` (
  `idArticulos` INT NOT NULL AUTO_INCREMENT,
  `FechaPublicacion` DATETIME NOT NULL,
  `fechaUltimamod` DATETIME NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Descripcion` TEXT NOT NULL,
  `contenido` LONGTEXT NOT NULL,
  `sololectura` TINYINT NOT NULL,
  `idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idArticulos`),
  INDEX `articulo_autor_idx` (`idUsuarios` ASC) VISIBLE,
  CONSTRAINT `articulo_autor`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `mydb`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`CategoriasArticulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CategoriasArticulos` (
  `idCategoriasArticulos` INT NOT NULL AUTO_INCREMENT,
  `idCategoria` INT NOT NULL,
  `idArticulo` INT NOT NULL,
  PRIMARY KEY (`idCategoriasArticulos`),
  INDEX `categoria_articulo_fk_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `articulo_categoria_fk_idx` (`idArticulo` ASC) VISIBLE,
  CONSTRAINT `categoria_articulo_fk`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `mydb`.`Categorias` (`idCategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `articulo_categoria_fk`
    FOREIGN KEY (`idArticulo`)
    REFERENCES `mydb`.`Articulos` (`idArticulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`HilosArticulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HilosArticulos` (
  `idHilosArticulos` INT NOT NULL AUTO_INCREMENT,
  `idArticulos` INT NOT NULL,
  `idHilos` INT NOT NULL,
  PRIMARY KEY (`idHilosArticulos`),
  INDEX `articulo_hilo_idx` (`idArticulos` ASC) VISIBLE,
  INDEX `hilo_articulo_fk_idx` (`idHilos` ASC) VISIBLE,
  CONSTRAINT `articulo_hilo_fk`
    FOREIGN KEY (`idArticulos`)
    REFERENCES `mydb`.`Articulos` (`idArticulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `hilo_articulo_fk`
    FOREIGN KEY (`idHilos`)
    REFERENCES `mydb`.`Hilos` (`idHilos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf16
COLLATE = utf16_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




-- modificaciones


ALTER TABLE `mydb`.`usuarios` 
DROP FOREIGN KEY `rol_usuario_fk`;
ALTER TABLE `mydb`.`usuarios` 
DROP INDEX `rol_usuario_fk_idx` ;
;

ALTER TABLE `mydb`.`roles` 
ADD COLUMN `idRoles` INT NOT NULL AUTO_INCREMENT AFTER `Nombre`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`idRoles`);
;



ALTER TABLE `mydb`.`usuarios` 
CHANGE COLUMN `rol` `rol` INT NOT NULL ,
ADD INDEX `rol_ususario_fk_idx` (`rol` ASC) VISIBLE;
;
ALTER TABLE `mydb`.`usuarios` 
ADD CONSTRAINT `rol_ususario_fk`
  FOREIGN KEY (`rol`)
  REFERENCES `mydb`.`roles` (`idRoles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

---consulta
select articulos.titulo, articulos.FechaPublicacion as Publicado, articulos.Descripcion, usuarios.alias
from articulos
inner join usuarios on usuarios.idUsuarios = articulos.idUsuarios;