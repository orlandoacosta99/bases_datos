use pokemondb;

create table test(
	id tinyint zerofill
    );    
insert into test  values(1);

select * from test;

create table SinSigno (
    numero SMALLINT UNSIGNED
);

create table Enumerados (
    id int auto_increment,
    valor Enum('Rojo', 'Amarillo', 'Verde'),
    Tamano tinyint,
    primary key (id)
);

insert into Enumerados values (valor, Tamano) values ('Rojo', 2),  ('Verde', 2),  ('verde', 3);

create table Conjuntos(
    id int auto_increment, 
    conj Set('Rojo', 'Amarillo', 'Verde'), 
    Cantidad int,
    primary key (id)
);

insert into Conjuntos(conj, Cantidad) values ('Rojo, Amarillo', 2);

-- se realizo con sulta con orden regular
select especies.nombre from especies
where Nombre REGEXP 'A|B{1}'
order by Nombre;

---copia de ña base
mysqldump -u Camilo -p -P 3316 pokemondb > "D:\Scrippokemondb"

