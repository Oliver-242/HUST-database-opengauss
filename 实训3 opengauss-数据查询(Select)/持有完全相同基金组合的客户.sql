-- 16) 查询持有相同基金组合的客户对，如编号为A的客户持有的基金，编号为B的客户也持有，反过来，编号为B的客户持有的基金，编号为A的客户也持有，则(A,B)即为持有相同基金组合的二元组，请列出这样的客户对。为避免过多的重复，如果(1,2)为满足条件的元组，则不必显示(2,1)，即只显示编号小者在前的那一对，这一组客户编号分别命名为c_id1,c_id2。

-- 请用一条SQL语句实现该查询：


select c14.cid_1 as c_id1,c14.cid_2 as c_id2
from(
    select cid14 as cid_1,cid24 as cid_2
    from(
        select cid1 as cid14,cid2 as cid24,count(*) as cnt2
        from(
            select cid1,fid1,cid2
            from(
                select pro_c_id as cid1,f_id as fid1
                from fund,property
                where f_id=pro_pif_id and pro_type=3
                group by pro_c_id,f_id
                order by pro_c_id,f_id
            )fpp1
            join(
                select pro_c_id as cid2,f_id as fid2
                from fund,property
                where f_id=pro_pif_id and pro_type=3
                group by pro_c_id,f_id
                order by pro_c_id,f_id
            )fpp2
            on fpp1.cid1!=fpp2.cid2 and fpp1.fid1=fpp2.fid2
            where cid1<cid2
        )fp
        group by cid1,cid2
    )fpp4,
    (
        select pro_c_id as cid13, count(f_id) as cnt1 
        from fund,property
        where f_id=pro_pif_id and pro_type=3
        group by pro_c_id 
        order by pro_c_id
    )fpp3
    where cid13=cid14 and cnt1=cnt2
)c14,
(
    select cid14 as cid_1,cid24 as cid_2
    from(
        select cid1 as cid14,cid2 as cid24, count(*) as cnt2    from(  
            select cid1,fid1,cid2
            from(
                select pro_c_id as cid1, f_id as fid1 
                from fund, property
                where f_id=pro_pif_id and pro_type=3
                group by pro_c_id,f_id
                order by pro_c_id,f_id
                ) fpp1 
            join (
                select pro_c_id as cid2, f_id as fid2            
                from fund, property
                where f_id=pro_pif_id and pro_type=3
                group by pro_c_id,f_id
                order by pro_c_id,f_id
                ) fpp2 
            on fpp1.cid1!=fpp2.cid2 and fpp1.fid1=fpp2.fid2 
            where cid1<cid2)fp
            group by cid1,cid2
        ) fpp4, 
        (
            select pro_c_id as cid13,count(f_id) as cnt1            
            from fund, property
            where f_id=pro_pif_id and pro_type=3
            group by pro_c_id
            order by pro_c_id
        ) fpp3  
        where cid13=cid24 and cnt1=cnt2
)c24
where c14.cid_1=c24.cid_1 and c24.cid_2=c14.cid_2;




/*  end  of  your code  */
