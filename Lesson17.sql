### GROUP BY Part II

/*
Key takeaways:

1. You can GROUP BY multiple columns at once, as we showed here. This is
often useful to aggregate across a number of different segments.

2. The order of columns listed in the ORDER BY clause does make a
difference. You are ordering the columns from left to right.


GROUP BY - Expert Tips 

1. The order of column names in your GROUP BY clause
doesn’t matter—the results will be the same regardless. If we run the
same query and reverse the order in the GROUP BY clause, you can see we
get the same results.

2. As with ORDER BY, you can substitute numbers for column names in the
GROUP BY clause. It’s generally recommended to do this only when you’re
grouping many columns, or if something else is causing the text in the
GROUP BY clause to be excessively long.

3. A reminder here that any column that is not within an aggregation must
show up in your GROUP BY statement. If you forget, you will likely get
an error. However, in the off chance that your query does work, you might 
not like the results!
*/


/*
For each account, determine the average amount of each type of paper
they purchased across their orders. Your result should have four columns
- one for the account name and one for the average quantity purchased
for each of the paper types for each account.
*/

SELECT a.name,
		AVG(o.standard_qty) avg_qty_standard,
		AVG(o.poster_qty) avg_qty_poster,
		AVG(o.gloss_qty) avg_qty_gloss
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name;

/*
For each account, determine the average amount spent per order on each
paper type. Your result should have four columns - one for the account
name and one for the average amount spent on each paper type.
*/

SELECT a.name,
		AVG(o.standard_amt_usd) avg_amt_standard,
		AVG(o.poster_amt_usd) avg_amt_poster,
		AVG(o.gloss_amt_usd) avg_amt_gloss
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name;

/*
Determine the number of times a particular channel was used in the
web_events table for each sales rep. Your final table should have three
columns - the name of the sales rep, the channel, and the number of
occurrences. Order your table with the highest number of occurrences
first.
*/

SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

/*
Determine the number of times a particular channel was used in the
web_events table for each region. Your final table should have three
columns - the region name, the channel, and the number of occurrences.
Order your table with the highest number of occurrences first.
*/

SELECT r.name, w.channel, COUNT(*) num_events
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;