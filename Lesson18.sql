### DISTINCT

/*
You can think of DISTINCT this way, if you want to group by some columns
but you don’t necessarily want to include any aggregations, you can use
DISTINCT instead.

As an example, let’s see the count of events by channel by account in
the GROUP BY segment.
*/

SELECT account_id, 
		channel,
		COUNT(id) AS events
FROM web_events
GROUP BY account_id, channel
ORDER BY account_id, events DESC

# Notice the row count, 1509

/*
If we get rid of the events column, you can see that the resulting query
returns basically the results with the same row count. And if run that
query again with DISTINCT, you can see that the results are the same.
*/

SELECT DISTINCT account_id,
				channel
FROM web_events
ORDER BY account_id

# Notice the row count, 1509

/*
Use DISTINCT to test if there are any accounts associated with more than
one region.
*/

SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

# Notice the row count, 351

SELECT DISTINCT id, name
FROM accounts;

# Notice the row count, 351

/*
The two queries have the same number of resulting rows (351), so we know
that every account is associated with only one region. If each account
was associated with more than one region, the first query should have
returned more rows than the second query.
*/

/*
Have any sales reps worked on more than one account?
*/

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

# Notice the row count, 50

SELECT DISTINCT id, name
FROM sales_reps;

# Notice the row count, 50

/*
Actually all of the sales reps have worked on more than one account. The
fewest number of accounts any sales rep works on is 3. There are 50
sales reps, and they all have more than one account. Using DISTINCT in
the second query assures that all of the sales reps are accounted for in
the first query.
*/