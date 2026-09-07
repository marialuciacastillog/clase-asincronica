# Taller 3 - Docker Compose y Nginx

Servicio Nginx con Docker Compose, contenido propio montado por volumen, imagen
construida desde Dockerfile, y reto integrador con dos servicios.

Enunciado: [`workshop_3.md`](workshop_3.md)
Evidencias y respuestas: [`evidencias-3-bash02.pdf`](evidencias-3-bash02.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) (Parte 3) y [`reto/docker-compose.yml`](reto/docker-compose.yml) (Parte 4) |
| `Dockerfile` para Nginx | [`Dockerfile`](Dockerfile) y [`reto/Dockerfile`](reto/Dockerfile) |
| Página `index.html` personalizada | [`html/index.html`](html/index.html) y [`reto/html/index.html`](reto/html/index.html) |
| Servicios funcionando correctamente | `evidencias-3-bash02.pdf` |
| Evidencia de `docker compose ps` | `evidencias-3-bash02.pdf` |
| Evidencia de acceso a Nginx | `evidencias-3-bash02.pdf` |
| Respuestas a las preguntas de análisis | `evidencias-3-bash02.pdf` |

## Sobre las versiones del `docker-compose.yml`

El taller modifica el mismo archivo cuatro veces. En esta carpeta está la versión
de la **Parte 3** (servicio construido desde el `Dockerfile`), que es la última de
la secuencia principal. Las versiones de las **Partes 1 y 2** están transcritas en
el documento de evidencias, y la de la **Parte 4** está en [`reto/`](reto).

## Carpeta `reto/` — Parte 4, reto integrador

Proyecto con dos servicios simultáneos y un volumen compartido:

| Archivo | Qué es |
|---|---|
| [`reto/docker-compose.yml`](reto/docker-compose.yml) | Servicios `web` (Nginx) y `monitor` (Ubuntu) |
| [`reto/Dockerfile`](reto/Dockerfile) | Imagen de Nginx con el contenido copiado |
| [`reto/ubuntu/Dockerfile`](reto/ubuntu/Dockerfile) | Imagen Ubuntu con los scripts y permisos de ejecución |
| [`reto/ubuntu/monitor.sh`](reto/ubuntu/monitor.sh), [`reto/ubuntu/analiza.sh`](reto/ubuntu/analiza.sh) | Scripts del Taller 1, ejecutables dentro del contenedor |
| [`reto/logs/registro.log`](reto/logs/registro.log) | Salida escrita en el volumen compartido entre los dos servicios |

## Cómo ejecutar

Parte 3:

```bash
docker compose up --build -d
docker compose ps
# http://localhost:8080
docker compose down
```

Parte 4 (reto):

```bash
cd reto
docker compose up --build -d
docker compose ps
docker compose exec monitor bash /scripts/monitor.sh
docker compose exec monitor bash /scripts/analiza.sh //logs/registro.log
docker compose down
```

> En Git Bash se usa `//logs` en lugar de `/logs`: la doble barra evita que la ruta
> se convierta al formato de Windows antes de enviarse al contenedor.