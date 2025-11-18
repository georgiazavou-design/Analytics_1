{{ config(
    materialized='incremental'
) }}

with existing as (
    {% if is_incremental() %}
    select coalesce(max(order_date), '1900-01-01') as max_order_date
    from {{ this }}
    {% else %}
    select '1900-01-01'::date as max_order_date
    {% endif %}
)

select
    o_orderkey       as order_id,
    o_custkey        as customer_id,
    o_orderstatus    as order_status,
    o_totalprice     as total_price,
    o_orderdate      as order_date,
    o_orderpriority  as order_priority,
    o_clerk          as clerk_name
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.orders
{% if is_incremental() %}
where order_date > (select max_order_date from existing)
{% endif %}
