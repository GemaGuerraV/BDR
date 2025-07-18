use sakila;

-- Al ser un LEFT JOIN, nos arroja todos los clientes y se relaciona con la tabla de las películas rentadas, aún cuando un cliente no haya rentado este 
-- aparecerá en la lista al ser la tabla izquierda y la iformación relacionada a la tabla rentals aparecerá como NULL.
-- La tabla muestra el id del cliente, su primer nombre, el id de renta, fecha de renta y de retorno y el id del empleado que lo rentó.
-- Me di cuenta que todos los empleados han rentado al menos una vez.
-- LEFT JOIN tabla izquierda(customer) tabla derecha (rentals)

CREATE VIEW clientes_que_han_rentado_y_que_no AS 
SELECT
    c.customer_id,
    c.first_name,
    r.rental_id,
    r.rental_date,
    r.return_date,
    r.staff_id
FROM
    customer AS c
LEFT JOIN
    rental AS r ON c.customer_id = r.customer_id;

-- Al ser un RIGHT JOIN, nos arroja todas las rentas y se relaciona con la tabla de los pagos, aparecerán todos los IDs de renta
-- al ser la tabla derecha y la información relacionada a la tabla payments aparecerá como NULL en caso de que no se haya pagado.
-- La tabla muestra el id del cliente, el id de renta, el id del empleado que lo rentó y la cantidad pagada.
-- Me di cuenta que todas las rentas han sido pagadas
-- RIGHT JOIN tabla izquierda(payment) tabla derecha (rentals)

CREATE VIEW clientes_que_han_rentado_y_pagado_los_que_no AS 
SELECT
    r.customer_id,
    r.rental_id,
    r.staff_id,
    p.amount
FROM
    payment AS p
RIGHT JOIN
    rental AS r ON r.rental_id = p.rental_id;


-- Esta vista usa JOIN's y nos muestra el nombre de la película rentada,
-- el nombre del cliente que la rentó, la fecha de renta y de regreso, la persona que lo rentó y la tienda en la que se realizó la renta
-- También, hace la diferencia de fecha de retorno contra fecha de renta para saber los días que tardaron en regresarlo.

CREATE VIEW dias_rentados_por_tienda_cliente_staff_pelicula AS 
SELECT
    r.rental_id,
    f.title,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    r.rental_date,
    r.return_date,
    s.first_name AS staff_first_name,
    i.store_id,
    DATEDIFF(r.return_date,r.rental_date) AS days_rented
FROM
    rental AS r
JOIN
    inventory AS i ON r.inventory_id = i.inventory_id
JOIN
	film AS f ON i.film_id = f.film_id
JOIN
	customer AS c ON c.customer_id = r.customer_id
JOIN
	staff AS s ON s.staff_id = r.staff_id;
	

-- SUBCONSULTA
-- Esta vista permite ver los clientes que aún no han regresado las películas rentadas y arroja los días que van desde la renta hasta el día actual.

CREATE VIEW películas_no_regresadas_y_contador_de_dias AS 
SELECT title,customer_first_name,customer_last_name,rental_date,staff_first_name,store_id, 
		DATEDIFF(curdate(),rental_date) as days_passed
FROM dias_rentados_por_tienda_cliente_staff_pelicula
WHERE return_date IS NULL;

SELECT*FROM películas_no_regresadas_y_contador_de_dias;




-- TRIGGER
-- Ayuda a no permitir una renta si el cliente tiene 1 o más rentas pendientes de regresar de más de 7 días.

DELIMITER //

CREATE TRIGGER Previene_renta_si_no_regreso
BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
    DECLARE renta_excedida INT;

    -- Cuenta el numero de rentas no regresadas por cada cliente,
    SELECT COUNT(*)
    INTO renta_excedida
    FROM rental
    WHERE customer_id = NEW.customer_id
      AND return_date IS NULL
      AND rental_date < CURDATE() - INTERVAL 7 DAY;

    -- No permite insertar si el cliente tiene mas de 1 renta pasada de 7 días
    IF renta_excedida > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No rentar! El cliente cuenta con una o más películas rentadas que no ha devuelto!';
    END IF;
END;
//

DELIMITER ;




