### NOT

/*
1. Use the accounts table to find the account name, primary poc, and sales
rep id for all stores except Walmart, Target, and Nordstrom.

2. Use the web_events table to find all information regarding individuals
who were contacted via any method except using organic or adwords
methods.

3. Use the accounts table to find all the companies whose names do not start with 'C'.

4. Use the accounts table to find all companies whose names do not contain the string 'one' somewhere in
the name.

5. Use the accounts table to find all companies whose names do not end with 's'.
*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%s';