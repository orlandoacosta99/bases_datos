
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
  	Direccion varchar(50),
  	Comentarios varchar(50) 	  	
  )
  
  // insercion de datos
  
  insert into Facturas values ('A', 1, 1, 1, '2011/10/10', 500);
  insert into Facturas values ('B', 2, 1, 1, '2011/10/11', 500);
  insert into Facturas values ('C', 3, 1, 1, '2011/01/10', 600);
  insert into Facturas values ('D', 4, 1, 1, '2011/08/13', 200); 
  insert into Facturas values ('E', 5, 1, 1, '2011/02/12', 300);
 
 
  insert into Clientes values ( 1, 'carlos','peña', 'o', 'cll 36 # 45 - 36', 'bien');
  insert into Clientes values ( 2, 'carlos','torres', 'o', 'cll 34 # 43 b- 36', 'bien');
 
  insert into Articulos values (1,'Papel', 100, 1); 
  insert into Articulos values (2,'martillo', 3200, 1);
  insert into Articulos values (3,'escoba', 3500, 1);
 
  // ver la tabla 
 select * FROM FACTURAS; 
 select * FROM articulos ; 
// ver otras bases y tabla 
select * from prueba1.productos;

// mirar solo un campo de la tabla ya seleccionada
select Nombre, cuit, direccion from Clientes;
// un sobrenombre u apodo con as
select nombre as 'nombre producto', precio, (precio*0.15) as descuento from articulos
// ordenar los datos de las tablas 
select * from articulos order by precio desc limit 2; 
 
