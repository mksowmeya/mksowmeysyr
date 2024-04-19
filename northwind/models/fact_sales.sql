with stg_sales as 
(
    select
        productid,
        {{ dbt_utils.generate_surrogate_key(['productid']) }} as productkey,
        quantity,
        quantity * unitprice as extendedpriceamount,
        quantity * unitprice * discount as discountamount,
        quantity * unitprice * (1 - discount) as soldamount
    from {{source('northwind','Order_Details')}}
)
select
    s.*
from stg_sales s