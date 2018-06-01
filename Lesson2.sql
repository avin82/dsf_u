### ORDER BY

/* In order to gain some practice using ORDER BY:

1. Write a query to return the 10 earliest orders in the orders table.
Include the id, occurred_at, and total_amt_usd.

2. Write a query to return the top 5 orders in terms of largest
total_amt_usd. Include the id, account_id, and total_amt_usd.

3. Write a query to return the bottom 20 orders in terms of least total.
Include the id, account_id, and total.
*/

SELECT id, occurred_at, total_amt_usd 
FROM orders 
ORDER BY occurred_at
LIMIT 10;

SELECT id, account_id, total_amt_usd 
FROM orders 
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total 
FROM orders 
ORDER BY total
LIMIT 20;
