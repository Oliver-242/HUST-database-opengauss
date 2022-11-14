-- 8) 查询持有两张(含）以上信用卡的用户的名称、身份证号、手机号。
--    请用一条SQL语句实现该查询：

SELECT c_name,c_id_card,c_phone
FROM client
WHERE c_id IN
    (
        SELECT b_c_id
        FROM bank_card
        WHERE b_type='信用卡'
        GROUP BY b_c_id HAVING count(*)>=2
    );




/*  end  of  your code  */
