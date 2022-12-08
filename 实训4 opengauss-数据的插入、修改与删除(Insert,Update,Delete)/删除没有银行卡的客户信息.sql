-- 请用一条SQL语句删除client表中没有银行卡的客户信息：

/*DELETE
FROM client
WHERE NOT EXISTS
    (
        SELECT *
        FROM bank_card
        WHERE c_id=b_c_id
    );*/
    delete from client where c_id not in (select c_id from client join bank_card on c_id=b_c_id);


/* the end of your code */ 
