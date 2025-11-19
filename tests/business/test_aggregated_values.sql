-- Fails if total gross sales for any month are zero or negative
SELECT DATE_TRUNC('month', order_date) AS month, SUM(gross_sales) AS total_gross_sales
FROM {{ ref('fact_orders') }}
GROUP BY DATE_TRUNC('month', order_date)
HAVING SUM(gross_sales) <= 0
