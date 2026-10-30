# Taller 4 - PostgreSQL con Docker y Docker Compose

Construcción manual de una base de datos con `psql`, y luego su automatización
mediante scripts de inicialización y un volumen persistente.

Enunciado: [`workshop_4_postgresql_docker_compose.md`](workshop_4_postgresql_docker_compose.md)
Evidencias y respuestas: [`evidencias-4-docker03.pdf`](evidencias-4-docker03.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) |
| Directorio `postgres/init/` | [`postgres/init/`](postgres/init) |
| Scripts `.sql` | [`postgres/init/01-schema.sql`](postgres/init/01-schema.sql), [`postgres/init/02-data.sql`](postgres/init/02-data.sql) |
| Evidencia manual (Partes 1 y 2) | `evidencias-4-docker03.pdf` |
| Evidencia automática (Parte 5) | `evidencias-4-docker03.pdf` |
| Evidencia de esquemas, tablas y datos | `evidencias-4-docker03.pdf` |
| Reto: `teachers`, `courses`, `enrollments` y llaves foráneas | [`postgres/init/01-schema.sql`](postgres/init/01-schema.sql) + evidencias en el PDF |

## Sobre el `docker-compose.yml`

Esta carpeta contiene la versión final, con el volumen `postgres_data` y el
directorio de inicialización montado. La versión de la Parte 1 (sin volúmenes,
para construir el esquema manualmente) está documentada en el PDF de evidencias.

## Esquema `academia`

Cuatro tablas con integridad referencial:

```
students ──┐
           ├── enrollments
courses ───┘
   │
teachers
```

- `courses.teacher_id` → `teachers.id`
- `enrollments.student_id` → `students.id`
- `enrollments.course_id` → `courses.id`
- `enrollments` tiene `UNIQUE (student_id, course_id)`: impide matricular dos veces
  al mismo estudiante en el mismo curso.

Los scripts se ejecutan en orden alfabético, por eso el esquema (`01-`) va antes que
los datos (`02-`).

## Cómo ejecutar

```bash
# down -v borra el volumen: es lo que permite que los scripts vuelvan a ejecutarse
docker compose down -v
docker compose up -d
docker compose ps

docker compose exec postgres psql -U admin -d universidad -c "\dn"
docker compose exec postgres psql -U admin -d universidad -c "\dt academia.*"
docker compose exec postgres psql -U admin -d universidad -c "SELECT * FROM academia.students;"
```

Consulta que recorre las cuatro tablas:

```bash
docker compose exec postgres psql -U admin -d universidad -c "SELECT s.name AS estudiante, c.name AS curso, t.name AS profesor FROM academia.enrollments e JOIN academia.students s ON s.id = e.student_id JOIN academia.courses c ON c.id = e.course_id JOIN academia.teachers t ON t.id = c.teacher_id ORDER BY s.name;"
```

Comprobación de la integridad referencial (debe fallar):

```bash
docker compose exec postgres psql -U admin -d universidad -c "INSERT INTO academia.enrollments (student_id, course_id) VALUES (99, 1);"
```

Sesión interactiva (en Git Bash se necesita `winpty`):

```bash
winpty docker compose exec postgres psql -U admin -d universidad
```

> Los scripts de `/docker-entrypoint-initdb.d` **solo** se ejecutan cuando el
> directorio de datos está vacío. Un `docker compose restart` conserva los datos y
> no vuelve a correrlos; hace falta `docker compose down -v` para reinicializar.