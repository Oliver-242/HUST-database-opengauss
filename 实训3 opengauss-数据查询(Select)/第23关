     -- 23) 查找相似的理财产品
--   请用一条SQL语句实现该查询
select pro_pif_id,cc,prank
from
     (select pro_pif_id,count(*) as cc,dense_rank() over(order by cc desc) as prank
     from 
          (select * from property 
          where pro_type=1 
          and pro_pif_id in
               (select pro_pif_id
               from (select * from property where pro_type=1)
               where pro_pif_id <>14 and pro_c_id in
                    --购买14号理财产品前三名的人的id
                    (select pro_c_id 
                    from
                         (select pro_c_id,dense_rank() over(order by rk desc) as rank
                         --购买14号理财产品的人的id和排名
                         from 
                              --购买14号理财产品的人的id和买的数量
                              (select pro_c_id,count(*) as rk
                              from property
                              where pro_pif_id=14 and pro_type=1
                              group by (pro_c_id))p1
                         )p2
                    where rank<=3)
               )
          )
     group by (pro_pif_id)
     )
where prank<=3;
--/*  end  of  your code  */
