-- 7) 查询身份证隶属武汉市没有买过任何理财产品的客户的名称、电话号、邮箱。
--    请用一条SQL语句实现该查询：

SELECT c_name,c_phone,c_mail
FROM client
WHERE LEFT(c_id_card,4)='4201' AND
    c_id NOT IN
    (
        SELECT pro_c_id
        FROM property
        WHERE pro_type='1'
    );



/*  end  of  your code  */
