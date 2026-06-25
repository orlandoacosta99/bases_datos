# Consultas de Metadatos entre Sistemas Gestores

Referencia rápida de comandos para obtener información del esquema en **MySQL/MariaDB**, **PostgreSQL** y **SQL Server**.

---

## TODO: 1. Listar bases de datos

### MySQL / MariaDB
```sql
SHOW DATABASES;
```

### PostgreSQL
```sql
SELECT datname FROM pg_database WHERE datistemplate = false;
```
```bash
# En psql:
\l
```

### SQL Server
```sql
SELECT name, database_id, create_date FROM sys.databases;
```

---

## TODO: 2. Listar tablas de una base de datos

### MySQL / MariaDB
```sql
USE nombre_base_datos;
SHOW TABLES;
```
```sql
SELECT TABLE_NAME, TABLE_TYPE, ENGINE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'nombre_base_datos';
```

### PostgreSQL
```bash
# En psql:
\c nombre_base_datos
\dt
```
```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE';
```

### SQL Server
```sql
USE nombre_base_datos;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
```

---

## TODO: 3. Identificar columnas con llaves foráneas (FK)

### MySQL / MariaDB
```sql
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'nombre_base_datos'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;
```

### PostgreSQL
```sql
SELECT
    tc.table_name,
    kcu.column_name,
    tc.constraint_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
ORDER BY tc.table_name;
```

### SQL Server
```sql
SELECT
    fk.name AS constraint_name,
    OBJECT_NAME(fk.parent_object_id) AS table_name,
    COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS column_name,
    OBJECT_NAME(fk.referenced_object_id) AS referenced_table,
    COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS referenced_column
FROM sys.foreign_keys AS fk
INNER JOIN sys.foreign_key_columns AS fkc
    ON fk.object_id = fkc.constraint_object_id
ORDER BY table_name;
```

---

## TODO: 4. Script completo de ejemplo (MySQL)

```sql
-- 1. Listar todas las bases de datos
SHOW DATABASES;

-- 2. Seleccionar una base y listar sus tablas
USE mi_base_datos;
SHOW TABLES;

-- 3. Ver detalles de llaves foráneas
SELECT
    TABLE_NAME AS 'Tabla',
    COLUMN_NAME AS 'Columna',
    CONSTRAINT_NAME AS 'Restricción',
    REFERENCED_TABLE_NAME AS 'Tabla Referenciada',
    REFERENCED_COLUMN_NAME AS 'Columna Referenciada'
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'mi_base_datos'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;
```
