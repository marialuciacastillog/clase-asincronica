# Taller 4 - Seguridad de red en EC2

Auditoría de los puertos abiertos en la instancia y análisis del security group siguiendo el
principio de mínimo privilegio.

Enunciado: [`workshop_4_security_ec2.md`](workshop_4_security_ec2.md)
Evidencias y respuestas: [`evidencias-4-aws04.pdf`](evidencias-4-aws04.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| Tabla de puertos | `evidencias-4-aws04.pdf` |
| Capturas de Security Group | `evidencias-4-aws04.pdf` (Parte 2) |
| Propuesta de configuración segura | `evidencias-4-aws04.pdf` |
| Respuestas de análisis | `evidencias-4-aws04.pdf` |
| Reto: Security Group para Flask detrás de Nginx | `evidencias-4-aws04.pdf` |

Este taller es de análisis sobre la instancia del taller 3, así que no tiene archivos de código.

## Configuración final del security group

| Puerto | Origen |
|---|---|
| 22 (SSH) | Solo mi IP |
| 80 (HTTP) | `0.0.0.0/0` |
| 5000 y 5432 | Sin regla (cerrados desde Internet) |
