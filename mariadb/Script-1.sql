
/*

create database Laboratorio charset utf8;
drop table if exists facturas

*/
use Laboratorio

 create table Facturas(
	Letras char  not null,
	Numero integer  not null,
	ClienteID integer,
	ArticuloID integer,
	Fecha date,
	Monto double,	
	primary key(Letras, Numero)
  )
  


  create table Articulos(
  	ArticuloID integer unsigned not null AUTO_INCREMENT primary key,
  	Nombre varchar(50),
  	Precio double,
  	Stock integer
  	
  )
  
  create table Clientes (
  	ClienteID integer  unsigned not null AUTO_INCREMENT primary key,
  	Nombre varchar(50),
  	Apellido varchar(50),
  	Cuit char(16),
  	Dirreccion varchar(50),
  	Comentarios varchar(50) 	
  	
  )
  
  