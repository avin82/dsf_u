### COUNT AND NULL

/*
NULLs are a datatype that specifies where no data exists in SQL. They
are often ignored in our aggregation functions.

Notice that NULLs are different than a zero - they are cells where data
does not exist. When identifying NULLs in a WHERE clause, we write IS
NULL or IS NOT NULL. We don't use =, because NULL isn't considered a
value in SQL. Rather, it is a property of the data.

NULLs - Expert Tip There are two common ways in which you are likely to
encounter NULLs:

	1) NULLs frequently occur when performing a LEFT or RIGHT JOIN. You
	saw in the last lesson - when some rows in the left table of a left
	join are not matched with rows in the right table, those rows will
	contain some NULL values in the result set.  2) NULLs can also occur
	from simply missing data in our database.
*/

# Find all the rows in the accounts table.

SELECT COUNT(*)
FROM accounts;

/*
We could have just as easily chosen a column to drop into the 
aggregation function:
*/

SELECT COUNT(accounts.id)
FROM accounts;

/*
Find the count of non-null values in the column primary_poc for the
accounts table and also find the total number of rows of accounts table.
Finally find all the rows of the accounts table for which primary_poc
has null value.
*/

SELECT COUNT(primary_poc) account_primary_poc_count
FROM accounts;

/*
The above query gives the count of all the non-null values for the column 
primary_poc in the accounts table.
*/

SELECT COUNT(*)
FROM accounts;

# The above query gives count of all the rows in the accounts table.

SELECT *
FROM accounts
WHERE primary_poc IS NULL;

/*
The above query gives all the rows of the accounts table where  value for 
primary_poc is NULL.
*/

