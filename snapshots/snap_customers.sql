{% snapshot customers_snapshot %}

{{
    config(
        target_schema='analytics',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_name_upper', 'account_balance', 'nation_name', 'region_name']
    )
}}

select
    customer_id,
    customer_name_upper,
    account_balance,
    nation_name,
    region_name
from {{ ref('dim_customer') }}

{% endsnapshot %}
