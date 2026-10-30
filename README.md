# Computación en la Nube e Internet de las Cosas

**Maria Lucía Castillo García**

Repositorio con los talleres de los bloques `01_bash`, `02_bash`, `03_docker` y `04_aws_ec2`.

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

## 01_bash

| Taller | Tema | Carpeta |
|---|---|---|
| 1 | La terminal: navegar y manejar archivos | [`taller-1-terminal-basica`](01_bash/taller-1-terminal-basica) |
| 2 | Filtros, redirecciones y permisos | [`taller-2-filtros-y-permisos`](01_bash/taller-2-filtros-y-permisos) |
| 3 | Scripts | [`taller-3-scripts`](01_bash/taller-3-scripts) |
| 4 | Funciones, procesos y logs JSON | [`taller-4-procesos-y-json`](01_bash/taller-4-procesos-y-json) |
| 5 | Introducción a Docker | [`taller-5-introduccion-docker`](01_bash/taller-5-introduccion-docker) |

## 02_bash

| Taller | Tema | Carpeta |
|---|---|---|
| 1 | Bash: análisis de logs y scripts | [`taller-1-bash`](02_bash/taller-1-bash) |
| 2 | Construcción de imágenes con Dockerfile | [`taller-2-dockerfile`](02_bash/taller-2-dockerfile) |
| 3 | Docker Compose y Nginx | [`taller-3-docker-compose-nginx`](02_bash/taller-3-docker-compose-nginx) |

## 03_docker

| Taller | Tema | Carpeta |
|---|---|---|
| 1 | API Flask y balanceamiento de carga con Nginx | [`taller-1-flask-nginx-balanceo`](03_docker/taller-1-flask-nginx-balanceo) |
| 2 | Reverse proxy con Nginx | [`taller-2-reverse-proxy`](03_docker/taller-2-reverse-proxy) |
| 3 | Tres APIs Flask balanceadas con PostgreSQL | [`taller-3-flask-postgres-balanceo`](03_docker/taller-3-flask-postgres-balanceo) |
| 4 | PostgreSQL con Docker y Docker Compose | [`taller-4-postgresql-docker-compose`](03_docker/taller-4-postgresql-docker-compose) |
| 5 | MongoDB con Docker y Docker Compose | [`taller-5-mongodb-docker-compose`](03_docker/taller-5-mongodb-docker-compose) |

## 04_aws_ec2

| Taller | Tema | Carpeta |
|---|---|---|
| 1 | Crear y conectar una instancia EC2 | [`taller-1-crear-conectar-ec2`](04_aws_ec2/taller-1-crear-conectar-ec2) |
| 2 | Administración de Linux en EC2 | [`taller-2-administracion-linux`](04_aws_ec2/taller-2-administracion-linux) |
| 3 | Docker en EC2 con Nginx como reverse proxy | [`taller-3-docker-ec2`](04_aws_ec2/taller-3-docker-ec2) |
| 4 | Seguridad de red y Security Groups | [`taller-4-seguridad-red`](04_aws_ec2/taller-4-seguridad-red) |
| 5 | Automatización con User Data | [`taller-5-user-data`](04_aws_ec2/taller-5-user-data) |
| 6 | EC2 en una arquitectura escalable | [`taller-6-arquitectura-escalable`](04_aws_ec2/taller-6-arquitectura-escalable) |

## Requisitos para ejecutar

- Docker Desktop (los talleres se desarrollaron en Windows con Git Bash)
- Para `04_aws_ec2`: una cuenta de AWS (los talleres se hicieron en AWS Academy Learner Lab, región `us-east-1`) y la llave `.pem` de la instancia, que no se incluye en el repositorio
- Los talleres que publican el puerto `8080` no pueden ejecutarse simultáneamente:
  hay que detener uno (`docker compose down`) antes de levantar otro.