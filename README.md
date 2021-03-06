# Lua Lapis Front Animales

Instalación de dependencias:

    $ sudo apt-get install lua5.1 luarocks nginx
    $ wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
    $ sudo apt-get -y install software-properties-common
    $ sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
    $ sudo apt-get update
    $ sudo apt-get install openresty

Instalar Lapis (framework):

    $ sudo luarocks install lapis

Instalar inspect (dump de variables):

    $ sudo luarocks install inspect

Instalar cliente REST:

    $ sudo luarocks install lua-spore

Instalar JSON:

    $ sudo luarocks install lua-cjson

Instalar FTP:

    $ sudo luarocks install luasocket inspect

Arrancar el servidor con su puerto por defecto(8080):

    $ lapis server

Arrancar el servidor con las configuraciones de 'config.lua':

    $ lapis server dev1

### Fuentes externas de vistas HTML:

+ Home : https://bootsnipp.com/snippets/1BQNV
+ Login form : https://bootsnipp.com/snippets/featured/modal-login-with-jquery-effects
+ Contacto : https://bootsnipp.com/snippets/zD4p9
+ Footer : https://bootsnipp.com/snippets/GQmaP
+ Error404 : https://bootsnipp.com/snippets/OeKdM
+ Registro : https://bootsnipp.com/snippets/8ANqZ

### TODO

+ Validación del formulario de registro valida como correo no registrado en la base de datos si al final del correo se añade un espacio
+ El menú del sitio debe ser un backboneView con su propio model
+ Cuando se usa la validación de campos en forms del login el contenedor del todo el login no se expande con el contenido
+ Hacer que el login se comunique con el servidor mediante AJAX
+ Hacer el error 404 pero con backbone en las rutas marionette de la aplicación

## Ignorar carpetas y archivos no necesarios:

Atom : Ingnorar los siguientes archivos, como también dar check en tree package para que no se muestren esos archivos:

    logs, fastcgi_temp, proxy_temp, uwsgi_temp, nginx.conf.compiled

Sublime Text:

    "file_exclude_patterns":
    [
        ...,
        "nginx.conf.compiled"
    ],
    "folder_exclude_patterns":
    [
        ...,
        "scgi_temp", "client_body_temp", "logs", "fastcgi_temp", "proxy_temp", "uwsgi_temp"
    ],

---

Fuentes:

+ https://github.com/pepeul1191/tutoriales/blob/master/Lua.md
+ http://openresty.org/en/linux-packages.html
+ http://leafo.net/lapis/reference/lua_getting_started.html
+ http://fperrad.github.io/lua-Spore/
+ http://lua-users.org/lists/lua-l/2008-07/msg00206.html
+ http://marc.info/?l=lua-l&m=131947263308232
+ http://w3.impa.br/~diego/software/luasocket/ltn12.html
+ https://stackoverflow.com/questions/24908199/convert-json-string-to-lua-table
+ http://fperrad.github.io/lua-Spore/
+ http://fperrad.github.io/lua-Spore/spore/
+ https://github.com/pepeul1191/lua-spore-demo
+ http://www.ulima.edu.pe/pregrado/ingenieria-industrial/agenda/miercoles-de-ingenieria-biopolimero-partir-del-almidon-de-papa
+ http://fresno.ulima.edu.pe/go.nsf/EventosING?openform&origen=ulima&medio=web&evento=BIOPOLI-20170426
+ https://www.tutorialspoint.com/lua/lua_file_io.htm
+ https://gist.github.com/reinholdsson/d142bab5c2bbc22c5d56
+ https://ferryzhou.wordpress.com/2015/04/15/lua-split-by-dot/
+ https://gist.github.com/kardolus/68e56a77c5dc6c089153
+ http://www.luatex.org/svn/trunk/source/texk/web2c/luatexdir/luasocket/doc/ftp.html
