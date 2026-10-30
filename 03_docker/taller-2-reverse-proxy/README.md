# Taller 2 - Reverse Proxy con Nginx

Nginx como punto único de entrada que enruta cada ruta hacia un servicio distinto,
y luego balancea dos de esas rutas entre varias instancias.

Enunciado: [`workshop_2_reverse_proxy.md`](workshop_2_reverse_proxy.md)
Evidencias y respuestas: [`evidencias-2-docker03.pdf`](evidencias-2-docker03.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| APIs Flask | [`users/app.py`](users/app.py), [`products/app.py`](products/app.py), [`orders/app.py`](orders/app.py) |
| Dockerfiles | [`users/Dockerfile`](users/Dockerfile), [`products/Dockerfile`](products/Dockerfile), [`orders/Dockerfile`](orders/Dockerfile) |
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) |
| `nginx.conf` | [`nginx/nginx.conf`](nginx/nginx.conf) |
| Evidencias de routing | `evidencias-2-docker03.pdf` |
| Evidencias del cambio a load balancing | `evidencias-2-docker03.pdf` |
| Explicación escrita de la diferencia entre ambos escenarios | `evidencias-2-docker03.pdf` |
| Reto: ruta `/api/orders/` balanceada | [`orders/`](orders) + `nginx.conf` + evidencias en el PDF |

## Estado final de la configuración

El `nginx.conf` de esta carpeta corresponde a la **Parte 5** (más el reto), donde
conviven los dos mecanismos:

| Ruta | Backend | Mecanismo |
|---|---|---|
| `/api/users/` | `users1`, `users2` | Reverse proxy + load balancing |
| `/api/products/` | `products` | Reverse proxy + routing |
| `/api/orders/` | `orders1`, `orders2` | Reverse proxy + load balancing |

La versión de la **Parte 3** (una sola instancia por ruta, sin bloques `upstream`)
está documentada en el PDF de evidencias, junto con la comparación experimental
entre ambos escenarios.

El campo `instance` de las respuestas no está en el enunciado: se agregó para poder
identificar qué instancia atendió cada petición y así evidenciar el balanceamiento.

## Cómo ejecutar

```bash
docker compose up -d --build
docker compose ps

curl http://localhost:8080/api/users/
curl http://localhost:8080/api/products/
curl http://localhost:8080/api/orders/

# Rutas balanceadas: alternan entre dos instancias
for i in {1..6}; do curl -s http://localhost:8080/api/users/; echo; done
for i in {1..6}; do curl -s http://localhost:8080/api/orders/; echo; done

# Ruta con un solo backend: siempre responde la misma instancia
for i in {1..6}; do curl -s http://localhost:8080/api/products/; echo; done

docker compose down
```

> La barra final de las rutas es obligatoria: `/api/users/` funciona, `/api/users`
> devuelve 404, porque el bloque `location` está definido con barra.