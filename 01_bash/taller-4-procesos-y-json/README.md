# Taller 4 - Bash: funciones, procesos y logs JSON

Funciones en Bash, pipes, análisis de procesos (`htop`, `ps`, `awk`, `kill`) y filtrado de logs en
formato JSON con `jq`.

Enunciado: [`workshop_4.md`](workshop_4.md)
Evidencias y respuestas: [`evidencias-4-bash01.pdf`](evidencias-4-bash01.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| Parte 1: función `presentarse` | [`presentarse.sh`](presentarse.sh) |
| Parte 2: explicación de los pipes | `evidencias-4-bash01.pdf` |
| Parte 3: tabla de comandos | `evidencias-4-bash01.pdf` |
| Parte 4: proceso consumiendo recursos | `evidencias-4-bash01.pdf` |
| Parte 5: análisis de logs | [`logs.json`](logs.json) + evidencias en el PDF |
| Reto integrador: informe | `evidencias-4-bash01.pdf` |
| Preguntas de reflexión | `evidencias-4-bash01.pdf` |

## Cómo ejecutar

```bash
chmod +x presentarse.sh
./presentarse.sh

jq 'select(.status==500)' logs.json
jq -r 'select(.status==500) | .service' logs.json | sort | uniq -c | sort -nr
```

La Parte 4 se hizo en una máquina Linux (con `htop` y procesos del sistema), por eso solo está en
las evidencias.
