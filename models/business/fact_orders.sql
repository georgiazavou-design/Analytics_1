{{ config(
    materialized='table',
    tags=['business']
) }}

with order_base as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.total_price,
        o.order_status,
        o.order_priority
    from {{ ref('trf_orders') }} o
),

line_base as (
    select
        l.order_id,
        l.part_id,
        l.supplier_id,
        l.quantity,
        l.gross_sales
    from {{ ref('trf_lineitem') }} l
)

select
    ob.order_id,
    ob.customer_id,
    ob.order_date,
    ob.total_price,
    ob.order_status,
    ob.order_priority,
    lb.part_id,
    lb.supplier_id,
    lb.quantity,
    lb.gross_sales,
    dp.part_name,
from order_base ob
left join line_base lb
    on ob.order_id = lb.order_id
left join {{ ref('dim_supplier') }} ds
    on lb.supplier_id = ds.supplier_id
left join {{ ref('dim_part') }} dp
    on lb.part_id = dp.part_id
left join {{ ref('dim_customer') }} cu
    on ob.customer_id = cu.customer_id

