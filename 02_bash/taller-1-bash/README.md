# Taller 1 - Bash

Análisis de logs con comandos encadenados, y creación de scripts `.sh` con y sin argumentos.

Enunciado: [`workshop_1.md`](workshop_1.md)
Evidencias y respuestas: [`evidencias-1-bash02.pdf`](evidencias-1-bash02.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| `access.log` | [`access.log`](access.log) |
| `reporte.txt` | [`reporte.txt`](reporte.txt) |
| `saludo.sh` | [`saludo.sh`](saludo.sh) |
| `monitor.sh` | [`monitor.sh`](monitor.sh) |
| `analiza.sh` | [`analiza.sh`](analiza.sh) |
| Evidencia de ejecución de cada actividad | `evidencias-1-bash02.pdf` |
| Respuestas de la Parte 2 | `evidencias-1-bash02.pdf` |

## Archivos adicionales

| Archivo | Por qué está |
|---|---|
| [`sospechoso.sh`](sospechoso.sh) | Desafío de la Parte 1: detecta si un mismo usuario acumula dos o más eventos `ERROR` |
| [`otro.log`](otro.log) | Segundo archivo de prueba, usado en la extensión avanzada de la Parte 4 (`analiza.sh` con múltiples archivos) |

## Cómo ejecutar

Todos los archivos están en el mismo directorio, tal como se trabajaron.

```bash
chmod +x saludo.sh monitor.sh analiza.sh sospechoso.sh

./saludo.sh
./monitor.sh
./analiza.sh access.log
./analiza.sh access.log otro.log
./sospechoso.sh
```

Casos de validación de `analiza.sh`:

```bash
./analiza.sh                 # sin argumentos: muestra el modo de uso
./analiza.sh no_existe.log   # archivo inexistente: informa el error
```