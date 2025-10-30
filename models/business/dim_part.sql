{{ config(materialized='table') }}

select
    part_id,
    part_name,
    manufacturer,
    brand,
    part_type,
    part_size,
    retail_price
from {{ ref('stg_part') }}
