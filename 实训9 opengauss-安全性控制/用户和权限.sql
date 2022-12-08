-- 请填写语句，完成以下功能：
--(1) 创建用户tom和jerry，初始密码均为'123456'；
CREATE USER tom WITH PASSWORD 'hust_1234';
CREATE USER jerry WITH PASSWORD 'hust_1234';

--(2) 授予用户tom查询客户的姓名，邮箱和电话的权限,且tom可转授权限；
GRANT SELECT(c_name,c_phone,c_mail) ON client TO tom WITH GRANT OPTION;
--(3) 授予用户jerry修改银行卡余额的权限；
GRANT UPDATE(b_balance) ON bank_card TO jerry;
--(4) 收回用户Cindy查询银行卡信息的权限。
REVOKE SELECT ON bank_card FROM Cindy;
