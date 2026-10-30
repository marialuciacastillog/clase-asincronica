# Taller 5 - Automatización con User Data

Comparación entre configurar una EC2 a mano y hacerlo automáticamente con un script de User Data al
lanzarla.

Enunciado: [`workshop_5_userdata.md`](workshop_5_userdata.md)
Evidencias y respuestas: [`evidencias-5-aws04.pdf`](evidencias-5-aws04.pdf)

## Índice de entregables

| Entregable solicitado | Dónde está |
|---|---|
| Script User Data | [`user-data-nginx.sh`](user-data-nginx.sh) |
| Captura del servidor funcionando | `evidencias-5-aws04.pdf` |
| Comparación manual vs automatización | `evidencias-5-aws04.pdf` |
| Tareas que convendría automatizar | `evidencias-5-aws04.pdf` |
| Reto: Docker y un contenedor desde User Data | [`user-data-docker.sh`](user-data-docker.sh) + evidencias en el PDF |

## Scripts

- `user-data-nginx.sh`: el del enunciado. Instala Nginx y reemplaza la página de inicio.
- `user-data-docker.sh`: el del reto. Instala Docker y deja corriendo un contenedor `nginx:alpine` con
  una página propia y `--restart always`.

## Cómo usarlos

Al lanzar una instancia Ubuntu: **Detalles avanzados → Datos de usuario**, pegar el script y lanzar.
Después de 2 a 4 minutos, la página se ve en `http://<IP_PUBLICA>` (el security group debe permitir el
puerto 80). No llevan `sudo` porque User Data se ejecuta como root.
