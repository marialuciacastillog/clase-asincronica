#!/bin/bash

fecha=$(date +%Y-%m-%d)

mkdir -p "$fecha"

cantidad=0

for archivo in *.txt
do
    cp "$archivo" "$fecha"
    if [ $? -eq 0 ]
    then
        cantidad=$((cantidad+1))
    fi
done

echo "Se copiaron $cantidad archivos .txt" > "$fecha/reporte.log"

if [ $cantidad -gt 0 ]
then
    echo "Éxito: se copiaron $cantidad de archivos"
else
    echo "Error: no se copió ningún archivo"
fi
