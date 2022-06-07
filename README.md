# Backend Motel

El proyecto esta contruido en node Js, utiliza el ORM sequelize para el manejo y conexión con la base de datos, el cual se usa MySQL

## Configuración del archivo .evn

Al clonar el proyecto se tiene que crear un archivo .env en la raiz del proyecto el cual contendra las variables de entorno para la conexion a la base de datos. Esta contendra el nombre de la base de datos, usuario y contraseña para poder establecer la conexión con ella 

Ejemplo:  
DB_NAME=nombre_de_la_base_de_datos
DB_HOST=localhost  
DB_USER=root  
DB_PASS=su_contraseña

## Ejecución del proyecto en un entorno de desarrollo
Primero es importante instalar los packetes necesarios, para ello de ejecuta el comando:
- __npm i__ para instalar los packetes necesarios
Para correr el servidor se ejecuta el comando
- __npm start__ para correr el servidor de desarrollo
