-- Active: 1666107076233@@127.0.0.1@3316@pokemondb
use pokemondb;

select * from especies;
update especies set frontSprite = ("C:\Users\orlan\Downloads\1_f.jpg") where Especies.idEspecies=1;

update especies set frontSprite = CONCAT('"C:\\Users\\orlan\\Downloads\\', Especies.idEspecies,'_f.jpg"')
where Especies.idEspecies >=1;


update especies set BackSprite = CONCAT('"C:\\Users\\orlan\\Downloads\\', Especies.idEspecies,'_b.jpg"')
where Especies.idEspecies >=1;

-- colocar todo en null
update especies set frontSprite =null, BackSprite = null where Especies.idEspecies >=1;


-- archivos blob
ALTER TABLE `pokemondb`.`especies` 
CHANGE COLUMN `FrontSprite` `FrontSprite` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `BackSprite` `BackSprite` BLOB NULL DEFAULT NULL ;


--agregar una imagen a la  base 
update especies set frontSprite = Load_file('C:\\Users\\orlan\\Downloads\\1.png') where Especies.idEspecies = 1;
