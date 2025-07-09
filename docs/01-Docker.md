# 🐳 Servidor de Minecraft con Docker

Aqui dejo como levantar el servidor de minecraft con Docker.

---

## 1. Instalación de Docker

Sigue la documentación oficial para instalar Docker en tu sistema operativo:

🔗 [Guía oficial de instalación de Docker](https://docs.docker.com/get-docker/)


## 2. Elige una Imagen de Minecraft

Ve a Docker Hub y busca una imagen de Minecraft. Recomendamos:

- Java: [`itzg/minecraft-server`](https://hub.docker.com/r/itzg/minecraft-server)
- Bedrock: [`itzg/minecraft-bedrock-server`](https://hub.docker.com/r/itzg/minecraft-bedrock-server) (si prefieres la edición Bedrock)

La imagen de itzg es muy popular y configurable. Consulta su documentación para más detalles.



## 3. Usando Docker Compose

1. Crea un nuevo directorio para tu servidor de Minecraft.
2. Dentro de ese directorio, crea un archivo llamado `docker-compose.yml` con el siguiente contenido de ejemplo:

```yaml
services:
  minecraft-server:
    image: itzg/minecraft-server
    tty: true
    stdin_open: true
    ports:
      - "25565:25565"
    environment:
      EULA: "TRUE"
      MEMORY: "4G"
      TYPE: "FABRIC"
      VERSION: "1.20.1"
      MOTD: "Bienvenido a mi servidor de Minecraft"
      DIFFICULTY: "hard"
      # ICON: "https://example.com/icon.png"
      MAX_PLAYERS: "20"
      ONLINE_MODE: "false" # Si no eres premium déjalo en false
    volumes:
      - ./data:/data
```


>[!NOTE]
> - `minecraft-server` es el nombre del servicio, puedes cambiarlo a lo que quieras.
> - `itzg/minecraft-server` es la imagen de minecraft que vamos a utilizar.
> - `tty` y `stdin_open` son para mantener el contenedor abierto.
> - `ports` es para exponer el puerto 25565 del contenedor al puerto 25565 del host. Como ven tiene 25565:25565, el primer numero es el puerto del host y el segundo es el puerto del contenedor.
> - El segundo puerto es el puerto por defecto de minecraft, por lo que debemos dejarlo asi. El de la izquierda es el puerto del host, puedes cambiarlo si quieres.
> - Pero como no vamos a abrir puertos esto es opcional.
> - `environment` es para aceptar el EULA de minecraft.
> - `volumes`  Sincroniza la carpeta `data` para guardar el mundo y la configuración.
> 
> - `MEMORY: "4G"` es para asignarle 4GB de memoria al servidor de minecraft. 
> - Para especificar el tipo de servidor se utiliza `TYPE`
> - `VERSION` es para especificar la version del servidor de minecraft.
> - `MOTD` es para especificar el mensaje que se muestra en la lista de servidores de minecraft.
> - `DIFFICULTY` es para especificar la dificultad del servidor.
> - `ICON` es para especificar el icono del servidor. Copia la direccion de imagen y pegalo en el campo.
> - `MAX_PLAYERS` es para especificar el numero maximo de jugadores en el servidor.
> - `ONLINE_MODE` es para especificar si el servidor esta en modo online o no. (Si sos no premium dejalo en false)


📖 Puedes ver todas las variables y opciones en la [documentación de itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server).


## 4. Iniciar el Servidor

En la terminal, ejecuta:

```sh
docker-compose up -d
```

Esto creará y levantará el servidor en segundo plano.

- Se creará automáticamente la carpeta `data` donde se guardará la configuración y el mundo.
- Puedes ver los contenedores activos con:
  ```sh
  docker ps
  ```

## 5. Administrar el Servidor

- **Ver la consola del servidor:**
  ```sh
  docker attach minecraft-server
  ```
  (Reemplaza `minecraft-server` por el nombre real del contenedor si lo cambiaste.)

- **Salir de la consola**: Usa `Ctrl + p` y luego `Ctrl + q` para salir sin detener el servidor.

- **Detener el servidor:**
  ```sh
  docker-compose down
  ```


## 6. Scripts Útiles

- **Linux:** Usa el script `init.sh` para inicializar el servidor.
  ```sh
  bash init.sh
  ```
- **Windows:** Usa el script `START_SERVER.bat`.


## 7. ¿Y ahora?

Cuando veas que el servidor terminó de cargar, puedes usar el comando `help` en la consola para ver todos los comandos disponibles.

¡Listo! Ya tienes tu servidor de Minecraft funcionando con Docker.

## 📂 ¿Para qué sirve la carpeta `data`?

Aquí se guardan todos los archivos importantes del servidor:

- `server.properties`: Configuración principal del servidor.
- Carpeta `world`: El mundo de Minecraft.

---

¿Dudas, sugerencias o quieres compartir tu experiencia? ¡Edita este archivo o abre un Issue!
