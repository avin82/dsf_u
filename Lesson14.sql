### SUM

/*
Imagine yourself as an Operations Manager at Parch and Posey. You’re
trying to do some inventory planning and you want to know how much of
each paper type to produce. How would you query that from the database?
*/

SELECT SUM(standard_qty) standard, SUM(gloss_qty) gloss, SUM(poster_qty) poster
FROM orders;

# The above query totals up all sales of each paper type and compare
# them to one another. Unlike COUNT, you can only use SUM on numeric
# columns. However, SUM will ignore NULL values, as do the other
# aggregation functions
# 
### Aggregation Reminder
# An important thing to remember: aggregators only aggregate vertically
# - the values of a column. If you want to perform a calculation across
# rows, you would do this with simple arithmetic.

# Find the total amount of poster_qty paper ordered in the orders table.

SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;

# Find the total amount of standard_qty paper ordered in the orders table.

SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;

/*
Find the total dollar amount of sales using the total_amt_usd in the orders 
table.
*/

SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

/*
Find the total amount spent on standard_amt_usd and gloss_amt_usd paper
for each order in the orders table. This should give a dollar amount for
each order in the table.
*/

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

/*
Find the standard_amt_usd per unit of standard_qty paper. Your solution
should use both an aggregation and a mathematical operator.
*/

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;