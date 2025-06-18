with
    stok_data as (
        select product_id, sum(stock_quantity) as total_stock
        from {{ ref("stg_inventory_data") }}
        group by product_id
    ),
    sale_data as (
        select product_id, sum(sale_quantity) as total_sales
        from {{ ref("stg_sales_data") }}
        group by product_id
    )
select
    std.product_id,
    std.total_stock,
    sadt.total_sales,
    (std.total_stock - sadt.total_sales) as diff
from stok_data as std
join sale_data as sadt on std.product_id = sadt.product_id
