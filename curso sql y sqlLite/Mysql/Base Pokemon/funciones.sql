-- Active: 1666107076233@@127.0.0.1@3316@pokemondb
use pokemondb;
DELIMITER //
CREATE FUNCTION cantidad_especies(nombre varchar(15)) RETURNS INT deterministic
begin
    Declare miCantidad int;
    select count(*) into miCantidad from Esecies where Especies.Nombre>=nombre;
    return(miCantidad);

END //
DELIMITER ;


select count(*) from especies;


set @MiCantidad  = cantidad_especies('Pikachu');


SELECT Especies.Nombre from Especies where Especies.idEspecies = Cantidad_especies('Raichu');

