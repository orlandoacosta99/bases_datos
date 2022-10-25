-- Active: 1666107076233@@127.0.0.1@3316@pokemondb
use pokemondb;

DELIMITER //

CREATE Procedure contar_especies(out cantidad int)
begin 
    Select count(*) into cantidad from especies;


end //

DELIMITER ;


call contar_especies(@CantidadEspecies);

select @cantidadEspecies;


-----------------------------------------------------------------------------


DELIMITER //

CREATE Procedure contar_especies_desde_numero(in numero_inicial int, out cantidad int)
begin 
   Select count(*) into cantidad from especies where Especies.Numero => numero_inicial;

end //

DELIMITER ;


call contar_especies_desde_numero(500, @CantidadEspecies);

SELECT @cantidadEspecies;

---------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE contar_especies_desde_numero_simple(inout valor int)
begin
    SELECT count(*) into valor from Especies where Especies.numero >= valor;

end //

DELIMITER ;


set @CantidadEspecies=500;

call contar_especies_desde_numero_simple(@CantidadEspecies);

SELECT @CantidadEspecies;

-------------------------------------------------------------------


DELIMITER //

CREATE PROCEDURE contar_especies_desde_nombre(in nombre varchar(15), out cantidad int)
begin 
    select count(*) into cantidad from Especies where Especies.Nombre>=nombre;
end //

DELIMITER ;




call contar_especies_desde_nombre('Pikachu', @MiCantidad);


SELECT @Micantidad;



