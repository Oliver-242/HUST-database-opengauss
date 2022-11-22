  -- 20) 查询销售总额前三的理财产品
--   请用一条SQL语句实现该查询：

select pyear,rank as rk,p_id,sumamount
from(
  (
  select  pyear,rank,p_id,sumamount
  from(
    select pyear,rank()over(order by sumamount desc),p_id,sumamount
from (
  select to_char(pro_purchase_time,' yyyy') as pyear,p_id,(p_amount*pro_quantity)as sumamount
  from finances_product,property
  where pro_type=1 and pro_pif_id=p_id and pyear=2010
) 
order by rank
  )
  where rank<=3
)

union
(
  select  pyear,rank,p_id,sumamount
  from(
    select pyear,rank()over(order by sumamount desc),p_id,sumamount
from (
  select to_char(pro_purchase_time,' yyyy') as pyear,p_id,(p_amount*pro_quantity)as sumamount
  from finances_product,property
  where pro_type=1 and pro_pif_id=p_id and pyear=2011
) 
order by rank
  )
  where rank<=3
)

)



--/*  end  of  your code  */
