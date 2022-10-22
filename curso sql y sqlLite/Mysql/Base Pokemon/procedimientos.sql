-- Active: 1666107076233@@127.0.0.1@3316@pokemondb
use pokemondb; 
DELIMITER //
CREATE PROCEDURE pokemondb.pokemon_evoluciones()

BEGIN

    SELECT Especies.Nombre as Especies, EspeciesEvol.Nombre as Evolucion
    FROM Especies
    INNER JOIN ListaEvoluciones ON Especies.idEspecies = ListaEvoluciones.Preevolucion
    INNER JOIN Especies AS EspeciesEvol ON listaevoluciones.Evolucion = especiesEvol.idEspecies;
END //

DELIMITER ;


--- llamar un procedimieto

call pokemon_evoluciones;

SELECT Especies.Nombre as Especie, EspeciesEvol.Nombre as Evolucion
From especies
INNER JOIN ListaEvoluciones ON Especies.idEspecies = ListaEvoluciones.Preevolucion
INNER JOIN Especies AS EspeciesEvol On listaevoluciones.Evolucion = especiesEvol.idEspecies
wHERE Especies.Nombre='Pikachu';




-- creamos procedimiento

DELIMITER //
CREATE PROCEDURE pokemondb.pokemon_evolucion(in nombre_especie varchar(15))

BEGIN

    SELECT Especies.Nombre as Especie, EspeciesEvol.Nombre as Evolucion
    From especies
    INNER JOIN ListaEvoluciones ON Especies.idEspecies = ListaEvoluciones.Preevolucion
    INNER JOIN Especies AS EspeciesEvol On listaevoluciones.Evolucion = especiesEvol.idEspecies
    wHERE Especies.Nombre=nombre_especie;

END //

DELIMITER ;


call pokemon_evolucion('pikachu');