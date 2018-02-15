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

Arrancar el servidor con su puerto por defecto(8080):

    $ lapis server

Arrancar el servidor con las configuraciones de 'config.lua':

    $ lapis server dev1

---

Fuentes:

+ https://github.com/pepeul1191/tutoriales/blob/master/Lua.md
+ http://openresty.org/en/linux-packages.html
+ http://leafo.net/lapis/reference/lua_getting_started.html
+ http://fperrad.github.io/lua-Spore/
