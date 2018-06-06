### MIN & MAX

/*
Obtain the MIN and MAX number of orders of each paper type from the
orders table.
*/

SELECT MIN(standard_qty) AS standard_min
	   MIN(gloss_qty) AS gloss_min
	   MIN(poster_qty) AS poster_min
	   MAX(standard_qty) AS standard_max
	   MAX(gloss_qty) AS gloss_max
	   MAX(poster_qty) AS poster_max
FROM orders;

/*
Notice that here we were simultaneously obtaining the MIN and MAX number
of orders of each paper type. However, you could run each individually.

Notice that MIN and MAX are aggregators that again ignore NULL values.
Check the expert tip below for a cool trick with MAX & MIN.

Expert Tip Functionally, MIN and MAX are similar to COUNT in that they
can be used on non-numerical columns. Depending on the column type, MIN
will return the lowest number, earliest date, or non-numerical value as
early in the alphabet as possible. As you might suspect, MAX does the
opposite—it returns the highest number, the latest date, or the
non-numerical value closest alphabetically to “Z.”
*/


/*
When was the earliest order ever placed? You only need to return the
date.
*/

SELECT MIN(occurred_at)
FROM orders;

/*
Try performing the same query as in question above without using an
aggregation function.
*/

SELECT occurred_at AS earliest_order_date
FROM orders
ORDER BY occurred_at
LIMIT 1;

/*
When did the most recent (latest) web_event occur?
*/

SELECT MAX(occurred_at) AS most_recent_web_event_date
FROM web_events;

/*
Try to perform the result of the previous query without using an
aggregation function.
*/

SELECT occurred_at AS most_recent_web_event_date
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

/*
Find the mean (AVERAGE) amount spent per order on each paper type, as
well as the mean amount of each paper type purchased per order. Your
final answer should have 6 values - one for each paper type for the
average number of sales, as well as the average amount.
*/

SELECT AVG(standard_qty) mean_standard, 
		AVG(gloss_qty) mean_gloss, 
		AVG(poster_qty) mean_poster, 
		AVG(standard_amt_usd) mean_standard_usd, 
		AVG(gloss_amt_usd) mean_gloss_usd, 
		AVG(poster_amt_usd) mean_poster_usd
FROM orders;

/*
What is the MEDIAN total_usd spent on all orders?
*/

SELECT *
FROM (SELECT total_amt_usd
		FROM orders
		ORDER BY total_amt_usd
		LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;