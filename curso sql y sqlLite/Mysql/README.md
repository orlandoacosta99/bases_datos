# Proyectos MySQL

Colección de **6 submódulos** que cubren desde SQL básico hasta características avanzadas: procedimientos almacenados, cursores, triggers, transacciones, índices y vistas.

## Submódulos

### 1. `ejercicio 1` — Administración de Cursos (DDL + DML)
- Esquema `AdministracionCursos`: `materias`, `asignaturas`, `cursos`, `estudiantes`, `inscripciones`
- JOINS (INNER, LEFT, RIGHT), INSERT desde SELECT, `last_insert_id()`, `curdate()`
- `INSERCIONMASI.SQL`: `LOAD DATA INFILE`, `LIKE`, `LIMIT`, `ORDER BY`, `DISTINCT`
- `Consultarentretablas.sql`: todos los tipos de JOIN, subconsultas, tabla resumen

### 2. `tarea 1` — Esquema Académico
- Esquema `tarea1`: `Materias`, `Asignaturas`, `Cursos`, `Docentes`, `Estudiantes`, `Inscripciones`, `Examenes`, `Rediciones_Examen`
- FK con `ON DELETE/UPDATE NO ACTION`, UNIQUE, AUTO_INCREMENT

### 3. `compras` — Variables de Sesión
- Esquema `ComprasDB`: `Personas`, `Productos`, `ComprasPersonas`
- Variables `@PersonaID` / `@ProductoID`, INSERT con variables, cálculo de `Monto`

### 4. `Base Pokemon` — Proyecto más extenso (8 archivos)
- **16 tablas** modelando el universo Pokémon: `Categorias`, `Tipos`, `RelacionesTipos`, `Items`, `Movimientos`, `Especies`, y **7 mecanismos de evolución** (nivel, piedra, intercambio, amistad, objeto equipado, etc.)
- `vistas.sql`: Vistas con LEFT JOIN y self-joins
- `storeprocure.sql` / `procedimientos.sql`: Procedimientos con IN, OUT, INOUT
- `funciones.sql`: Función DETERMINISTIC
- `copiadb.sql`: Tipos de datos ZEROFILL, UNSIGNED, ENUM, SET, REGEXP
- `rutasimagen.sql`: ALTER TABLE CHANGE COLUMN (VARCHAR -> BLOB), CONCAT, Load_File()

### 5. `Base Banco` — Transacciones Bancarias
- Esquema `BancoDB`: `clientes`, `CuentasCliente`, `MovimientosCuenta`, `ControlClientes`
- Transferencias con `BEGIN` / `COMMIT` / `ROLLBACK`
- `procedimiento_if_then-else.sql`: Procedimiento con IF-THEN-ELSE para transferencias y validación de saldo
- `Disparadores.sql`: Trigger AFTER INSERT para auditoría
- `bucles.sql`: Cursor con LOOP para promociones, CONTINUE HANDLER

### 6. `blog` — Blog Platform
- Esquema `mydb`: `Roles`, `Categorias`, `Usuarios`, `Comentarios`, `Hilos`, `Comentarios_hilos`, `Articulos`, `CategoriasArticulos`, `HilosArticulos`
- Migración de esquema: ALTER TABLE para cambiar Rol de VARCHAR PK a INT FK
- ENGINE InnoDB, charset utf16_spanish_ci
- Many-to-many con tablas puente

### 7. `Indices` — Tipos de Índices
- Esquema `testeoindices`: `Personas`, `Personas2` (PK compuesta), `Productos` (UNIQUE), `Ventas` (INDEX), `Diccionario` (FULLTEXT)
- Búsqueda FULLTEXT con `MATCH ... AGAINST`

### 8. `Mibase` — Introducción
- CREATE USER / GRANT ALL PRIVILEGES
- INSERTs básicos, SELECT, ORDER BY, DISTINCT
- Mezcla educativa de comandos MySQL y SQLite
