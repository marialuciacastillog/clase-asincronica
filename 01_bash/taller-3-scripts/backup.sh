#!/bin/bash

read -p "Ingrese el nombre del directorio: " directorio

if [ -d "$directorio" ]
then
    echo "El directorio existe"

    mkdir -p backup
    fecha=$(date +%Y-%m-%d)
    tar -czf backup/respaldo_$fecha.tar.gz "$directorio"

    if [ $? -eq 0 ]
    then
        estado="Existoso"
    else
        estado="Fallido"
    fi

    cantidad=$(find "$directorio" -type f | wc -l)
    tamano=$(du -h backup/respaldo_$fecha.tar.gz | cut -f1)

    echo "$(date): Directorio='$directorio' | Archivos=$cantidad | Tamaño=$tamano | Estado=$estado" >> backup/backup.log

    echo "-------- RESUMEN ---------"
    echo "Fecha: $fecha"
    echo "Cantidad de archivos respaldados: $cantidad"
    echo "Tamaño del respaldo: $tamano"
    echo "Estado del proceso: $estado"
else
    echo "El directorio no existe"
fi
