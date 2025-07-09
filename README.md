# Minecraft Server

¡Hola! Este repositorio es una documentación/tutorial para crear un servidor de Minecraft utilizando Docker y playit.gg.

- **Docker** nos permite crear un contenedor con el servidor de Minecraft.
- **Playit.gg** facilita exponer nuestro servidor a internet sin necesidad de abrir puertos en el router, ya que se crea un túnel TCP entre nuestro servidor y los servidores de Playit.gg.

## ¿Qué necesitas?

- Docker y Docker Compose
- Cuenta en [playit.gg](https://playit.gg)
- Archivos del servidor de Minecraft
- Conocimientos básicos de Docker
- Conocimientos básicos de Minecraft
- Conocimientos básicos de Linux (opcional)
- Un launcher de Minecraft :D

## Inicio rápido

1. Clona este repositorio:

   ```bash
   git clone https://github.com/n1krov/minecraft-server.git
   cd minecraft-server
   ```

2. Modifica los archivos de configuración si es necesario (por ejemplo, variables de entorno o configuración de playit.gg).

3. Levanta los servicios con Docker Compose:

   ```bash
   docker-compose up -d
   ```

4. ¡Listo! El servidor de Minecraft estará corriendo y accesible mediante el túnel de playit.gg.

## Más información

Para detalles sobre la configuración, personalización y solución de problemas, revisa la documentación incluida en este repositorio.
