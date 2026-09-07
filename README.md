# Computación en la Nube e Internet de las Cosas

**Maria Lucía Castillo García**

Repositorio con los talleres de los bloques `bash_02` y `docker_03`.

## Cómo está organizado

Cada taller tiene su propia carpeta, y dentro de ella está todo lo necesario para
revisarlo sin buscar en otro lado:

| Archivo | Qué contiene |
|---|---|
| `README.md` | Índice de entregables: qué pidió el enunciado y en qué archivo está |
| `workshop_*.md` | El enunciado original del taller |
| `evidencias-*.pdf` | Evidencias de ejecución y respuestas de análisis (se abre en el navegador) |
| `evidencias-*.docx` | El mismo documento, en formato editable |
| *(resto)* | Los archivos entregables del taller |

Los documentos de evidencias contienen las capturas de ejecución y las respuestas
escritas. El contenido de los archivos de configuración y código **no** se repite
ahí: está en este repositorio, donde se puede leer y copiar directamente.

## bash_02

| Taller | Tema | Carpeta |
|---|---|---|
| 1 | Bash: análisis de logs y scripts | [`taller-1-bash`](bash_02/taller-1-bash) |
| 2 | Construcción de imágenes con Dockerfile | [`taller-2-dockerfile`](bash_02/taller-2-dockerfile) |
| 3 | Docker Compose y Nginx | [`taller-3-docker-compose-nginx`](bash_02/taller-3-docker-compose-nginx) |

## docker_03

| Taller | Tema | Carpeta |
|---|---|---|
| 1 | API Flask y balanceamiento de carga con Nginx | [`taller-1-flask-nginx-balanceo`](docker_03/taller-1-flask-nginx-balanceo) |
| 2 | Reverse proxy con Nginx | [`taller-2-reverse-proxy`](docker_03/taller-2-reverse-proxy) |
| 3 | Tres APIs Flask balanceadas con PostgreSQL | [`taller-3-flask-postgres-balanceo`](docker_03/taller-3-flask-postgres-balanceo) |
| 4 | PostgreSQL con Docker y Docker Compose | [`taller-4-postgresql-docker-compose`](docker_03/taller-4-postgresql-docker-compose) |
| 5 | MongoDB con Docker y Docker Compose | [`taller-5-mongodb-docker-compose`](docker_03/taller-5-mongodb-docker-compose) |

## Requisitos para ejecutar

- Docker Desktop (los talleres se desarrollaron en Windows con Git Bash)
- Los talleres que publican el puerto `8080` no pueden ejecutarse simultáneamente:
  hay que detener uno (`docker compose down`) antes de levantar otro.