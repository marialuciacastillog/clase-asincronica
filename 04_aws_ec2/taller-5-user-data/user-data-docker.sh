#!/bin/bash

apt update

# Instalar Docker con el script oficial
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sh /tmp/get-docker.sh

systemctl enable docker
systemctl start docker

# Pagina que va a mostrar el contenedor
mkdir -p /opt/web
cat > /opt/web/index.html <<'EOFHTML'
<h1>Contenedor desplegado con User Data</h1>
<p>EC2 + User Data + Docker</p>
EOFHTML

# Contenedor Nginx que se reinicia solo si la instancia se reinicia
docker run -d --name web --restart always -p 80:80 \
  -v /opt/web:/usr/share/nginx/html:ro nginx:alpine
