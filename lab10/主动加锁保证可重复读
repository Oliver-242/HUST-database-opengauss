-- 事务1: 
select  pg_sleep(1);
set session transaction isolation level read committed;
start transaction;
-- 第1次查询航班'MU2455'的余票
select tickets from ticket where flight_no = 'MU2455' for share;
select pg_sleep(5);
-- 第2次查询航班'MU2455'的余票
select tickets from ticket where flight_no = 'MU2455' for share;
commit;
-- 第3次查询所有航班的余票，发生在事务2提交后
select pg_sleep(1);
select * from ticket  order by flight_no;




-- 事务2:
set session transaction isolation level read uncommitted;
start transaction;
select pg_sleep(2);
--在事务1的第1，2次查询之间，试图出票1张(航班MU2455)：
update ticket set tickets = tickets - 1 where flight_no = 'MU2455';
commit;

