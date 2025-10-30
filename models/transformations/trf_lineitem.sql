{{ config(materialized='view') }}

select
    l.order_id,
    l.line_number,
    {{ calculate_gross_sales('l.extended_price', 'l.discount', 'l.tax') }} as gross_sales,
    l.part_id,
    l.supplier_id,
    l.quantity
from {{ ref('stg_lineitem') }} l
