# Proyectos SQLite

Adaptación de los ejercicios de `AdministracionCursos` a la sintaxis y características propias de SQLite.

## Archivos

| Archivo | Descripción |
|---|---|
| `Mibase/Mibase.sql` | Tabla `Inscripciones` con CREATE, INSERT y SELECT básicos. Invocación CLI: `sqlite3 MiBase.db` |
| `ejercicio 1/hoja_ejercicios.sql` | Esquema `AdministracionCursos` completo: Materias, Asignaturas, Cursos, Estudiantes, InscripcionesCursos |

## Diferencias con MySQL

| Concepto | MySQL | SQLite |
|---|---|---|
| Auto-incremento | `INT AUTO_INCREMENT` | `INTEGER PRIMARY KEY AUTOINCREMENT` |
| Texto | `VARCHAR(n)` | `TEXT` |
| Fecha actual | `curdate()` | `date('now')` |
| Último ID insertado | `last_insert_id()` | `last_insert_rowid()` |
| Formato CLI | N/A | `.mode column`, `.header on` |

## Contenido educativo

- `CREATE TABLE IF NOT EXISTS`
- `INSERT`, `UPDATE` (con precaución: UPDATE sin WHERE en Materias)
- `SELECT` con joins
- Tipos de datos: `INTEGER`, `TEXT`, `REAL`
