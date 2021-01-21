-- Get release years.
select distinct(release_year) as release_year from film;
-- Get all films with ARMAGEDDON in the title.
select * from film where title regexp 'ARMAGEDDON';
-- Get all films which title ends with APOLLO.
select * from film where title regexp 'APOLLO$';
-- Get 10 the longest films.
select * from film 
order by length desc;
-- How many films include **Behind the Scenes** content?
select * from film where special_features regexp 'Behind the Scenes';
--  Drop column `picture` from `staff`.
alter table staff 
drop column picture;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer where first_name = 'TAMMY' and last_name = 'SANDERS';
delete from staff where staff_id = 3;
insert into staff
values('3', 'TAMMY', 'SANDERS', '79', 'TAMMY.SANDERS@sakilacustomer.org', '2', '1', 'TAMMY', '', '2020-02-15 03:57:16');

--  Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` tabl.Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need `customer_id` information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select film_id from film where title = 'ACADEMY DINOSAUR';
select inventory_id from inventory where film_id =1; 
select staff_id from staff where first_name ='Mike' and last_name ='Hillyer';
insert into rental values('16045', CURRENT_DATE(), '1', '130' , NULL , '1' ,CURRENT_DATE() );
select * from rental where rental_id = 16045;

-- Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
select * from customer where active =0;
-- Create a table _backup table_ as suggested
DROP TABLE IF EXISTS deleted_users;
create table if not exists deleted_users( customer_id int(5), email varchar(50), date date ) ;
-- Insert the non active users in the table _backup table_
insert into deleted_users select customer_id, email, date(last_update) from customer where active = 0; 
-- Delete the non active users from the table _customer_
delete from customer where active = 0;