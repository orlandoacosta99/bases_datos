Insert Into PELICULAS values (1,'Avengers : Endgame',TO_DATE('22/04/2019','YYYY/MM/DD'), 'Marvel Studios', 'ACC');
Insert Into PELICULAS values (6,'Infinity War', TO_DATE('2018/04/24','YYYY/MM/DD'), 'Marvel Studios', 'ACC');
Insert Into PELICULAS values (3,'Iron Man: el hombre de hierro',TO_DATE(' 30/04/08','YYYY/MM/DD'), 'Marvel Studios', 'ACC');
Insert Into PELICULAS values (4,'Iron Man: 2', TO_DATE('26/04/10','YYYY/MM/DD'), 'Marvel Studios', 'ACC');
Insert Into PELICULAS values (5,'Iron Man: 3', TO_DATE('14/04/13','YYYY/MM/DD'), 'Marvel Studios', 'ACC');


Insert Into ACTORES values (1,'Christopher Robert','Estadounidense');
Insert Into ACTORES values (2,'Robert John Downey Jr.','Estadounidense');
Insert Into ACTORES values (3,'Christopher Hemsworth','Australiano');


Insert Into EJEMPLARES values (1,'B','DVD', '1', '1');
Insert Into EJEMPLARES values (2,'M','DVD', '2', '2');
Insert Into EJEMPLARES values (3,'R','CD', '2', '3');
Insert Into EJEMPLARES values (4,'R','CD', '3', '4');
Insert Into EJEMPLARES values (5,'M','BRAY', '3', '1');
Insert Into EJEMPLARES values (6,'R','CD', '2', '2');
Insert Into EJEMPLARES values (7,'M','DVD', '2', '3');
Insert Into EJEMPLARES values (8,'R','DVD', '3', '4');

SELECT * FROM PELICULAS;
SELECT * FROM ACTORES;
SELECT * FROM EJEMPLARES;

GRANT SELECT ON PELICULAS TO ICERRA;
GRANT SELECT ON ACTORES TO ICERRA;
GRANT SELECT ON EJEMPLARES TO ICERRA;
TRUNCATE TABLE PELICULAS;