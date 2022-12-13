-- 事务1（采用事务隔离级别- read committed）:
set session transaction isolation level repeatable read;

-- 开启事务
start transaction;

-- 第1次查询余票超过300张的航班信息
insert into result
select *,1 t from ticket where tickets > 300;

-- 修改航班MU5111的执飞机型为A330-300：
update ticket set aircraft = 'A330-300' where flight_no = 'MU5111'; 
-- 第2次查询余票超过300张的航班信息
select pg_sleep(2);

insert into result
select *,2 t from ticket where tickets > 300;
commit;



-- 事务2（采用事务隔离级别- read committed）:
set session transaction isolation level repeatable read;

-- 开启事务
start transaction;

select  pg_sleep(1);
insert into ticket values('MU5111','A330-200',311);
commit;

