select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode, 
o.ordersellingprice - o.ordercostprice as orderprofit ,
--from raw_customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw_product
p.productid,
p.category,
p.productname,
p.subcategory,
{{markup('ordersellingprice','ordercostprice')}} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.cusotmerid=c.customerid
left join {{ ref('raw_products') }} as p
on o.productid=p.productid

{{limit_data_in_dev('orderdate')}}