create database sale
 
use sale

CREATE TABLE sales (
  sale_id INT,
  salesperson_id INT,
  revenue DECIMAL(10,2)
);

INSERT INTO sales (sale_id, salesperson_id, revenue)
VALUES 
  (1, 1, 100.50),
  (2, 2, 75.00),
  (3, 1, 250.75),
  (4, 3, 500.00),
  (5, 2, 175.25),
  (6, 1, 350.00),
  (7, 2, 50.50),
  (8, 3, 150.00),
  (9, 1, 175.00),
  (10, 3, 300.25);

select * from sales

WITH sales_data AS (
  SELECT
    salesperson_id,
    SUM(revenue) as total_revenue
  FROM
    sales
  GROUP BY
    salesperson_id
)

SELECT
  salesperson_id,
  total_revenue,
  ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS row_number,
  RANK() OVER (ORDER BY total_revenue DESC) AS rank,
  DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS dense_rank
FROM
  sales_data
ORDER BY
  total_revenue DESC;
--- Eyosiyas Tibebu