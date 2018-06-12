### HAVING

/*
Imagine yourself as an account manager at Parch and Posey, working with
the company’s largest accounts. You might want to identify the total
sales in US Dollars for accounts with over $ 250,000 in sales.
*/

SELECT account_id, SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
WHERE SUM(total_amt_usd) >= 250000
GROUP BY 1
ORDER BY 2 DESC;

/*
Note:
Looks like something went wrong with your query
aggregate functions are not allowed in WHERE
*/

SELECT account_id, SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
GROUP BY 1
HAVING SUM(total_amt_usd) >= 250000;

/*
HAVING - Expert Tip 

HAVING is the “clean” way to filter a query that has
been aggregated, but this is also commonly done using a subquery.
Essentially, any time you want to perform a WHERE on an element of your
query that was created by an aggregate, you need to use HAVING instead.
*/

/*
How many of the sales reps have more than 5 accounts that they manage?
*/

SELECT s.id id_sales_rep, 
		   s.name sales_rep_name,
		   COUNT(*) num_accounts
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
GROUP BY id_sales_rep, sales_rep_name
HAVING COUNT(*) > 5
ORDER BY num_accounts DESC;

/*
How many accounts have more than 20 orders?
*/

SELECT a.id,
		a.name,
		COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders DESC;

/*
Which account has the most orders?
*/

SELECT a.id,
		a.name,
		COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;

/*
How many accounts spent more than 30,000 usd total across all orders?
*/

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;

/*
How many accounts spent less than 1,000 usd total across all orders?
*/

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

/*
Which account has spent the most with us?
*/

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;

/*
Which account has spent the least with us?
*/

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 1;

/*
Which accounts used facebook as a channel to contact customers more than
6 times?
*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;

/*
Which account used facebook most as a channel?
*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

/*
Which channel was most frequently used by most accounts?
*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;

# All of the top 10 are direct.



