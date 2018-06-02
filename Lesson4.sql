### WHERE

/*
Write a query that

1. Pull the first 5 rows and all columns from the orders table that have a
dollar amount of gloss_amt_usd greater than or equal to 1000.

2. Pull the first 10 rows and all columns from the orders table that have a
total_amt_usd less than 500.
*/

SELECT * 
FROM orders 
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT * 
FROM orders 
WHERE total_amt_usd < 500 
LIMIT 10;