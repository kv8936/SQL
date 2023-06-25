use mydb;

-- finding the discount given to each cutomer and storing it in a view.

CREATE VIEW discount_all AS 
Select d.discount, c.customer_id, 
CONCAT( c.last_name, ' ' , c.first_name) as name
from coupon as d
JOIN rent as r
ON d.idcoupon = r.coupon_idcoupon
JOIN customer as c
On 
c.customer_id = r.customer_customer_id
ORDER BY d.discount;

-- add of two string using Concat
Select concat( last_name, ' ' , first_name) as name, email_id,
mobile
from customer;

-- UPdating a new property using JSON data type (It is a light weight for storing and transferlight data)

USE mydb;

UPDATE customer
SET note='
{ 
 "Fav movie" : "Family guy" ,
 "weight" : 100,
 "note" : "weekend fix cutomer"
 
 }'
 WHERE customer_id = 2010;
 
 -- Aggregare function and forming of view
 
 
 CREATE VIEW combined_al AS
 SELECT * FROM rent as r
 JOIN movie m ON 
 m.idmovie = r.movie_idmovie
 JOIN customer as c ON
 c.customer_id = r.customer_customer_id
 JOIN coupon as d 
 ON d.idcoupon = r.coupon_idcoupon;
 
 SELECT MAX(discount) AS maximum,
       MIN(discount) AS minumum,
       SUM(rent) AS total_business
       FROM combined_al;

-- To Insert ,update and delete a data

INSERT INTO customer
VALUES 	(2012, 'JOHN', 'smith'
, 12345678, 'example@wiegehts.de',NULL) ;

UPDATE customer
SET last_name = 'WICK' 
WHERE customer_id =2012;

DELETE FROM customer 
WHERE customer_id = 2011;

-- Create a trigger when a new movie is added

use mydb;

DELIMITER $$
	CREATE TRIGGER new_movie_add
      AFTER INSERT ON  movie
      FOR EACH ROW 
      BEGIN 
      UPDATE movie
      SET idmovie = idmovie + OLD 
      WHERE IDMOVIE = NEW.IDMOVIE;
      END $$

-- NULL,AND ,OR AND NOT Operators

SELECT *FROM combined_al
WHERE Note is NULL;

SELECT * FROM combined_al
WHERE NOT(discount> 5 AND rent>20)
ORDER BY idmovie;

SELECT * FROM combined_al
WHERE stock > 100 OR rent >5;


-- to measure rent duration

SELECT DATEDIFF(rent_date , return_date) 
AS total_days_rented  , rent 
, CONCAT( last_name, ' ' , first_name) as name_OF_CUSTOMER,
name

FROM combined_al ;

 

