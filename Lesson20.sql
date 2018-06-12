### DATE functions

/*
Dates are a bit hard to work with. Aggregating by date fields, in
particular doesn’t work in a practical way. It treats each time stamp as
unique, when it would be more practical to round to the nearest day,
week or month, and aggregate across that period.

GROUPing BY a date column is not usually very useful in SQL, as these
columns tend to have transaction data down to a second. Keeping date
information at such a granular data is both a blessing and a curse, as
it gives really precise information (a blessing), but it makes grouping
information together directly difficult (a curse).

Lucky for us, there are a number of built in SQL functions that are
aimed at helping us improve our experience in working with dates.

DATE Formats

In US - MM DD YY

In the rest of the world - DD MM YY

In Databases - YYYY MM DD

In order to group by day, we’ll need to adjust all the times on April
1st 2017 to read: 2017-04-01 00:00:00. That way, when we group by date,
we get every event that occurred for all hours, minutes, and seconds of
April 1st. They’ll all be grouped together into the same grouping.

We can do this using the DATE_TRUNC function. DATE_TRUNC allows you to
truncate your date to a particular part of your date-time column. Common
trunctions are day, month, and year.

DATE_TRUNC can be used to aggregate at very granular levels like second.
That might be useful if you’re working with server logs or many events
happen in a given second. Most of the time though, you’ll use this to
aggregate at intervals that make sense from a business perspective: day,
week, month, quarter, and year.

There are some cases where you might want to just pull out a given part
of the day. For example, if you want to know what day of the week Parch
and Posey’s website sees the most traffic, you wouldn’t want to use
DATE_TRUNC. To get the day of the week, you’d have to use date part.
Date part allows you to pull the part of the date that you’re interested
in. But notice that regardless of year, a DATE_PART would provide the
same month for an event that happens in April 2016 and April 2017, where
a DATE_TRUNC would differentiate these events.

*/

/*
On what day of the week are the most sales made?
*/

SELECT DATE_PART(‘dow’, occurred_at) AS day_of_week,
		SUM(total) AS total_qty
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*
‘dow’ pulls the day of the week with 0 as Sunday and 6 as Saturday. 
Looks like the most paper was ordered on Sunday and the least paper was 
ordered on Thursday.
*/

/*
Find the sales in terms of total dollars for all orders in each year,
ordered from greatest to least. Do you notice any trends in the yearly
sales totals?
*/

SELECT DATE_PART('year', occurred_at) ord_year,  SUM(total_amt_usd) total_spent
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*
When we look at the yearly totals, you might notice that 2013 and 2017
have much smaller totals than all other years. If we look further at the
monthly data, we see that for 2013 and 2017 there is only one month of
sales for each of these years (12 for 2013 and 1 for 2017). Therefore,
neither of these are evenly represented. Sales have been increasing year
over year, with 2016 being the largest sales to date. At this rate, we
might expect 2017 to have the largest sales.
*/

/*
Which month did Parch & Posey have the greatest sales in terms of total
dollars? Are all months evenly represented by the dataset?
*/

/*
In order for this to be 'fair', we should remove the sales from 2013 and
2017. For the same reasons as discussed above.
*/

SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

/*
The greatest sales amounts occur in December (12). 
*/

/*
Which year did Parch & Posey have the greatest sales in terms of total
number of orders? Are all years evenly represented by the dataset?
*/

SELECT DATE_PART('year', occurred_at) ord_year,  COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*
Again, 2016 by far has the most amount of orders, but again 2013 and
2017 are not evenly represented to the other years in the dataset.
*/

/*
Which month did Parch & Posey have the greatest sales in terms of total
number of orders? Are all months evenly represented by the dataset?
*/

SELECT DATE_PART('month', occurred_at) ord_month, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

/*
December still has the most sales, but interestingly, November has the
second most sales (but not the most dollar sales. To make a fair
comparison from one month to another 2017 and 2013 data were removed.
*/

/*
In which month of which year did Walmart spend the most on gloss paper
in terms of dollars?
*/

SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/*
May 2016 was when Walmart spent the most on gloss paper.
*/