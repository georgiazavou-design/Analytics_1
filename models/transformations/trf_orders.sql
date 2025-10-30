{{ config(materialized='view') }}

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_priority,
    c.customer_name,
    c.nation_id,
    o.order_date,
    o.total_price
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c
  on o.customer_id = c.customer_id


--intermidiate dataset 