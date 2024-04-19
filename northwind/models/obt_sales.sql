with f_sales as (
    select * from {{ ref('fact_sales') }}
),
d_product as (
    select * from {{ ref('dim_product') }}
)
select 
    f.productid,
    d.productkey,
    f.quantity, 
    f.extendedpriceamount, 
    f.discountamount, 
    f.soldamount
from f_sales as f
left join d_product as d on f.productid = d.productid
