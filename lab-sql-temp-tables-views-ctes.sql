USE sakila;

-- 1
SELECT * FROM rental;
SELECT * FROM customer;


CREATE VIEW rental_count AS
SELECT
		c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        COUNT(r.rental_id) AS rental_count
FROM customer AS c
JOIN rental AS r
USING(customer_id)
GROUP BY c.customer_id;
        
-- 2 

CREATE TEMPORARY TABLE total_paid AS
SELECT
		r.customer_id,
        SUM(p.amount)
FROM rental_count AS r 
JOIN payment AS p
USING(customer_id)
GROUP BY r.customer_id;


		















