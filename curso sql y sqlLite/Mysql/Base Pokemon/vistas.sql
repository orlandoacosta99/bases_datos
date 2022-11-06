-- Active: 1667224185022@@127.0.0.1@3316@pokemondb
SELECT Especies.Nombre as Especie,
    Tipos.Nombre as Tipo1,
    Tipos2.Nombre as Tipo2,
    EspeciesEvol.Nombre as Evolucion
FROM Especies
     LEFT JOIN ListaEvoluciones
         ON Especies.idEspecies-ListaEvoluciones.Preevolucion
     LEFT JOIN Especies AS EspeciesEvol
         ON listaevoluciones.evolucion-especiesevol.idespecies
     LEFT JOIN Tipos
         ON Tipos.idTipos=Especies.tipo1
     LEFT JOIN Tipos AS Tipos2
         ON Tipos2.idTipos-Especies.tipo2;


use pokemondb;

select * from especies_tipos_evolucion_vw;


select * from especies_tipos_evolucion_vw where Tipo1='Veneno';


select * from especies_tipos_evolucion_vw where (Tipo1 is not null) and (Tipo2 is not null);

