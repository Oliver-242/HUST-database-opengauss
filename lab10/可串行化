-- 事务1:

set session transaction isolation level read committed;
start transaction;
select pg_sleep(2);
insert into result
select *, 1 t from ticket where flight_no = 'MU2455';

insert into result
select *,1 t from ticket where flight_no = 'MU2455';
commit;



-- 事务2:
set session transaction isolation level read committed;
start transaction;
--select pg_sleep(1);
update ticket set tickets = tickets - 1 where flight_no = 'MU2455';
commit;

