#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Error: no se proporciono ninguna ruta"
    echo "Uso: ./system_info.sh <ruta>"
    exit 1
fi

RUTA="$1"

echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
echo "Fecha: $(date)"
echo "Uptime:"
uptime

echo "Ruta analizada: $RUTA"
echo "Disco:"
df -h "$RUTA"

echo "Memoria:"
free -h
