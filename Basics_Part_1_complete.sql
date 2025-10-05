
-- some basic commands in sql
SHOW DATABASES; -- → Displays all databases available on the SQL server.

USE sakila; -- → Selects the database sakila to perform operations on it.

SHOW TABLES; -- → Displays all tables present in the currently selected database.

-- accessing data from the table: to access data from the table, We use SELECT statement.
SELECT * FROM table_name; -- → Retrieves all columns and all rows from the specified table.
-- example:
SELECT * FROM actor;

-- In SQL, the command DESCRIBE table_name; (or DESC table_name;) is used to show the structure of a table,
-- including columns, data types, and constraints.
-- example:
DESCRIBE actor; -- Displays the structure of the actor table, showing column names, data types, and other attributes.

 
-- “In SQL, keywords like SELECT and FROM are not case-sensitive, but table names, column names, 
-- and string data may be case-sensitive depending on the database system and its collation settings.
-- 1.Case Sensitivity in SQL – Simple Version
-- SQL Keywords (SELECT, FROM, WHERE) → Not case-sensitive
-- SELECT * FROM employees; = select * from employees;

-- 2.Table and Column Names (Identifiers) → Depends on database and OS
-- MySQL on Linux → Case-sensitive (Employees ≠ employees)
-- MySQL on Windows → Case-insensitive (Employees = employees)
-- SQL Server / Oracle → Usually case-insensitive

-- 3.Data in Tables (Strings) → Depends on collation
-- 'John' may match 'john' if the database uses case-insensitive collation
-- example:
-- 1. MySQL:
-- By default: Case-insensitive ('John' = 'john')
-- 2. SQL Server:
-- Default collation is case-insensitive → 'John' = 'john'
-- 3. Oracle:
-- String comparisons are case-sensitive by default → 'John' ≠ 'john'


-- basic select queries:
SELECT actor_id, first_name, actor_id FROM actor;
SELECT actor_id, first_name, actor_id*5 FROM actor; -- doesnt change the original data

-- WHERE CLAUSE: 
-- The WHERE clause in SQL is used to filter records that meet a specific condition.
SELECT * FROM actor WHERE actor_id=5;
--  NOTE: The WHERE clause is always used to filter rows, not columns.
-- It decides which rows appear in the result — based on the condition you set.

SELECT * FROM actor WHERE first_name='NICK'; -- FOR DATA ALWAYS APPLY CASE SENSITIVE VALUE AND IN SINGLE QUOTE, DONT USE DOUBLE QUOTE.

-- OPERATORS:Operators in SQL are special symbols or keywords used to perform operations on data.
-- (like comparisons, calculations, or logical checks).
-- | **Type**                      | **Operator**                            | **Example**                          | **Description**                   |
-- | ----------------------------- | --------------------------------------- | ------------------------------------ | --------------------------------- |
-- | **Arithmetic Operators**      | `+`, `-`, `*`, `/`, `%`                 | `salary + 5000`                      | Perform mathematical calculations |
-- | **Comparison Operators**      | `=`, `!=` or `<>`, `>`, `<`, `>=`, `<=` | `WHERE age >= 18`                    | Compare two values                |
-- | **Logical Operators**         | `AND`, `OR`, `NOT`                      | `WHERE age > 18 AND city = 'London'` | Combine multiple conditions       |
-- | **Range Operator**            | `BETWEEN ... AND ...`                   | `WHERE salary BETWEEN 3000 AND 8000` | Check if a value lies in a range  |
-- | **Set Operator**              | `IN`, `NOT IN`                          | `WHERE city IN ('Paris','Rome')`     | Check if a value exists in a list |
-- | **Pattern Matching Operator** | `LIKE`, `NOT LIKE`                      | `WHERE name LIKE 'A%'`               | Match text patterns               |
-- | **Null Operator**             | `IS NULL`, `IS NOT NULL`                | `WHERE phone IS NULL`                | Check for missing values          |

-- applying where on column:
SELECT * FROM actor WHERE first_name='NICK';
SELECT * FROM actor WHERE last_name='STALLONE';
SELECT first_name FROM actor WHERE last_name='STALLONE';

-- not equals to
SELECT * FROM actor WHERE actor_id!=5;
SELECT * FROM actor WHERE actor_id<>5;
-- greater than
SELECT * FROM actor WHERE actor_id>5;
-- greater than equals to
SELECT * FROM actor WHERE actor_id>=5;
-- less than equals to
SELECT * FROM actor WHERE actor_id<=5;

-- LOGICAL(AND/OR) OPERATOR
SELECT * FROM actor WHERE first_name='NICK' AND actor_id=44;
SELECT * FROM actor WHERE first_name='NICK' OR actor_id=44;
SELECT * FROM actor WHERE first_name='NICK' OR actor_id!=46;

-- fetching values in a range
SELECT * FROM actor WHERE actor_id>2 AND actor_id<=6;
SELECT * FROM actor WHERE actor_id IN(3,4,5,6);
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 6;
-- ABOVE THREE QUERIES GIVE SAME RESULT

-- SET OPERATOR(IN/NOT IN):
SELECT * FROM actor WHERE actor_id=2 OR actor_id=8 OR actor_id=19;
SELECT * FROM ACTOR WHERE actor_id IN(2,8,19);
-- BIOTH ABOVE QUERIES GIVE SAME RESULT

-- Q.1 FROM THE ACTOR TABLE GET THE FIRST NAME AND ACTOR ID WHOSE LAST NAME IS GENIOUS.
SELECT first_name, actor_id FROM actor WHERE last_name='GENIOUS';
-- Q.2 FROM THE ACTOR TABLE GET THE ACTOR ID AND THE FIRST NAME WHERE THE ACTOR ID IS FROM 3 TO 18
-- OR THE FIRST NAME SHOULD NOT BE ED
SELECT actor_id, first_name FROM actor WHERE actor_id BETWEEN 3 AND 18 OR first_name<>'ED';
-- Q.3 GET THE LAST NAME, ACTOR ID AND FIRST NAME WHERE THE FIRST NAME IS EITHER NICK OR GRACE
SELECT last_name, actor_id, first_name FROM actor WHERE first_name='NICK' OR first_name='GRACE';
-- Q.4 GET ALL THE COLUMNS WHERE THE ACTOR ID IS FROM 2 TO 6 OR ACTOR ID GREATER THAN 5
SELECT * FROM actor WHERE actor_id BETWEEN 2 AND 6 OR actor_id>5;
