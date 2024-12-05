# Playit.gg

Para configurar el playit.gg creamos en la carpeta `data` un directorio nuevo llamado `mods` o `plugins` y ahi colocamos los mods o plugins que queremos instalar en el servidor.
En este caso como estoy en una version de Fabric, voy a armar una carpeta llamada `mods` y ahi voy a colocar los mods que quiero instalar.
Si estas en una version que no lleva plugins, descarga el ejecutable de playit.gg.

- [Linux](https://playit.gg/download/linux)
- [Windows](https://playit.gg/download/windows)

Luego ejecuta 

```bash
docker-compose up -d
```

Para detener el servidor ejecuta

```bash
docker-compose down
```

### Probemos la conexion

Si estas en local, abrir el launcher de preferencia y agregar un nuevo servidor con la ip `localhost` y el puerto `25565`.


## Servidor con plugins
- Si instalaste en una version de plugins. Cuando arranques el servidor, el plugin de playit.gg va a ejecutarse.

## Servidor con mods
- Si instalaste en una version de mods. Cuando arranques el servidor paralelamente debes ejecutar el programa de playit.


El playit te va a pedir que setees el secret key. haz clikck en la consola para ir al link de la pagina y te creas una cuenta y configuras el tunel.

Sigue los pasos para crear el tunel, y luego le das a *view tunnel* y te va a dar una ip.

Esa ip es la que debes copiar y compartirlo para conectarte a tu servidor por fuera de tu red local.

En otras palabras para conectarte a tu servidor utiliza la IP que te da playit.


# Conexion

En el launcher de minecraft, agrega un nuevo servidor con la ip que te dio playit y listo. Ya puedes jugar con tus amigos.

