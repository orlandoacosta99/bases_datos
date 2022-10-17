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









