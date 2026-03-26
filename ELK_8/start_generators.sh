#!/bin/bash

# Script para lanzar los 3 generadores de logs
# Este script es la versión bash del archivo .bat original

# Directorio del proyecto
PROJECT_DIR="/home/jpastor/dev/jpastor/docker-compose/ELK_8"

# Cambiar al directorio del proyecto
cd "$PROJECT_DIR" || { echo "Error: No se pudo encontrar el directorio $PROJECT_DIR"; exit 1; }

# Verificar si el entorno virtual existe
if [ ! -d ".venv" ]; then
    echo "Error: No se encontró el entorno virtual (.venv)"
    exit 1
fi

# Activar el entorno virtual
source .venv/bin/activate

echo "Iniciando generadores de logs en segundo plano..."

# Ejecutar los scripts de Python en paralelo
python3 log_generator01.py &
PID1=$!
echo "Log Generator 01 iniciado (PID: $PID1)"

python3 log_generator02.py &
PID2=$!
echo "Log Generator 02 iniciado (PID: $PID2)"

python3 log_generator03.py &
PID3=$!
echo "Log Generator 03 iniciado (PID: $PID3)"

echo "--------------------------------------------------"
echo "Los generadores están corriendo. Usa Ctrl+C para detenerlos."
echo "--------------------------------------------------"

# Función para detener todos los procesos al salir
trap "echo 'Deteniendo generadores...'; kill $PID1 $PID2 $PID3; exit" SIGINT SIGTERM

# Mantener el script en ejecución para ver los logs
wait
