
SELECT *
FROM {{ ref('orders') }}
WHERE order_date < '1991-01-01'
   OR order_date > '2025-12-31'
