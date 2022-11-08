-- Query 1:
CREATE TEMPORARY TABLE foca
SELECT film.title, film.rental_duration, film.release_year, film.rental_rate, old_hdd.category_id, old_hdd.actor_id, old_hdd.film_id, actor.name, category.name AS name_category FROM film
inner join old_hdd
on film.film_id = old_hdd.film_id
left join actor
on old_hdd.actor_id = actor.actor_id
left join category
on old_hdd.category_id = category.category_id;

-- Query 2:
SELECT title, COUNT(title) AS count_titles FROM foca
GROUP BY title
ORDER BY count_titles desc;

-- Query 3:
SELECT name_category, COUNT(name_category) AS count_category FROM foca
GROUP BY name_category
ORDER BY count_category desc;

-- Query 4:
SELECT name, COUNT(name) AS count_actor FROM foca
GROUP BY name
ORDER BY count_actor desc;

-- Query 5:
SELECT rental_duration, COUNT(rental_duration) AS count_rental_duration FROM foca
GROUP BY rental_duration
ORDER BY count_rental_duration desc;

-- Query 6:
SELECT rental_rate, COUNT(rental_rate) AS count_rental_rate FROM foca
GROUP BY rental_rate
ORDER BY count_rental_rate desc;
