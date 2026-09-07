#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Error: no se proporciono ningun archivo"
    echo "Uso: ./analiza.sh <archivo1> <archivo2> ..."
    exit 1
fi

for ARCHIVO in "$@"
do
    if [ -f "$ARCHIVO" ]
    then
        echo "===== ANALISIS DE $ARCHIVO ====="
        echo "Lineas: $(wc -l < "$ARCHIVO")"
        echo "Palabras: $(wc -w < "$ARCHIVO")"
        echo "Caracteres: $(wc -c < "$ARCHIVO")"
        echo "Lineas con ERROR: $(grep -c 'ERROR' "$ARCHIVO")"
        echo "Lineas con WARN: $(grep -c 'WARN' "$ARCHIVO")"
        echo ""
    else
        echo "Error: el archivo '$ARCHIVO' no existe"
        echo ""
    fi
done
