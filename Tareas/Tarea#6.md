## Tarea #6
### Universidad de Ciencias Físico Matemáticas
#### Maestría en Ciencia de Datos - Bases de Datos Relacionales


## <span style="color: Orange;">Funciones de agregación</span><P>

### <span style="color: Yellow;">1. Conteo de frecuencias o media</span><P>

**Conteo de cantidad de clientes de cada tienda.**

SELECT store_id , COUNT(customer_id) AS num_customers<P>
FROM customer<P>
GROUP BY store_id;

![resultado1](image.png)

**Suma de cuánto ha gastado cada cliente ordenado de mayor a menor**

SELECT customer_id, SUM(amount) AS total_paid<P>
FROM payment<P>
GROUP BY customer_id<P>
ORDER BY total_paid DESC;

![resultado2](image-1.png)


**Promedio del rate de venta de cada película**

SELECT AVG(rental_rate) AS average_rental_rate<P>
FROM film;

![resultado3](image-2.png)

### <span style="color: Yellow;">2. Mínimos y máximos</span><P>

**Película con duración más corta**

SELECT MIN(length) AS shortest_film_length<P>
FROM film;

![resultado4](image-3.png)

**Película con rate de renta más alto**

SELECT MAX(rental_rate) AS highest_rental_rate<P>
FROM film;

![resultado5](image-4.png)

### <span style="color: Yellow;">Cuantil</span><P>

**Cuartil #1 - el 25% de los pagos son menores a el siguiente número:**

SELECT (SELECT amount<P>
     FROM (SELECT amount,<P>
             ROW_NUMBER() OVER (ORDER BY amount) AS rn,<P>
             COUNT(*) OVER () AS total_rows<P>
         FROM payment) AS sub<P>
     WHERE rn = CEIL(0.25 * total_rows)) AS cuartil_inferior;<P>

![resultado6](image-5.png)

### <span style="color: Yellow;">Moda</span><P>

**Moda del monto pagado**

SELECT amount AS moda_del_monto,<P>
    COUNT(amount) AS frecuencia<P>
FROM payment<P>
GROUP BY amount<P>
HAVING COUNT(amount) = (SELECT MAX(conteo_monto)<P>
        FROM (SELECT COUNT(amount) AS conteo_monto<P>
            FROM payment<P>
            GROUP BY amount) AS frecuencias_por_monto)<P>
ORDER BY amount;

![resultado7](image-6.png)

### <span style="color: Yellow;">Hallazgos / Dificultades en la implementación</span><P>

Como comenté en la Tarea #5, recientemente elegí trabajar con esta BD y al tener 16 tablas, en ocasiones me es difícil encontrar la tabla que me va a dar los datos que me van a llevar a la respuesta que busco. Creo que cuando empecemos a utilizar JOINS podré realizar análisis más complejo.

Me ha costado familiarizarme con la sintaxis pero con la práctica ha sido posible escribir mis querys más facilmente.
También, cuando estoy estrcuturando la query, se me difucultaba encontrar la lógica por tenerlas ordenadas de una manera no amigable visualmente. Investigué la mejor manera de ordenarlas y recordé lo visto en clase. Aplicar la estrcutura recomendada facilitó la detección de errores y el mejor entendimiento de mis querys.