
/*Crear una base de datos*/
/*
create database xxxxx charset utf8;

//mirar la base
show databases;

// eliminar la base de datos -no recomendado sin tener copia
drop database xxxxx;



// seleccionar la base 
use xxxx 
// crear una tabla con datos 
*/
 create table Productos(
	id_Productos int (11) unsigned not null AUTO_INCREMENT primary key, // llabe primaria
	Nombre varchar(50) not null,
	Precio double,
	Marca Varchar(60) not null,
	Stock int (6) not null,
	Disponible boolean default false
  )
// eliminar una tabla 
 drop table xxxx 
 // condicion si existe 
 drop table if exists xxxxx
// ver los datos de la tabla 
 select * from productos;
// Deja ver una descripcion de la tabla  
describe productos 
  
  
