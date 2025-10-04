
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
