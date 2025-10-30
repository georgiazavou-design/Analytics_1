{{ config(materialized='table') }}

select
    c.customer_id,
    {{ convert_to_upper("customer_name") }} as customer_name_upper,
    c.account_balance,
    c.nation_name,
    c.region_name
from {{ ref('trf_customers') }} c
