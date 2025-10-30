select *
from {{ ref('stg_customer') }}
where account_balance < 0
