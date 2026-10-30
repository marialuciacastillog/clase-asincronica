# Taller 3 - Docker en EC2

API Flask en un contenedor dentro de la EC2, publicada en Internet y luego puesta detrás de Nginx
como reverse proxy.

Enunciado: [`workshop_3_docker_ec2.md`](workshop_3_docker_ec2.md)
Evidencias y respuestas: [`evidencias-3-aws04.pdf`](evidencias-3-aws04.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `Dockerfile` | [`app/Dockerfile`](app/Dockerfile) |
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) (final, con Nginx) y [`app/docker-compose.yml`](app/docker-compose.yml) (Parte 6) |
| Configuración Nginx | [`nginx/nginx.conf`](nginx/nginx.conf) |
| Evidencia de la API accesible desde Internet | `evidencias-3-aws04.pdf` |
| Explicación del flujo | `evidencias-3-aws04.pdf` |
| Reto: hostnames y hora | [`app/app.py`](app/app.py) + evidencias en el PDF |

## Sobre los archivos

- `app/app.py` es la versión final, la del reto.
- Hay dos `docker-compose.yml`: el de `app/` es el de la Parte 6 (solo Flask en el puerto 5000) y el de
  la raíz es el final, con Nginx en el 80 y Flask sin puertos publicados.
- Para mostrar el hostname de la EC2 dentro del contenedor, el compose final monta `/etc/hostname` de
  la EC2 como `/host_hostname` (solo lectura).

## Cómo ejecutar

En la EC2, con Docker instalado y el puerto 80 abierto en el security group:

```bash
docker compose up -d --build
curl http://localhost
```
