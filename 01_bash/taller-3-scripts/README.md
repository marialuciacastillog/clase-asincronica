# Taller 3 - Bash: scripts

Scripts con variables, lectura de datos, condicionales, bucles, funciones y parámetros, hasta un
script de respaldo con `tar`.

Enunciado: [`workshop_3.md`](workshop_3.md)
Evidencias y respuestas: [`evidencias-3-bash01.pdf`](evidencias-3-bash01.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| Ejercicios 1 a 9 | [`saludo.sh`](saludo.sh), [`variables.sh`](variables.sh), [`entrada.sh`](entrada.sh), [`condicional.sh`](condicional.sh), [`for.sh`](for.sh), [`while.sh`](while.sh), [`funciones.sh`](funciones.sh), [`script.sh`](script.sh) |
| Ejercicio 10: proyecto integrador | [`proyecto.sh`](proyecto.sh) |
| Desafío final | [`backup.sh`](backup.sh) |
| Evidencias de ejecución | `evidencias-3-bash01.pdf` |
| Preguntas de reflexión | `evidencias-3-bash01.pdf` |

## Cómo ejecutar

```bash
chmod +x *.sh

./saludo.sh
./script.sh Juan Pérez
./proyecto.sh        # copia los .txt de la carpeta actual a una carpeta con la fecha
./backup.sh          # pide el nombre de una carpeta y la comprime en backup/
```
