
-- Very Easy: Create a table with your top three cars and include make, model, year. Create a query to add in two more cars
CREATE DATABASE sql1;

USE sql1;

CREATE TABLE cars (
id  INT AUTO_INCREMENT PRIMARY KEY,
car VARCHAR(100),
car_model VARCHAR(100),
car_year YEAR
);

INSERT INTO cars (car, car_model, car_year)
VALUES
('Aston Martin','DBS Superleggera', '2021'),
('Bugatti', 'Chiron Super Sport', '2021'),
('Rolls Royce', 'Cullinan Black Badge', '2020');

INSERT INTO cars (car, car_model, car_year)
VALUES
('Ford Mustang', 'Mach-E','2021'),
('Tesla', 'Model 3','2020');

-- Easy: Create a table with your top five favorite books with Title, Publish Date, and
-- Author First/Last Name Create a query to add in two new books Remove the oldest book Provide an additional query giving the sum of all books

CREATE TABLE books (
id  INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(225),
author_firstname VARCHAR(100),
author_lastname VARCHAR(100),
published YEAR
);

INSERT INTO books (title, author_firstname, author_lastname, published)
VALUES
('Eloquent Javascript', 'Marijn ','Haverbeke','2018'),
('You are a Bada**', 'Jen','Sincero','2013'),
('The Power of Discipline', 'Daniel','Walter','2020'),
('ABCDE', 'Jen','Sincero','2015'),
('You ', 'Kelly','Sear','2018');

INSERT INTO books (title, author_firstname, author_lastname, published)
VALUES
('Eloquent Javascript', 'Marijn ','Haverbeke','2018'),
('You are a Bada**', 'Jen','Sincero','2013');

ALTER TABLE books
ADD quantity INT;

INSERT INTO books ( quantity)
VALUES
('1'),
('1'),
('1'),
('1'),
('1'),
('1'),
('1'),
('1');

UPDATE books
SET quantity = '1'
WHERE id = 1;
UPDATE books
SET quantity = '1'
WHERE id = 2;
UPDATE books
SET quantity = '1'
WHERE id = 3;
UPDATE books
SET quantity = '1'
WHERE id = 4;
UPDATE books
SET quantity = '1'
WHERE id = 5;
UPDATE books
SET quantity = '1'
WHERE id = 6;
UPDATE books
SET quantity = '1'
WHERE id = 7;


DELETE FROM books WHERE published ='2013';

SELECT SUM(quantity)
FROM books;

-- Medium: Create a table with your top 10 movies. Include title, release date, and rating 
-- Create a query that pulls all movies, in order of release date, where the title includes the letter “s”.

CREATE TABLE movies (
id  INT AUTO_INCREMENT PRIMARY KEY,
movie_title VARCHAR(225),
release_date INT,
rating VARCHAR(10)
);

INSERT INTO movies (movie_title, release_date, rating)
VALUES
('Coming to America', '1998','R'),
('Friday', '1995','R'),
('Set it Off', '1996','R'),
('Love and Basketball', '2000','PG-13'),
('Rush Hour', '1998','PG-13'),
('Rush Hour 2', '2001','PG-13'),
('Get Out', '2017','R'),
('Titanic', '1997','PG-13'),
('The Truman Show', '1998','PG'),
('Ratatouille', '2007','G');

SELECT * FROM movies
 WHERE movie_title LIKE '%s%' ORDER BY release_date;

-- Hard: 
-- Make a copy of your Medium Challenge Write out the queries that would add the director’s First Name and Last Name into two separate columns. 
-- Create a query that puts the names together. 
-- Create a query to put the list in alphabetical order by the last name from A-Z After you order the list, remove the Movies where the Last Name ends with ”R-Z” Write a query where the first three appear


ALTER TABLE movies
ADD dir_firstname VARCHAR(100),
ADD dir_lastname VARCHAR(100);

INSERT INTO movies (dir_firstname, dir_lastname)
VALUES
 ('John', 'Landis'),
('F.Gary', 'Gary'),
('F.Gary', 'Gary'),
('Gina' , 'Prince-Bythewood'),
('Brett', 'Ratner'),
('Brett', 'Ratner'),
('Jordan', 'Peele'),
('James', 'Cameron'),
('Peter', 'Weir'),
('Brad', 'Bird');

UPDATE movies
SET dir_firstname = "John", 
dir_lastname = 'Landis'
WHERE id = 1;
UPDATE movies
SET dir_firstname = "F.Gary", 
dir_lastname = 'Gary'
WHERE id = 2;
UPDATE movies
SET dir_firstname = "F.Gary", 
dir_lastname = 'Gary'
WHERE id = 3;
UPDATE movies
SET dir_firstname = "Gina", 
dir_lastname = 'Prince-Bythewood'
WHERE id = 4;
UPDATE movies
SET dir_firstname = "Brett", 
dir_lastname = 'Ratner'
WHERE id = 5;
UPDATE movies
SET dir_firstname = "Brett", 
dir_lastname = 'Ratner'
WHERE id = 6;
UPDATE movies
SET dir_firstname = "Jordan", 
dir_lastname = 'Peele'
WHERE id = 7;
UPDATE movies
SET dir_firstname = "James", 
dir_lastname = 'Cameron'
WHERE id = 8;
UPDATE movies
SET dir_firstname = "Peter", 
dir_lastname = 'Weir'
WHERE id = 9;
UPDATE movies
SET dir_firstname = "Brad", 
dir_lastname = 'Bird'
WHERE id = 10;

-- Create a query that puts the names together.
SELECT CONCAT(dir_firstname, ' ', dir_lastname) AS "Full Name",movie_title, release_date ,rating FROM movies;

-- Create a query to put the list in alphabetical order by the last name from A-Z After you order the list,
SELECT * FROM movies
ORDER BY dir_lastname ASC;
-- remove the Movies where the Last Name ends with ”R-Z” 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM movies WHERE REGEXP_LIKE (dir_lastname, '[r-z]$','i');
-- Write a query where the first three appear
SELECT * FROM movies LIMIT 3;

-- VERY HARD
-- Copy the table from your Very Easy Challenge. Write a query to add in three cars at once
CREATE TABLE cars_price (
id  INT AUTO_INCREMENT PRIMARY KEY,
car VARCHAR(100),
car_model VARCHAR(100),
car_year YEAR
);

INSERT INTO cars_price (car, car_model, car_year)
VALUES
('Aston Martin','DBS Superleggera', '2021'),
('Bugatti', 'Chiron Super Sport', '2021'),
('Rolls Royce', 'Cullinan Black Badge', '2020');


-- Write a query to add in prices and colors for each of these cars
ALTER TABLE cars_price
ADD COLUMN car_color VARCHAR(20),
ADD COLUMN car_price DECIMAL(10,2);

UPDATE cars_price
SET car_color = "Red", 
car_price = 304995.00
WHERE id = 1;
UPDATE cars_price
SET car_color = "Black", 
car_price = 4000000.00
WHERE id = 2;
UPDATE cars_price
SET car_color = "Blue", 
car_price = 382000.00
WHERE id = 3;

-- Write a query to put the Make and Model together in one column
SELECT CONCAT(car, ' ', car_model) AS "Make and Model", car_year, car_color, car_price FROM cars_price;
-- Create a new query that adds an additional column to the results to show how many cars have the same Make.
SELECT car, COUNT(*)
FROM cars_price
GROUP BY car
HAVING COUNT(*) > 0; -- I did 0 because I only have 1 car for each make

-- Create a new query that adds an additional column to the results to show how many cars have the same Make.
SELECT car, COUNT(*)
FROM cars_price
GROUP BY car
HAVING COUNT(*) > 1;
