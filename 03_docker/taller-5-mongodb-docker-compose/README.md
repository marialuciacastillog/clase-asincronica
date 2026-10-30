# Taller 5 - MongoDB con Docker y Docker Compose

Creación manual de una base documental con `mongosh`, y luego su automatización
mediante un script JavaScript de inicialización.

Enunciado: [`workshop_5_mongodb_docker_compose.md`](workshop_5_mongodb_docker_compose.md)
Evidencias y respuestas: [`evidencias-5-docker03.pdf`](evidencias-5-docker03.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `docker-compose.yml` | [`docker-compose.yml`](docker-compose.yml) |
| Carpeta `mongo/init/` | [`mongo/init/`](mongo/init) |
| Script `.js` | [`mongo/init/01-init.js`](mongo/init/01-init.js) |
| Evidencia de creación manual | `evidencias-5-docker03.pdf` |
| Evidencia de carga automática | `evidencias-5-docker03.pdf` |
| Consultas realizadas | `evidencias-5-docker03.pdf` |
| Comparación PostgreSQL vs MongoDB | `evidencias-5-docker03.pdf` |
| Reto: colecciones `products`, `customers`, `orders` | [`mongo/init/01-init.js`](mongo/init/01-init.js) + evidencias en el PDF |

## Sobre el `docker-compose.yml`

Esta carpeta contiene la versión final, con el volumen `mongo_data` y el directorio
de inicialización montado. La versión de la Parte 1 (sin volúmenes, para crear la
base manualmente) está documentada en el PDF de evidencias.

## Base `tienda`

| Colección | Contenido |
|---|---|
| `products` | Productos con nombre, precio y stock |
| `customers` | Clientes con nombre y correo |
| `orders` | Órdenes con fecha, `customerId` y una lista anidada `items` |

Una orden guarda sus productos **dentro del mismo documento**, en el arreglo `items`.
En un modelo relacional eso sería una tabla aparte con su llave foránea.

## Cómo ejecutar

```bash
docker compose down -v
docker compose up -d
docker compose ps

winpty docker compose exec mongo mongosh -u admin -p admin --authenticationDatabase admin
```

Dentro de `mongosh`:

```javascript
use tienda
show collections
db.products.find()
db.customers.find()
db.orders.find()

// Consulta dentro del arreglo anidado: devuelve la orden completa
db.orders.find({ "items.product": "Mouse" })

// Consulta por condición
db.products.find({ stock: { $gt: 10 } })

exit
```

> Igual que en PostgreSQL, los scripts de `/docker-entrypoint-initdb.d` solo se
> ejecutan cuando el directorio de datos está vacío: hace falta `docker compose down -v`
> para reinicializar la base desde cero.