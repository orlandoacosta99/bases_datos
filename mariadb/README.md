# MariaDB — Scripts DDL y Referencias

Scripts de ejemplo en MariaDB para operaciones DDL básicas y una guía de referencia cruzada entre sistemas gestores.

## Archivos

| Archivo | Descripción |
|---|---|
| `Script.sql` | Creación del esquema `Laboratorio` con tablas `Facturas`, `Articulos` y `Clientes`. Incluye INSERTs y SELECTs con ORDER BY DESC y LIMIT |
| `Script-1.sql` | Ejemplo de `Productos` con tipos `INT UNSIGNED`, `BOOLEAN DEFAULT FALSE`. Operaciones DDL: CREATE, DROP, SHOW DATABASES |
| `idice.sql` | Guía de referencia para consultar metadatos (bases de datos, tablas, foreign keys) en **MySQL/MariaDB**, **PostgreSQL** y **SQL Server** usando `information_schema` y comandos nativos |

## Temas cubiertos

- Tipos de datos: `INT UNSIGNED`, `DOUBLE`, `BOOLEAN`, `AUTO_INCREMENT`
- DDL: `CREATE TABLE`, `DROP TABLE`, `DROP TABLE IF EXISTS`
- DML: `INSERT`, `SELECT` con alias (`AS`), expresiones aritméticas, `ORDER BY ... DESC LIMIT`
- Metadata: consultas `information_schema.TABLES`, `information_schema.KEY_COLUMN_USAGE`
- Cross-DBMS: sintaxis equivalente en PostgreSQL (`pg_database`, `\l`, `\dt`) y SQL Server (`sys.databases`, `sys.foreign_keys`)
