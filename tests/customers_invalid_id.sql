with invalid_id as (
    select *
    from {{ ref('stg_customers') }}
    where CHAR_LENGTH(customer_id) < 10
)
select count(*)
from invalid_id
having count(*) > 0