@echo off
echo SERVIDOR DE MINECRAFT
echo.
echo Hecho por
echo.
echo amatsu1mikaboshi
echo Z0SO
echo.

:ctrl_c
echo [!] Saliendo...
echo [!] Deteniendo contenedores...
docker compose down
exit /B

REM Verificar servicio de Docker
echo [!] Verificando servicio de Docker...
timeout /T 2

for /f "tokens=*" %%i in ('docker info ^| find /i "Server Version"') do (
    set docker_status=%%i
)

if defined docker_status (
    echo [+] Docker está corriendo.
) else (
    echo [!] Docker no está corriendo. Por favor, inicie Docker manualmente.
    exit /B
)

:main
echo [+] Iniciando contenedores...
echo [+] Puedes usar 'Ctrl + C' para salir en cualquier momento y detener los contenedores.
timeout /T 6
docker compose up -d && docker attach servidor-servidor-1

goto :eof

REM Para capturar CTRL+C
trap exit /B ctrl_c