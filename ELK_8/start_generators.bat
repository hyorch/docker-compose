@echo off
REM Script para lanzar los 3 generadores de logs usando WSL y cargando el entorno virtual

start "Log Generator 1" wsl -d Ubuntu-24.04 -e bash -c "cd /home/jpastor/dev/jpastor/docker-compose/ELK_8 && source .venv/bin/activate && python3 log_generator01.py; exec bash"
start "Log Generator 2" wsl -d Ubuntu-24.04 -e bash -c "cd /home/jpastor/dev/jpastor/docker-compose/ELK_8 && source .venv/bin/activate && python3 log_generator02.py; exec bash"
start "Log Generator 3" wsl -d Ubuntu-24.04 -e bash -c "cd /home/jpastor/dev/jpastor/docker-compose/ELK_8 && source .venv/bin/activate && python3 log_generator03.py; exec bash"

echo Generadores iniciados en ventanas separadas.
pause
