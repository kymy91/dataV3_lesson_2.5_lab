##Lab_SQLQueries-Lesson2.5
#In this lab, you will be using the Sakila database of movie rentals. You can follow the steps listed here to get the data locally: Sakila sample database - installation.

######1 Select all the actors with the first name ‘Scarlett’.
USE sakila;

SELECT * FROM sakila.actor
WHERE first_name = "Scarlett";
#ANSWER 2 RESULTS

######2 How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT film_id) FROM sakila.film; 
##ANSWER 1000

SELECT COUNT(DISTINCT rental_id) FROM sakila.rental; ##??¿
##ANSWER 16044

######3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration FROM sakila.film; #46 185

######4 What's the average movie duration expressed in format (hours, minutes)?
SELECT floor(avg(length)/ 60) as avg_length_hours, floor(avg(length) - 60) as avg_length_minutes from sakila.film;
#1h 55m

######5How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;
#121

######6 Since how many days has the company been operating (check DATEDIFF() function)?
select min(rental_date) as Min_date, max(rental_date) as last_rental from rental;
select DATEDIFF('2006-02-14 15:16:03', '2005-05-24 22:53:30') As Days_Opened;

######7 Show rental info with additional columns month and weekday. Get 20 results.
select year(rental_date) as Year, month(rental_date) as month, dayname(rental_date)
from sakila.rental
limit 20;

######8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
ALTER TABLE sakila.rental
ADD COLUMN type_day TEXT;

SELECT * from sakila.rental;

update sakila.rental
SET type_day = "Weekday"
WHERE WEEKDAY(rental_date) >= 5;

select * from sakila.rental; 

update sakila.rental
SET type_day = "Weekend"
WHERE WEEKDAY(rental_date) <= 6;

select * from sakila.rental;

######9 How many rentals were in the last month of activity?
select date(max(rental_date))  -INTERVAL 30 DAY as max, date(max(rental_date)) as min
from sakila.rental;
select count(rental_id) as Last_month_rental from rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14"); 
