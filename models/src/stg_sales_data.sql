with sales_data as(
    select * from {{ source('AIRBNB', 'sales_data') }}
)
select * from sales_data