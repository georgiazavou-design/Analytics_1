{% snapshot suppliers_snapshot %}

{{
    config(
        target_schema='analytics',
        unique_key='supplier_id',
        strategy='check',
        check_cols=['supplier_name_upper', 'account_balance', 'nation_name', 'region_name']
    )
}}

select
    supplier_id,
    supplier_name_upper,
    account_balance,
    nation_name,
    region_name
from {{ ref('dim_supplier') }}

{% endsnapshot %}
