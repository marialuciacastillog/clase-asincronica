# Taller 1 - Crear y conectar una instancia EC2

Creación de una instancia Ubuntu en Amazon EC2 desde la consola de AWS (Learner Lab) y conexión
remota por SSH con un par de claves.

Enunciado: [`workshop_1_build_ec2.md`](workshop_1_build_ec2.md)
Evidencias y respuestas: [`evidencias-1-aws04.pdf`](evidencias-1-aws04.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| Captura de la instancia en estado `running` | `evidencias-1-aws04.pdf` (Parte 3) |
| Captura de la conexión SSH | `evidencias-1-aws04.pdf` (Parte 4) |
| Tabla de componentes | `evidencias-1-aws04.pdf` (Parte 6) |
| Respuestas de análisis (Parte 1) | `evidencias-1-aws04.pdf` |
| Reto: de *Launch Instance* al acceso SSH | `evidencias-1-aws04.pdf` |

Este taller se hace en la consola de AWS, así que no tiene archivos de código: todo lo
entregable está en el documento de evidencias.

## Configuración de la instancia

| Elemento | Valor |
|---|---|
| Nombre | `curso-ec2-marialucia` |
| AMI | Ubuntu Server 26.04 LTS |
| Tipo de instancia | `t3.micro` (2 vCPU, ~1 GB de RAM) |
| Región / zona | `us-east-1` / `us-east-1d` |
| Par de claves | `curso-ec2-key` (RSA, `.pem`) |
| Security group | `launch-wizard-1`: SSH (TCP 22) solo desde mi IP (`/32`) |
| Almacenamiento | 8 GiB gp3 |

SSH se restringió a mi IP en lugar de `0.0.0.0/0`, siguiendo la indicación del enunciado de
permitir SSH "desde una fuente restringida". Si la IP de la red cambia, hay que actualizar la
regla del security group para poder volver a conectarse.

## Cómo conectarse

```bash
chmod 400 curso-ec2-key.pem
ssh -i curso-ec2-key.pem ubuntu@<IP_PUBLICA>
```

La IP pública cambia cada vez que la instancia se detiene y se vuelve a iniciar (por ejemplo,
al reiniciar el Learner Lab). La llave `.pem` no se incluye en el repositorio.
