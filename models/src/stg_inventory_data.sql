with inv_data as(
    select * from {{ source('AIRBNB', 'inventory_data') }}
)
select * from inv_data