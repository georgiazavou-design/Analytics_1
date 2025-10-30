select *
from {{ ref('fact_orders') }}
where  gross_sales < 0
