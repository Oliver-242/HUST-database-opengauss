-- 13) 综合客户表(client)、资产表(property)、理财产品表(finances_product)、
--     保险表(insurance)、基金表(fund)和投资资产表(property)，
--     列出所有客户的编号、名称和总资产，总资产命名为total_property。
--     总资产为储蓄卡余额，投资总额，投资总收益的和，再扣除信用卡透支的金额
--     (信用卡余额即为透支金额)。客户总资产包括被冻结的资产。
--    请用一条SQL语句实现该查询：
select c_id,c_name,coalesce(bc_cx_property,0)-coalesce(bc_xy_property,0)+coalesce(total_income,0)+coalesce(total_amount,0) as total_property

from client left outer join
    (
        select b_c_id as bc_cx_id,sum(b_balance) as bc_cx_property
        from bank_card
        where b_type='储蓄卡'
        group by b_c_id
    ) as cx on(bc_cx_id = c_id)
    left outer join
    (
        select b_c_id as bc_xy_id,sum(b_balance) as bc_xy_property
        from bank_card
        where b_type='信用卡'
        group by b_c_id
    ) as xy on(bc_xy_id = c_id)
    left outer join
    (
        select pro_c_id as pro_sy_id,sum(pro_income) as total_income
        from property
        group by pro_c_id
    ) as sy on(pro_sy_id = c_id)
    left outer join
    (
        select c_id as pro_amount_id,coalesce(sum(total),0) as total_amount
        from client left outer join
        (
            select pro_c_id,sum(pro_quantity*p_amount) as total
            from property left outer join finances_product on(pro_pif_id = p_id)
            where pro_type=1
            group by pro_c_id

            union all

            select pro_c_id,sum(pro_quantity*i_amount) as total
            from property left outer join insurance on(pro_pif_id = i_id)
            where pro_type=2
            group by pro_c_id

            union all

            select pro_c_id,sum(pro_quantity*f_amount) as total
            from property left outer join fund on(pro_pif_id = f_id)
            where pro_type=3
            group by pro_c_id
        ) as P on (c_id = pro_c_id)
        group by c_id
    ) as amount on(pro_amount_id = c_id)

order by c_id;

