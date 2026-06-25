# Bases de Datos — Ejercicios y Configuración

Repositorio educativo de SQL que abarca **MySQL**, **SQLite**, **MariaDB** y **Oracle-style SQL**. Contiene ejercicios, scripts de configuración y ejemplos prácticos sobre diseño de bases de datos relacionales.

## Estructura del repositorio

```
bases_datos/
├── curso sql y sqlLite/   # Proyectos de aprendizaje MySQL + SQLite
│   ├── Mysql/              # 6 submódulos: curso completo MySQL
│   └── SqlLite/            # 2 submódulos: ejercicios en SQLite
├── mariadb/                # Scripts DDL y referencias cross-DBMS
├── sql/                    # Taller SQL estilo Oracle (DDL con restricciones)
└── README.md               # Este archivo
```

## Proyectos

### [`curso sql y sqlLite/Mysql/`](curso%20sql%20y%20sqlLite/Mysql/README.md)

Proyectos prácticos de MySQL que cubren un espectro completo de SQL:

| Submódulo | Temas |
|---|---|
| `tarea 1` / `ejercicio 1` | DDL, DML, JOINS (INNER/LEFT/RIGHT), subconsultas, funciones de agregación |
| `compras` | Variables de sesión, transacciones, INSERT desde SELECT |
| `Base Pokemon` | 16 tablas, vistas, procedimientos almacenados (IN/OUT/INOUT), funciones, cursores, triggers, índices FULLTEXT |
| `Base Banco` | Transacciones bancarias (COMMIT/ROLLBACK), procedimientos con IF-THEN-ELSE, cursores, triggers |
| `blog` | Esquema de blog, migración de esquemas (ALTER), relaciones many-to-many |
| `Indices` | Índices PRIMARY KEY, UNIQUE, INDEX, FULLTEXT |
| `Mibase` | Creación de usuarios, privilegios GRANT, comandos básicos |

### [`curso sql y sqlLite/SqlLite/`](curso%20sql%20y%20sqlLite/SqlLite/README.md)

Mismos esquemas de `AdministracionCursos` adaptados a SQLite con `INTEGER PRIMARY KEY AUTOINCREMENT`, `TEXT`, `date('now')` y CLI.

### [`mariadb/`](mariadb/README.md)

Scripts DDL básicos en MariaDB con tipos `UNSIGNED`, `BOOLEAN`, `DOUBLE`, y una guía de referencia cruzada para consultar metadatos en **MySQL/MariaDB**, **PostgreSQL** y **SQL Server**.

### [`sql/`](sql/README.md)

Taller SQL en sintaxis Oracle (VARCHAR2, NUMBER, TO_DATE). Implementa un **sistema de biblioteca** (10 tablas) y un **videoclub** con la metodología de crear tablas primero y luego agregar restricciones vía ALTER TABLE (PK, FK, UNIQUE, CHECK, NOT NULL).

## Convenciones

- Mayormente comentarios y datos en español
- Cada proyecto incluye instrucciones DDL y DML autocontenidas
- `sql/` usa sintaxis Oracle (VARCHAR2, NUMBER, `"SCHEMA"."TABLE"`, TO_DATE)
- `curso sql y sqlLite/` usa sintaxis MySQL y SQLite
