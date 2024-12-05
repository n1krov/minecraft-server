
# Docker

Para instalar docker en tu sistema operativo, puedes seguir la documentacion oficial de Docker: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

## Imagen de Minecraft

Puedes ir a docker hub y buscar una imagen de Minecraft, por ejemplo: [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server)

> Nota: si estas interesado en minecraft bedrock, puedes buscar la imagen `itzg/minecraft-bedrock-server` o algo similar

Esta imagen de itzg es muy popular y tiene muchas opciones de configuracion, puedes ver la documentacion para instalarla en tu servidor.

## Usando docker compose

1. Crea un nuevo directorio para tu servidor de minecraft-server
2. Crea un archivo `docker-compose.yml` con el siguiente contenido:

```yaml
version: '3.3'

services:
  mc-server:
    image: itzg/minecraft-server
    tty: true
    stdin_open: true
    ports:
      - "25565:25565"
    environment:
      EULA: "TRUE"
    volumes:
      - ./data:/data
```

`mc-server` es el nombre del servicio, puedes cambiarlo a lo que quieras.
`itzg/minecraft-server` es la imagen de minecraft que vamos a utilizar.
`tty` y `stdin_open` son para mantener el contenedor abierto.
`ports` es para exponer el puerto 25565 del contenedor al puerto 25565 del host. Como ven tiene 25565:25565, el primer numero es el puerto del host y el segundo es el puerto del contenedor.
El segundo puerto es el puerto por defecto de minecraft, por lo que debemos dejarlo asi. El de la izquierda es el puerto del host, puedes cambiarlo si quieres.
Pero como no vamos a abrir puertos esto es opcional.
`environment` es para aceptar el EULA de minecraft.
`volumes` es para montar un volumen en el contenedor.


- Por lo que el archivo de configuracion yaml se veria asi:

```yaml
version: "3.8"

services:
  minecraft-server:
    image: itzg/minecraft-server
    tty: true
    stdin_open: true
    environment:
      EULA: "TRUE"
      MEMORY: "4G"
      TYPE: "FABRIC"
      VERSION: "1.20.1"
      MOTD: "Bienvenido a mi servidor de Minecraft"
      DIFFICULTY: "hard"
      ICON: "https://example.com/icon.png"
      MAX_PLAYERS: "20"
      ONLINE_MODE: "false
    volumes:
      - ./data:/data
```
Nota que `MEMORY: "4G"` es para asignarle 4GB de memoria al servidor de minecraft.
Para especificar el tipo de servidor se utiliza `TYPE`
`VERSION` es para especificar la version del servidor de minecraft.
`MOTD` es para especificar el mensaje que se muestra en la lista de servidores de minecraft.
`DIFFICULTY` es para especificar la dificultad del servidor.
`ICON` es para especificar el icono del servidor. Copia la direccion de imagen y pegalo en el campo.
`MAX_PLAYERS` es para especificar el numero maximo de jugadores en el servidor.
`ONLINE_MODE` es para especificar si el servidor esta en modo online o no. (Si sos no premium dejalo en false)

> Nota: Puedes ver todas las opciones de configuracion en la documentacion de la imagen de itzg.


3. Creamos la carpeta `data` en el mismo directorio donde esta el archivo `docker-compose.yml`

- Ahi se guardara la configuracion del servidor de minecraft. Estara el archivo `server.properties` y la carpeta `world` con el mundo del servidor.


4. Ejecutamos el comando `docker-compose up -d` para crear el contenedor.

- Como estoy en Linux dejo en el repositorio un script para inicializarlo en segundo plano, para attachearlo y poder detenerlo.
- Si despues vere si tengo ganas de escirbir un equivalente en .bat para Windows.


## Probamos el servidor

- Ejecuta el comando `docker-compose up -d` para crear el contenedor.

- Puedes ver los contenedores con el comando `docker ps` o `docker container list`
- Vas a necesitar el campo NAMES para poder attachear el contenedor.

- Para ver el servidor desde la consola ejecuta `docker attach {NAMES}`

Espera a que el servidor termine de cargar el mundo y puedes tirar un `help` desde la consola para ver los comandos disponibles. Si te devuelve los comandos GENIAL! Lograste levantar el servidor de Minecraft.

## Explicacion del directorio `data`

La carpeta `data` es donde se guardara la configuracion del servidor de minecraft. Dentro de esta carpeta se guardara el archivo `server.properties` y la carpeta `world` con el mundo del servidor.
