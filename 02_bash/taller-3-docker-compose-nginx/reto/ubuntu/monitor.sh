#!/bin/bash
FECHA=$(date '+%Y-%m-%d %H:%M:%S')

echo "===== Registro del $FECHA =====" >> /logs/registro.log
echo "Usuario: $(whoami)" >> /logs/registro.log
echo "Contenedor: $(hostname)" >> /logs/registro.log
echo "Archivos en /logs: $(ls /logs | wc -l)" >> /logs/registro.log
echo "" >> /logs/registro.log

echo "Registro guardado en /logs/registro.log"
