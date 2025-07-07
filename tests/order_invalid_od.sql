with invalid_orders as (
    select *
    from {{ ref('stg_orders') }}
    where CHAR_LENGTH(order_id) < 10
)
select count(*)
from invalid_orders
having count(*) > 0