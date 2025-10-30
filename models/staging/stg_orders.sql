{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

with existing as (
    select coalesce(max(order_date), '1900-01-01') as max_order_date
    from {{ this }}
)

select
    o_orderkey       as order_id,
    o_custkey        as customer_id,
    o_orderstatus    as order_status,
    o_totalprice     as total_price,
    o_orderdate      as order_date,
    o_orderpriority  as order_priority,
    o_clerk          as clerk_name
from {{ source('tpch_sf1', 'orders') }}
{% if is_incremental() %}
where o_orderdate > (select max_order_date from existing)
{% endif %}
