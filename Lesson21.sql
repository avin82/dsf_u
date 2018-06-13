### CASE

/*
Imagine yourself as a marketing manager for Parch and Posey. You want to
compare Facebook as a marketing channel against all other channels. For
this application, use the “Case” statement which is SQL’s way of
handling “IF” “then” logic. Also, compare Facebook and Direct channels
against the rest.
*/

SELECT id,
		account_id,
		occurred_at,
		channel,
		CASE WHEN channel = ‘facebook’ THEN ‘yes’ END AS is_facebook
FROMweb_events
ORDER BY occurred_at;


SELECT id,
		account_id,
		occurred_at,
		channel,
		CASE WHEN channel = ‘facebook’ THEN ‘yes’ ELSE ‘no’ END AS is_facebook
FROMweb_events
ORDER BY occurred_at;


SELECT id,
		account_id,
		occurred_at,
		channel,
		CASE WHEN channel = ‘facebook’ OR channel = ‘direct’ THEN ‘yes’ ELSE ‘no’ END AS is_facebook
FROMweb_events
ORDER BY occurred_at;

/*
Imagine yourself at Operations in Parch and Posey. You’d like to
classify orders into general groups based on order size to get even more
granular about inventory planning for e.g. groupings are ‘100 or under’,
‘100 - 300’, ‘300 - 500’, ‘Over 500’.
*/

SELECT account_id,
		occurred_at,
		CASE WHEN total > 500 THEN ‘Over 500’
		WHEN total > 300 AND total <=500 THEN ‘301 - 500’
		WHEN total > 100 AND total <=300 THEN ‘101 - 300’
		ELSE ‘100 or under’ END AS total_group
FROM orders;

/*
Create a column that divides the standard_amt_usd by the standard_qty to
find the unit price for standard paper for each order. Limit the results
to the first 10 orders, and include the id and account_id fields.

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price FROM
orders LIMIT 10;

NOTE - you will be thrown an error with the correct solution to this
question. This is for a division by zero.

Use CASE statement to get a solution without an error to this query.
*/

SELECT account_id, 
		CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
		ELSE standard_amt_usd/standard_qty END AS unit_price
FROM orders
LIMIT 10;

/*
Now the first part of the statement will catch any of those division by
zero values that were causing the error, and the other components will
compute the division as necessary. You will notice, we essentially
charge all of our accounts 4.99 for standard paper. It makes sense this
doesn't fluctuate, and it is more accurate than adding 1 in the
denominator like our quick fix might have been in the earlier lesson.
*/

/*
As a Sales Operations Manager at Parch & Posey, classify groups into two
groups i.e. ‘Over 500’ and ‘500 or under’.
*/

SELECT CASE WHEN total > 500 THEN ‘Over 500’ ELSE ‘500 or under’ END AS total_group, 
		COUNT(*) AS order_count
FROM orders
GROUP BY 1;

/*
We would like to understand 3 different levels of customers based on the
amount associated with their purchases. The top branch includes anyone
with a Lifetime Value (total sales of all orders) greater than 200,000
usd. The second branch is between 200,000 and 100,000 usd. The lowest
branch is anyone under 100,000 usd. Provide a table that includes the
level associated with each account. You should provide the account name,
the total sales of all orders for the customer, and the level. Order
with the top spending customers listed first.
*/

SELECT a.name, SUM(total_amt_usd) total_spent, 
		CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
		WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
		ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
GROUP BY a.name
ORDER BY 2 DESC;

/*
We would like to understand 3 different levels of customers based on the
amount associated with their purchases. The top branch includes anyone
with a Lifetime Value (total sales of all orders) greater than 200,000
usd. The second branch is between 200,000 and 100,000 usd. The lowest
branch is anyone under 100,000 usd. Provide a table that includes the
level associated with each account. You should provide the account name,
the total sales of all orders for the customer, and the level. We want
to obtain the total amount spent by customers only in 2016 and 2017.
Order with the top spending customers listed first.
*/

SELECT a.name, SUM(total_amt_usd) total_spent, 
		CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
		WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
		ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE occurred_at > '2015-12-31' 
GROUP BY 1
ORDER BY 2 DESC;

/*
We would like to identify top performing sales reps, which are sales
reps associated with more than 200 orders. Create a table with the sales
rep name, the total number of orders, and a column with top or not
depending on if they have more than 200 orders. Place the top sales
people first in your final table.
*/

SELECT s.name, COUNT(*) num_ords,
		CASE WHEN COUNT(*) > 200 THEN 'top'
		ELSE 'not' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 2 DESC;

/*
We would like to identify top performing sales reps, which are sales
reps associated with more than 200 orders or more than 750000 in total
sales. The middle group has any rep with more than 150 orders or 500000
in sales. Create a table with the sales rep name, the total number of
orders, total sales across all orders, and a column with top, middle, or
low depending on this criteria. Place the top sales people based on
dollar amount of sales first in your final table.
*/

SELECT s.name, COUNT(*), SUM(o.total_amt_usd) total_spent, 
		CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
		WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
		ELSE 'low' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;