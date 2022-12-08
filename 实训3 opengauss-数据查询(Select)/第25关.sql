       -- 25) 查找相似的理财客户
--   请用一条SQL语句实现该查询：

select * from
(
       select pro_c_id1 as pac,pro_c_id2 as pbc,count(*) as common,rank() over(partition by pac order by common desc,pbc) as crank
       from 
       (select pro_c_id as pro_c_id1,pro_pif_id as pro_pif_id1 from property where pro_type = 1)p1,
       (select pro_c_id as pro_c_id2,pro_pif_id as pro_pif_id2 from property where pro_type = 1)p2
       where
       pro_c_id1 <> pro_c_id2
       and pro_pif_id1=pro_pif_id2
       group by (pro_c_id1,pro_c_id2)
)
where crank <3;

--/*  end  of  your code  */
