select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode, 
o.ordersellingprice - o.ordercostprice as orderprofit ,
--from raw_customer
c.customername,
c.segment,
c.country,
-- from raw_product
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.cusotmerid=c.customerid
left join {{ ref('raw_products') }} as p
on o.productid=p.productid
