{% snapshot parts_snapshot %}

{{
    config(
        target_schema='analytics',
        unique_key='part_id',
        strategy='check',
        check_cols=['part_name', 'manufacturer', 'brand', 'part_type', 'part_size', 'retail_price']
    )
}}

select
    part_id,
    part_name,
    manufacturer,
    brand,
    part_type,
    part_size,
    retail_price
from {{ ref('dim_part') }}

{% endsnapshot %}
