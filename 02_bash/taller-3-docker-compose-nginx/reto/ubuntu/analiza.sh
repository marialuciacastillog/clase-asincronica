#!/bin/bash
ARCHIVO="/logs/registro.log"

if [ -f "$ARCHIVO" ]
then
    echo "Analizando $ARCHIVO"
    echo "Lineas totales: $(wc -l < $ARCHIVO)"
    echo "Registros realizados: $(grep -c 'Registro del' $ARCHIVO)"
    echo "Ultimo registro:"
    grep 'Registro del' $ARCHIVO | tail -1
else
    echo "No existe $ARCHIVO. Ejecute primero monitor.sh"
fi
