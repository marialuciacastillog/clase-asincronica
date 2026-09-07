# Taller 1 - API Flask y Balanceamiento de Carga con Nginx

Tres instancias de la misma API Flask, balanceadas por Nginx mediante round robin.

Enunciado: [`workshop_1_flask_nginx_balanceo.md`](workshop_1_flask_nginx_balanceo.md)
Evidencias y respuestas: [`evidencias-1-docker03.pdf`](evidencias-1-docker03.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `app.py` | [`api/app.py`](api/app.py) |
| `requirements.txt` | [`api/requirements.txt`](api/requirements.txt) |
| `Dockerfile` | [`api/Dockerfile`](api/Dockerfile) |
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) |
| `nginx.conf` | [`nginx/nginx.conf`](nginx/nginx.conf) |
| Evidencias del balanceamiento | `evidencias-1-docker03.pdf` |
| Respuestas a las preguntas | `evidencias-1-docker03.pdf` |
| Reto: endpoint `/health` | [`api/app.py`](api/app.py) + evidencias en el PDF |

## Nota sobre `nginx.conf`

La configuración se monta como archivo principal (`/etc/nginx/nginx.conf`) en lugar
del fragmento en `conf.d/`, para poder fijar `worker_processes 1`. Con la
configuración por defecto (`worker_processes auto`) Nginx levantó 12 procesos
worker, y como cada worker mantiene su propio contador de round robin, la rotación
esperada no se observaba. El hallazgo está documentado en el PDF de evidencias.

## Arquitectura

```
Cliente → localhost:8080 → Nginx → api1 | api2 | api3
```

Las tres APIs no publican puertos al host: solo son alcanzables a través de Nginx.

## Cómo ejecutar

```bash
docker compose up -d --build
docker compose ps

curl http://localhost:8080/
curl http://localhost:8080/health

# Balanceamiento: 12 peticiones rotando entre las tres instancias
for i in {1..12}; do curl -s http://localhost:8080/; echo; done

# Tolerancia a fallos: el servicio sigue con una instancia caída
docker compose stop api2
for i in {1..12}; do curl -s http://localhost:8080/; echo; done
docker compose start api2

docker compose down
```