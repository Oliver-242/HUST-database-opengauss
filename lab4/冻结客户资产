-- 请用一条update语句将手机号码为“13686431238”的这位客户的投资资产(理财、保险与基金)的状态置为“冻结”。：

UPDATE property
SET pro_status='冻结'
WHERE pro_c_id IN
    (
        SELECT c_id
        FROM client
        WHERE c_phone='13686431238'
    );


/* the end of your code */
