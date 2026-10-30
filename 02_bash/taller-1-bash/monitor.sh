#!/bin/bash

echo "===== MONITOR DEL CONTENEDOR ====="
echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
echo "Fecha: $(date)"
echo "Directorio: $(pwd)"

echo "===== DISCO ====="
df -h

echo "===== PROCESOS ====="
echo "Procesos activos: $(ps aux | wc -l)"

echo "===== ADVERTENCIAS ====="
USO=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)

if [ "$USO" -gt 80 ]
then
    echo "ADVERTENCIA: la particion principal esta al $USO% de uso"
else
    echo "Uso de disco normal: $USO%"
fi

echo "===== FIN DEL REPORTE ====="
