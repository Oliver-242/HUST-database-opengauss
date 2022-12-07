 -- 12) 综合客户表(client)、资产表(property)、理财产品表(finances_product)、保险表(insurance)和
 --     基金表(fund)，列出客户的名称、身份证号以及投资总金额（即投资本金，
 --     每笔投资金额=商品数量*该产品每份金额)，注意投资金额按类型需要查询不同的表，
 --     投资总金额是客户购买的各类资产(理财,保险,基金)投资金额的总和，总金额命名为total_amount。
 --     查询结果按总金额降序排序。
 -- 请用一条SQL语句实现该查询：

SELECT c_name,c_id_card,COALESCE(SUM(totalmon),0) AS total_amount
FROM client LEFT OUTER JOIN 
    (
        SELECT pro_c_id,SUM(pro_quantity*p_amount) AS totalmon
        FROM property LEFT OUTER JOIN finances_product ON(pro_pif_id=p_id)
        WHERE pro_type='1'
        GROUP BY pro_c_id

        UNION ALL

        SELECT pro_c_id,SUM(pro_quantity*i_amount) AS totalmon
        FROM property LEFT OUTER JOIN insurance ON(pro_pif_id=i_id)
        WHERE pro_type='2'
        GROUP BY pro_c_id

        UNION ALL

        SELECT pro_c_id,SUM(pro_quantity*f_amount) AS totalmon
        FROM property LEFT OUTER JOIN fund ON(pro_pif_id=f_id)
        WHERE pro_type='3'
        GROUP BY pro_c_id
    ) ON(c_id=pro_c_id)
GROUP BY c_id
ORDER BY total_amount DESC;





/*  end  of  your code  */ 
