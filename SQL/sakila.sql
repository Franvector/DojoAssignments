-- 1
-- SELECT customer.first_name,customer.last_name,customer.email,address.address FROM address
-- JOIN customer ON address.address_id=customer.address_id
-- WHERE address.city_id = 312;

-- 2
-- SELECT film.title,film.description,film.release_year,film.rating,film.special_features,category.name FROM film_category
-- JOIN film ON film_category.film_id=film.film_id
-- JOIN category ON film_category.category_id=category.category_id
-- WHERE category.name = "comedy"

-- 3
-- SELECT actor.actor_id,CONCAT_WS(' ',actor.first_name,actor.last_name) AS full_name,film.title,film.description,film.release_year FROM film_actor
-- JOIN actor ON film_actor.actor_id=actor.actor_id
-- JOIN film ON film_actor.film_id=film.film_id
-- WHERE film_actor.actor_id = 5
-- OR actor.actor_id = 5;

-- 4
-- SELECT customer.first_name,customer.last_name,customer.email,address.address FROM address
-- JOIN customer ON address.address_id=customer.customer_id
-- WHERE address.city_id = 1
-- OR address.city_id = 42
-- OR address.city_id = 312
-- OR address.city_id = 459;

-- 5
-- SELECT film.title,film.description,film.release_year FROM film
-- JOIN film_actor ON film.film_id=film_actor.film_id
-- JOIN actor on film_actor.actor_id=actor.actor_id
-- WHERE actor.actor_id = 15;

-- 6
-- SELECT film.film_id,film.title,actor.actor_id,CONCAT_WS(' ',actor.first_name,actor.last_name) AS full_name FROM film
-- JOIN film_actor ON film.film_id=film_actor.film_id
-- JOIN actor ON film_actor.actor_id=actor.actor_id
-- WHERE film.film_id = 369;

-- 7
-- SELECT film.title,film.description,film.release_year,film.rating,film.special_features,category.name FROM film
-- JOIN film_category ON film.film_id=film_category.film_id
-- JOIN category ON film_category.category_id=category.category_id
-- WHERE film.rental_rate > 2.99;

-- 8
SELECT 
    film.title,
    film.description,
    film.release_year,
    film.rating,
    film.special_features,
    category.name,
    CONCAT_WS(' ',actor.first_name,actor.last_name) AS full_name FROM film

#1st many to many for categories
JOIN film_category 
    ON film.film_id=film_category.film_id
    JOIN category 
        ON film_category.category_id=category.category_id

#2nd many to many for actors
JOIN film_actor 
    ON film.film_id=film_actor.film_id
    JOIN actor 
        ON film_actor.actor_id=actor.actor_id

WHERE category.name  = "action"
AND actor.first_name = "SANDRA"
AND actor.last_name  = "KILMER";