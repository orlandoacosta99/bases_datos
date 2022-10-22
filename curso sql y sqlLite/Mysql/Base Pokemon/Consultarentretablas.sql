use pokemondb;

Select * from pokemondb.Especies;

Select * from pokemondb.tipos;


SELECT pokemondb.Especies.Nombre as Pokemon, pokemondb.tipos.nombre as Tipo1
from Especies, tipos
where Especies.tipo1 = tipos.idTipos 
ORDER BY Especies.idEspecies;

SELECT Especies.Nombre as Pokemon, TiposPrimarios.nombre as Tipo1, TiposSecundarios.Nombre as Tipo2
from Especies, Tipos TiposPrimarios, Tipos TiposSecundarios
where Especies.tipo1 = TiposPrimarios.idTipos and 
    Especies.tipo2 = TiposSecundarios.idTipos
ORDER BY Especies.idEspecies;


SELECT Especies.Nombre as Pokemon, TiposPrimarios.nombre as Tipo1, TiposSecundarios.Nombre as Tipo2
from Especies
INNER JOIN Tipos as TiposPrimarios on Especies.tipo1 = TiposPrimarios.idTipos
INNER JOIN Tipos as TiposSecundarios on  Especies.tipo2 = TiposSecundarios.idTipos
ORDER BY Especies.idEspecies;


SELECT PreevolucionEspecie.Nombre as Preev, EvolucionEspecie.Nombre as Evol
from Especies PreevolucionEspecie, Especies EvolucionEspecie, listaEvoluciones
WHERE PreevolucionEspecie.idEspecies = listaEvoluciones.Preevolucion AND
    EvolucionEspecie.idEspecies = listaEvoluciones.Evolucion;

SELECT PreevolucionEspecie.Nombre as Preev, EvolucionEspecie.Nombre as Evol
from Especies as PreevolucionEspecie
INNER JOIN listaEvoluciones on PreevolucionEspecie.idEspecies = listaEvoluciones.Preevolucion
INNER JOIN Especies as EvolucionEspecie on EvolucionEspecie.idEspecies = listaEvoluciones.Evolucion;


--- variables de sql

SHOW DATABASE;

use pokemondb;
 
SELECT Count(*) as cantidad from Especies;


SELECT @MisEspecies := COUNT(*) from Especies;

create table cantidades (
    id int AUTO_INCREMENT PRIMARY KEY,
    cant int

);

INSERT INTO Cantidades (cant) values(@MisEspecies);

SELECT COUNT(Nombre) as Pikachus 
from Especies 
WHERE Nombre= 'Pikachu';

SELECT COUNT(Nombre) as Raichu 
from Especies 
WHERE Nombre= 'Raichu';


SELECT @MisRaichu := COUNT(*)
from Especies
WHERE Nombre= 'Raichu';

INSERT INTO Cantidades (cant) values(@MisRaichu);


SELECT * from Cantidades;
 

Select Nombre From Especies Where idEspecies<=@MisRaichu;

set @NombrePokemon = 'Pikachu';

/*
SELECT @MisRaichu := COUNT(Nombre)
from Especies
WHERE Nombre = @NombrePokemon;*/

--mirar lo que tiene una variable
SELECT @NombrePokemon;

set @NombrePokemon = 10;

SELECT @SinTipo2 := COUNT(*) FROM Especies WHERE Tipo2 is NULL;

set @Contipo2 = @MisEspecies-@SinTipo2;

SELECT @Contipo2;



