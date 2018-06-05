### JOIN

/*
The JOIN introduces the second table from which you would like to pull
data, and the ON tells you how you would like to merge the tables in the
FROM and JOIN statements together.
*/

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*
Above, we are only pulling data from the orders table since in the
SELECT statement we only reference columns from the orders table.
*/

/*
Additional Information - If we wanted to only pull individual elements
from either the orders or accounts table, we can do this by using the
exact same information in the FROM and ON statements. However, in your
SELECT statement, you will need to know how to specify tables and
columns in the SELECT statement:

1. The table name is always before the period. 
2.The column you want from that table is always after the period. 

For example, if we want to pull only the account name and the dates 
in which that account placed an order, but none of the other columns, 
we can do this with the following query:
*/

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*
This query only pulls two columns, not all the information in these two
tables. Alternatively, the below query pulls all the columns from both
the accounts and orders table.
*/

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

/*

1. Try pulling all the data from the accounts table, and all the data from
the orders table.

2. Try pulling standard_qty, gloss_qty, and poster_qty from the orders
table, and the website and the primary_poc from the accounts table.
*/

SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;