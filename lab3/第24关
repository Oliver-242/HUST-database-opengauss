-- 24) 查询任意两个客户的相同理财产品数
--   请用一条SQL语句实现该查询：

select pro_c_id1 as pro_c_id,pro_c_id2 as pro_c_id,count(*) as total_count
from 
      (select pro_c_id as pro_c_id1,pro_pif_id as pro_pif_id1 from property where pro_type = 1)p1,
      (select pro_c_id as pro_c_id2,pro_pif_id as pro_pif_id2 from property where pro_type = 1)p2
where
      pro_c_id1 <> pro_c_id2
      and pro_pif_id1=pro_pif_id2
group by (pro_c_id1,pro_c_id2)
having total_count > 1;

--/*  end  of  your code  */
