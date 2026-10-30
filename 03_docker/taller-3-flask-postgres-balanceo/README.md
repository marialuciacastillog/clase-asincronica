# Taller 3 - Tres APIs Flask Balanceadas con PostgreSQL

Tres instancias stateless de la misma API, balanceadas por Nginx, compartiendo una
única base de datos PostgreSQL.

Enunciado: [`workshop_3_flask_postgres_balanceo.md`](workshop_3_flask_postgres_balanceo.md)
Evidencias y respuestas: [`evidencias-3-docker03.pdf`](evidencias-3-docker03.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| API Flask | [`api/app.py`](api/app.py) |
| `Dockerfile` | [`api/Dockerfile`](api/Dockerfile) |
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) |
| `nginx.conf` | [`nginx/nginx.conf`](nginx/nginx.conf) |
| Script SQL | [`db/init/01-init.sql`](db/init/01-init.sql) |
| Evidencia del balanceamiento | `evidencias-3-docker03.pdf` |
| Evidencia de consulta a PostgreSQL | `evidencias-3-docker03.pdf` |
| Respuestas de análisis | `evidencias-3-docker03.pdf` |
| Reto: CRUD completo | [`api/app.py`](api/app.py) + evidencias en el PDF |

Dependencia adicional: [`api/requirements.txt`](api/requirements.txt) (Flask y `psycopg[binary]`).

## Arquitectura

```
Cliente → localhost:8080 → Nginx → api1 | api2 | api3 → PostgreSQL
```

Las credenciales de la base no están escritas en el código: llegan a cada instancia
como variables de entorno (`DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`) definidas
en el `docker-compose.yml`.

## Endpoints

| Método y ruta | Qué hace |
|---|---|
| `GET /products` | Lista todos los productos |
| `GET /products/<id>` | Consulta un producto |
| `POST /products` | Crea un producto |
| `PUT /products/<id>` | Actualiza un producto |
| `DELETE /products/<id>` | Elimina un producto |

Todas las respuestas incluyen `served_by` con la instancia que atendió la petición.

## Cómo ejecutar

```bash
docker compose up -d --build
docker compose ps

# Los datos son los mismos, served_by cambia
for i in {1..9}; do curl -s http://localhost:8080/products; echo; done

# Consultar la base directamente
docker compose exec db psql -U postgres -d shop -c "SELECT * FROM products;"
```

CRUD — un registro creado desde una instancia se consulta desde otra:

```bash
curl -s -X POST http://localhost:8080/products \
  -H "Content-Type: application/json" \
  -d '{"name":"Webcam","price":320000}'; echo

for i in {1..3}; do curl -s http://localhost:8080/products/6; echo; done
```

Tolerancia a fallos:

```bash
docker compose stop api2          # sigue respondiendo con api1 y api3
docker compose stop api3          # sigue respondiendo solo con api1
docker compose stop api1          # 502 Bad Gateway: Nginx se queda sin backends
docker compose start api1 api2 api3

docker compose down
```