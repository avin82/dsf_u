### GROUP BY

/*
GROUP BY allows creating segments that will aggregate independent from
one another.
*/

/*
Calculate the sum of each paper type as per account_id field from the
orders table.
*/

SELECT account_id,
	SUM(standard_qty) AS standard_sum,
	SUM(gloss_qty) AS gloss_sum,
	SUM(poster_qty) AS poster_sum
FROM orders
GROUP BY account_id
ORDER BY account_id;

/*
The key takeaways here:

1) GROUP BY can be used to aggregate data within subsets of the data. For
example, grouping for different accounts, different regions, or
different sales representatives.

2) Any column in the SELECT statement that is not within an aggregator must
be in the GROUP BY clause.

3) The GROUP BY always goes between WHERE and ORDER BY.

4) ORDER BY works like SORT in spreadsheet software.


GROUP BY - Expert Tip 

Before we dive deeper into aggregations using GROUP BY statements, it is 
worth noting that SQL evaluates the aggregations before the LIMIT clause. 
If you don’t group by any columns, you’ll get a 1-row result—no problem there. 
If you group by a column with enough unique values that it exceeds the LIMIT 
number, the aggregates will be calculated, and then some rows will simply be 
omitted from the results.
*/

/*
Which account (by name) placed the earliest order? Your solution should
have the account name and the date of the order.
*/

SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;

/*
Find the total sales in usd for each account. You should include two
columns - the total sales for each company's orders in usd and the
company name.
*/

SELECT a.name, SUM(o.total_amt_usd) total_sales
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

/*
Via what channel did the most recent (latest) web_event occur, which
account was associated with this web_event? Your query should return
only three values - the date, channel, and account name.
*/

SELECT w.occurred_at,
	w.channel, 
	a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
ORDER BY w.occurred_at DESC
LIMIT 1;

/*
Find the total number of times each type of channel from the web_events
was used. Your final table should have two columns - the channel and the
number of times the channel was used.
*/

SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel;

/*
Who was the primary contact associated with the earliest web_event?
*/

SELECT a.primary_poc
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

/*
What was the smallest order placed by each account in terms of total
usd. Provide only two columns - the account name and the total usd.
Order from smallest dollar amounts to largest.
*/

SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;

/*
Find the number of sales reps in each region. Your final table should
have two columns - the region and the number of sales_reps. Order from
fewest reps to most reps.
*/

SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;