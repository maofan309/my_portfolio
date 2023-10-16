-- Create and insert values for Table1
CREATE TABLE IF NOT EXISTS customers (
  id int,
  name text,
  gender text
);

-- Insert values into the customers table
INSERT INTO customers VALUES
(1, 'Karina', 'F'),
(2, 'Paul', 'M'),
(3, 'Hyojoo', 'F'),
(4, 'Marc', 'M'),
(5, 'Irene', 'F'),
(6, 'Taeyeon', 'F');

-- Create and insert values for Table2
CREATE TABLE menus (
  menu_id int,
  menu_name text,
  no_times_ordered int,
  price real
);

-- Insert values into the menus table
INSERT INTO menus values
  (1, 'Tom Yum Kung', 2 , 14.50 ),
  (2, 'Bibimbap', 6 , 8.60 ),
  (3, 'Sushi', 10 , 5.50 ),
  (4, 'Ramen', 1 , 8.50 ),
  (5, 'Sasimi', 8 , 10.80 );

-- Create and insert values for Table3
CREATE TABLE receipt (
  receipt_id int,
  Date_ordered date,
  Total_value real,
  customer_id int,
  menu_id int
);

-- Insert values into the receipt table
INSERT INTO receipt values
  (1, '2023-08-05', 14.50, 3, 1 ),
  (2, '2022-07-29', 14.50, 2, 1 ),
  (3, '2023-07-07', 5.50, 5, 3 ),
  (4, '2022-03-09', 8.60, 6, 2 ),
  (5, '2021-10-12', 14.50, 1, 5 ),
  (6, '2022-11-08', 8.50, 4, 4 ),
  (7, '2022-03-05', 10.80, 6, 5 );

-- Aggregate
-- This query calculates the average spending, revenue, minimum spending, and maximum spending for each menu item
SELECT menu_id,
  AVG(Total_value) AS average_spending,
  SUM(Total_value) AS revenue,
  MIN(Total_value) AS min_spending,
  MAX(Total_value) AS max_spending
FROM receipt
GROUP BY menu_id
ORDER BY revenue DESC;

-- JOIN 3 Tables
-- This query joins the receipt, customers, and menus tables to get a list of all receipts, with the customer name and menu name included
SELECT receipt.*, customers.name, menus.menu_name
FROM receipt
JOIN customers ON receipt.customer_id = customers.id
JOIN menus ON menus.menu_id = receipt.menu_id;

-- Subquery
-- This query creates a subquery to select all menu items that cost more than $10. The subquery is then used to select the price and menu name for each expensive menu item.
SELECT price,
  menu_name
FROM (SELECT menu_name, price FROM menus
WHERE price > 10
) AS expensive_menu;

-- WITH (Common expression table)
-- This query creates two common expression tables (CTEs) to store the results of the following queries:
--
-- CTE1: Selects all female customers
-- CTE2: Selects all receipts where the total value is greater than $7
--
-- The two CTEs are then joined to select the name, date ordered, and menu name for all female customers who have ordered food that costs more than $7.
WITH sub1 AS (
SELECT * FROM customers WHERE gender = 'F'
),
sub2 AS (
SELECT * FROM receipt
WHERE Total_value > 7
)
