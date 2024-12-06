#!/bin/bash
tput civis # Ocultar cursor

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

NC='\033[0m' # No colores


function ctrl_c() {
    echo -e "${RED}\n[!] Saliendo...${NC}"
    tput cnorm # Mostrar cursor
    echo -e "${RED}[!]${NC} Deteniendo contenedores..."
    docker-compose down
    exit 0
}


trap ctrl_c INT


function banner()
{
    
    echo -e "${CYAN}\n"       

    echo "██╗███╗   ██╗██╗ ██████╗██╗ █████╗ ███╗   ██╗██████╗  ██████╗     ███████╗███████╗██████╗ ██╗   ██╗██╗██████╗  ██████╗ ██████╗" 
    echo "██║████╗  ██║██║██╔════╝██║██╔══██╗████╗  ██║██╔══██╗██╔═══██╗    ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔══██╗██╔═══██╗██╔══██"
    echo "██║██╔██╗ ██║██║██║     ██║███████║██╔██╗ ██║██║  ██║██║   ██║    ███████╗█████╗  ██████╔╝██║   ██║██║██║  ██║██║   ██║██████╔╝"
    echo "██║██║╚██╗██║██║██║     ██║██╔══██║██║╚██╗██║██║  ██║██║   ██║    ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║  ██║██║   ██║██╔══██╗"
    echo "██║██║ ╚████║██║╚██████╗██║██║  ██║██║ ╚████║██████╔╝╚██████╔╝    ███████║███████╗██║  ██║ ╚████╔╝ ██║██████╔╝╚██████╔╝██║  ██║"
    echo "╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝     ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
    echo -e "\n\n                                                                                                                             " 

    echo -e "    ___         __                  _____   ____  _____ ____ "
    echo -e "   /   | __  __/ /_____  ____      /__  /  / __ \/ ___// __ \ "
    echo -e "  / /| |/ / / / __/ __ \/ __/  (_)   / /  / / / /\__ \/ / / /"
    echo -e " / ___ / /_/ / /_/ /_/ / /          / /__/ /_/ /___/ / /_/ / "
    echo -e "/_/  |_\__,_/\__/\____/_/  (_)     /____/\____//____/\____/  "
                                                             
    
    echo -e "${NC}" 
}


function main() 
{
    echo -e "${CYAN}\n[+]${NC} Iniciando contenedores..."
    echo -e "${GREEN}[+] Puedes usar 'Ctrl + C' para salir en cualquier momento y detener los contenedores.${NC}"
    sleep 6
    docker-compose up -d

    echo -e "${CYAN}\n[+]${NC} Attaching al contenedor del servidor de Minecraft..."
    # docker attach  pero ejecutamos un comando para obtener el nombre del contenedor
    docker attach $(sudo docker container list | grep minecraft | awk '{print $13}')
    
    # docker attach #nombre_del_contenedor
}


banner
sleep 2
main

tput cnorm
