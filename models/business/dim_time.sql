WITH date_range AS (
    SELECT 
        DATEADD(day, SEQ4(), '2023-01-01') AS date
    FROM TABLE(GENERATOR(ROWCOUNT => 1500))  -- 1500 days ≈ 4 years
)

SELECT
    date AS date_id,
    date AS full_date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    DAY(date) AS day,
    QUARTER(date) AS quarter,
    DAYOFWEEK(date) AS day_of_week,
    CASE WHEN DAYOFWEEK(date) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend,
    TO_CHAR(date, 'Month') AS month_name,
    TO_CHAR(date, 'Day') AS day_name,
    DATE_TRUNC('month', date) AS month_start,
    DATE_TRUNC('quarter', date) AS quarter_start,
    DATE_TRUNC('year', date) AS year_start
FROM date_range
WHERE date <= '2025-12-31'
ORDER BY date
