### LIKE

/*
Use the accounts table to find

1. All the companies whose names start with 'C'.

2. All companies whose names contain the string 'one' somewhere in the
name.

3. All companies whose names end with 's'. 
*/

SELECT name 
FROM accounts 
WHERE name LIKE 'C%';

SELECT name 
FROM accounts 
WHERE name LIKE '%one%';

SELECT name 
FROM accounts 
WHERE name LIKE '%s';