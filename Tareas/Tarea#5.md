## Tarea #5
### Universidad de Ciencias Físico Matemáticas
#### Maestría en Ciencia de Datos - Bases de Datos Relacionales


### <span style="color: orange;">Dificultades de importación</span><P>

Al importar las distintas tablas almacenadas en archivos .tsv, no tuve problema con las tablas que tenían una cantidad de columnas pequeña (2-3 columnas). En cambio, cuando las tablas eran mayores, me aparece el error de "Java heap space" en DBeaver. Investigando el significado encontré que DBeaver (que es una aplicación escrita en Java) se quedó sin memoria RAM disponible para completar la tarea que solicité. Esto sucede porque mi base de datos es muy extensa (50,000,000 de datos) y la memoria RAM dada por deafult para DBeaver es insuficiente.

La solución a esto es aumentar el límite de memoria RAM que Java le permite usar a DBeaver editando el archivo dbeaver.ini y modificando el parámetro -Xmx.

Decidí no realizar este cambio y utilizar una base de datos más pequeña para principiantes llamada [sakila](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).


