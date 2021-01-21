-- Select all the actors with the first name ‘Scarlett’.
use sakila;
select * from actor where first_name = 'Scarlett';
-- How many films (movies) are available for rent and how many films have been rented?
select count(rental_id) as no_films_rented from rental where return_date is null;
select count(rental_id) as no_films_available from rental where return_date is not null;
-- What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.
select min(length) from film as min_duration;
select max(length) from film as max_duration;
--  What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length) / 60) as avg_length_hours, floor(avg(length) - 60) as avg_length_minutes from sakila.film;
-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;
-- Since how many days has the company been operating (check DATEDIFF() function)?
select datediff(max(rental_date),min(rental_date)) as operating_days from rental;
-- Show rental info with additional columns month and weekday. Get 20 results.
select *, monthname(rental_date) as rental_month, dayname(rental_date) as rental_date from rental
limit 20 ;
--  Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select*,
case when dayname(rental_date) in ('Monday', 'Tuesday','Wednesday','Thursday','Friday') then 'workday'
 else 'weekend' 
 end as 'day_type'
 from rental;

--  How many rentals were in the last month of activity?
select count(rental_id) from sakila.rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14");
