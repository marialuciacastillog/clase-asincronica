# Taller 2 - Administración de Linux en EC2

Administración remota de la instancia EC2 del taller 1 por SSH: exploración de recursos,
procesos, logs, servicios y creación de un script Bash.

Enunciado: [`workshop_2_linux_ssh.md`](workshop_2_linux_ssh.md)
Evidencias y respuestas: [`evidencias-2-aws04.pdf`](evidencias-2-aws04.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| Script `system_info.sh` | [`ec2-lab/scripts/system_info.sh`](ec2-lab/scripts/system_info.sh) |
| Evidencias de ejecución | `evidencias-2-aws04.pdf` |
| Resumen de los recursos observados | `evidencias-2-aws04.pdf` |
| Explicación de tres procesos encontrados | `evidencias-2-aws04.pdf` |
| Reto: `system_info.sh` con argumento | [`ec2-lab/scripts/system_info.sh`](ec2-lab/scripts/system_info.sh) + evidencias en el PDF |

## Estructura

La carpeta `ec2-lab/` reproduce la estructura de trabajo creada en la instancia en la Parte 2:

```
ec2-lab/
├── scripts/
│   └── system_info.sh
├── logs/
└── data/
    └── identificacion.txt
```

## Sobre `system_info.sh`

Esta carpeta contiene la versión final, la del reto: el script recibe una ruta como
argumento y muestra el filesystem donde se encuentra con `df -h "$RUTA"`, en lugar de mostrar
siempre `/`. Si no se pasa ninguna ruta, muestra un error con la forma de uso. La versión
original de la Parte 5 está documentada en el PDF de evidencias.

Al probarlo se ve la diferencia: `/var/log` está en `/dev/root` (el disco principal), mientras
que `/tmp` está en `tmpfs`, un filesystem que vive en la RAM.

## Cómo ejecutar

Dentro de la instancia EC2 (o cualquier Linux):

```bash
cd ec2-lab/scripts
chmod +x system_info.sh

./system_info.sh /var/log
./system_info.sh /tmp
./system_info.sh          # sin argumento: muestra el error y la forma de uso
```
