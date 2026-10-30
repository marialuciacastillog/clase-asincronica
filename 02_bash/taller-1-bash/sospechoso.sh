#!/bin/bash

USUARIO=$(grep 'ERROR' access.log | awk '{for(i=1;i<=NF;i++) if($i ~ /^user=/) print $i}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')

CANTIDAD=$(grep 'ERROR' access.log | awk '{for(i=1;i<=NF;i++) if($i ~ /^user=/) print $i}' | sort | uniq -c | sort -nr | head -1 | awk '{print $1}')

if [ "$CANTIDAD" -ge 2 ]
then
    echo "SOSPECHOSO: $USUARIO con $CANTIDAD errores"
else
    echo "No se detectaron usuarios sospechosos"
fi
