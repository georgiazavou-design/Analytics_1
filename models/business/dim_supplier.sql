{{ config(materialized='table') }}

select
    supplier_id,
    {{ convert_to_upper('supplier_name') }} as supplier_name_upper,
    account_balance,
    nation_name,
    region_name
from {{ ref('trf_supplier') }}
