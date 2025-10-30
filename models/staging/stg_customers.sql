{{ config(materialized='table') }}

select
    c_custkey as customer_id,
    c_name as customer_name,
    c_address as  customer_address,
    c_phone as phone,
    c_mktsegment as market_segment,
    c_nationkey as nation_id,
    c_acctbal as account_balance
from {{ source('tpch_sf1', 'customer') }}
