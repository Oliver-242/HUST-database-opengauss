-- 22) 查询购买了所有畅销理财产品的客户
--   请用一条SQL语句实现该查询：
select pro_c_id
from(select distinct pro_c_id,pro_pif_id from property where pro_type=1 
and pro_pif_id in (
select distinct pro_pif_id--查找所有畅销理财产品的id
from 
    (select distinct pro_c_id,pro_pif_id from property where pro_type=1) 
group by pro_pif_id
having count(*)>2
))a,
(
    select count(*)as sumid
    from(
        select distinct pro_pif_id--查找所有畅销理财产品的id
from 
    (select distinct pro_c_id,pro_pif_id from property where pro_type=1) 
group by pro_pif_id
having count(*)>2
    )
)b
group by pro_c_id,b.sumid
having count(*)=b.sumid;

--/*  end  of  your code  */
