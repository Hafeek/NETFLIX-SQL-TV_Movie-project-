---netflix project---
create table netflix(
show_id varchar (7),
type varchar  (10),
title varchar (150),
director varchar (230),
movie_cast varchar (1000),
country	varchar (150),
date_added	varchar (50),
release_year int,
rating	varchar (10),
duration varchar (15),
listed_in varchar (30),
description	varchar (300)

);
select * from netflix;

---- count how many tyoe of content-----
select count (*) as total_content 
from netflix;

----- select how many diiferent type of movies content in type-----
select 
distinct type
from netflix;

select * from netflix;
---15 business prblems question----

1-- count the number of movies vs tv shows--

select 
type,
count (*) as total_content
from netflix
group by type;

2-- find the most common rating for movies and tv shows--

select 
type,
rating,
count (*)
--max(rating)--
from netflix
group by (1,2)
order by 3 desc;

SELECT type, rating, COUNT(*) AS count
FROM netflix
GROUP BY type, rating
select () OVER (PARTITION BY type ORDER BY COUNT(*) DESC) = 1;

3-- list all the movies released in a specific year (e.g.2020)---

select * from netflix;

SELECT *
FROM netflix
WHERE type = 'Movie'
AND release_year = 2020;


4--find the top 5 countries with the most content on netflix--
select country,count (*) as content_count
from netflix
group by country
order by content_count desc
limit 5;

5-- identofy the longest movie--
select * from netflix
where 
type = 'Movie'
and 
duration = (select max (duration)
from netflix
where type = 'Movie');

6-- find content added in the last 5 years--
select *
from netflix
where
to_date (date_added,'month dd yyyy') >= current_date - interval '5 years'

7-- find all the movies/tv shows by director "rajiv chilaka"--

SELECT *
FROM netflix
WHERE director = 'Rajiv Chilaka';

8--list all tv shows with more than 5 seasons--
select * FROM netflix
WHERE 
type = 'TV Show'
 AND split_part (duration, ' ', 1):: numeric > 5;

9-- count the number if content items in each genre--

SELECT listed_in AS genre, COUNT(*) AS content_count
FROM netflix
GROUP BY listed_in
ORDER BY content_count DESC;

10-- list all movies that are documentariies--

select * from netflix
where 
listed_in = 'Documentaries';

11-- find all content without a director--

select * from netflix
where 
director is null;

12--find how many movies actor 'salman khan ' appeared in last 10 tears--
select * from netflix
where 
like 'Salman Khan'
and 
release_year > extract (year from current_date) - 10;

SELECT COUNT(*) AS salman_khan_movie_count
FROM netflix
WHERE type = 'Movie'
  AND movie_cast LIKE  '%Salman Khan%'
  AND release_year > extract  (YEAR from Current_date) -10;
13-- find the top 10 actors who have appeared
in the highsest nu of movies produced
in india--







  



























