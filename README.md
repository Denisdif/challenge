# Despliegue

## Tegnologías 

Para el desarrollo de este challenge se utilizaron las siguientes tecnologías:

* Php 7.4.19
* Apache 2.4.47
* MySql 5.7.33
* Node 14
* Laravel 8.81.0
* Bootstrap 5.1

Recomiendo instalar [Laragon](https://laragon.org/) (v5.0.0), que precisamente fue la herramienta utilizada para este desarollo. La guía de instalación se puede encontrar en el sitio web oficial, al cual podrá acceder presionando sobre el enlace.
## Administrador de dependencias

Recomiendo la instalación de un administrador de dependencias para facilitar la instalación de las mismas y no tener que hacerlo de forma manual. Para este desarrollo se utilizó [Composer](https://getcomposer.org/) (v2.2.5). Nuevamente la guía de instalación se puede encontrar en el sitio web oficial, l cual podrá acceder presionando sobre el enlace.

## Descarga del repositorio

El siguiente paso será descargar el [Repositorio](https://github.com/Denisdif/challenge), en el cual podremos encontrar el código fuente del challenge y un Script Sql para la base de datos.

## Dependencias

Una vez descargado el repositorio, podemos utilizar nuestra terminal favorita para posicionarnos en el directorio del proyecto. Una vez allí, debemos ejecutar el comando:
```
$ composer install
```
También recomiendo utilizar estos comandos de node:
```
$ npm install
```
```
$ npm run dev
```

## Base de datos

Para generar la base de datos del challenge, simplemente debemos ejecutar el Script Sql ```challenge.sql``` desde una terminal o con nuestro gestor de base de datos favorito, en este caso recomiendo hacerlo con [Workbench](https://www.mysql.com/products/workbench/).

## .Env

Una vez generada nuestra base de datos, ya estamos listos para configurar nuestro archivo .Env.
Recomiendo duplicar el archivo ```.envexample``` del repositorio y cambiarle el nombre a ```".env"```. Una vez realizado, procederemos a modificarlo:
* DB_CONNECTION = ```motor de base de datos a utilizar, en este caso utilicé "mysql"```
* DB_HOST = ```El host donde vamos a desplegar (127.0.0.1)```
* DB_PORT = ```El puerto donde vamos a desplegar (3306)```
* DB_DATABASE = ```Nombre de nuestra base de datos```
* DB_USERNAME = ```Nombre de usuario mysql```
* DB_PASSWORD = ```Contraseña de usuario mysql```

## Key generate

Para desplegar nuestra aplcación, primero debemos generar una key a través del comando:

```
$ php artisan key:generate
```

## Datos de prueba

Para cargar datos de prueba para poder utilizar el sistema, se deben ejecutar los Factories de los distintos modelos. Para ello, utilizamos el comando:

```
$ php artisan db:seed  
```

## Serve

Para ejecutar el challenge debemos levantar nuestro servidor con Laragon o la herramienta que se esté utilizando y ejecutar el comando

```
$ php artisan serve  
```
Se podrá acceder al sistema con cualquier usuario generado por los factories ingresando el correo ```(generado aleatoriamente)``` y la contraseña ```12345678```.
