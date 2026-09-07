# Taller 2 - Construcción de imágenes con Dockerfile

Imagen propia a partir de Ubuntu, y comparación experimental entre `CMD` y `ENTRYPOINT`.

Enunciado: [`workshop_2.md`](workshop_2.md)
Evidencias y respuestas: [`evidencias-2-bash02.pdf`](evidencias-2-bash02.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `Dockerfile` funcional | [`Dockerfile`](Dockerfile) |
| Imagen `ubuntu-bash-lab` | `evidencias-2-bash02.pdf` — sección "Imagen ubuntu-bash-lab" |
| Tres ejemplos de `CMD`/`ENTRYPOINT` | [`caso-a/Dockerfile`](caso-a/Dockerfile), [`caso-b/Dockerfile`](caso-b/Dockerfile), [`caso-c/Dockerfile`](caso-c/Dockerfile) |
| Tabla o conclusión escrita con las diferencias observadas | `evidencias-2-bash02.pdf` — sección "Conclusiones" |
| Evidencia de construcción y ejecución | `evidencias-2-bash02.pdf` |
| Respuestas de análisis | `evidencias-2-bash02.pdf` |

## Archivos adicionales

| Archivo | Por qué está |
|---|---|
| [`saluuudis.sh`](saluuudis.sh) | Script Bash incorporado a la imagen mediante `COPY . /app`, para demostrar el objetivo "incorporar scripts Bash dentro de una imagen" |

## Estructura

El `Dockerfile` principal y `saluuudis.sh` están en la raíz de esta carpeta porque
la instrucción `COPY . /app` copia el contenido del directorio de construcción.
Cada caso de `CMD`/`ENTRYPOINT` vive en su propia carpeta, con su propio contexto.

## Cómo ejecutar

Imagen principal:

```bash
docker build -t ubuntu-bash-lab .
docker run -it --name ubuntu-lab ubuntu-bash-lab
```

Dentro del contenedor:

```bash
cd /app
ls -la
./saluuudis.sh
```

Los tres casos, cada uno desde su carpeta:

```bash
docker build -t ejemplo-cmd ./caso-a
docker run --rm ejemplo-cmd
docker run --rm ejemplo-cmd "Mensaje reemplazado"

docker build -t ejemplo-entrypoint ./caso-b
docker run --rm ejemplo-entrypoint "Hola"

docker build -t ejemplo-combinado ./caso-c
docker run --rm ejemplo-combinado
docker run --rm ejemplo-combinado "Mensaje personalizado"
```