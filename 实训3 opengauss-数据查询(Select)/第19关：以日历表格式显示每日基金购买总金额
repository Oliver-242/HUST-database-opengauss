-- 19) 以日历表格式列出2022年2月每周每日基金购买总金额，输出格式如下：
-- week_of_trading Monday Tuesday Wednesday Thursday Friday
--               1
--               2    
--               3
--               4
--   请用一条SQL语句实现该查询：

select mon.week_of_trading,Monday,Tuesday,Wednesday as wendnesday,Thursday,Friday
from
(select (date_part('week',pro_purchase_time)-5) as week_of_trading , 
sum(f_amount*pro_quantity) as Monday
from property, fund where pro_type=3 and pro_pif_id=f_id
and pro_purchase_time between '2022-2-1' and '2022-2-28'
group by pro_purchase_time
having to_char(pro_purchase_time,'dd')%7+1=1) mon left join

(select (date_part('week',pro_purchase_time)-5) as week_of_trading , 
sum(f_amount*pro_quantity) as Tuesday
from property, fund where pro_type=3 and pro_pif_id=f_id
and pro_purchase_time between '2022-2-1' and '2022-2-28'
group by pro_purchase_time
having to_char(pro_purchase_time,'dd')%7+1=2) tue 
on mon.week_of_trading= tue.week_of_trading
left join

(select (date_part('week',pro_purchase_time)-5) as week_of_trading , 
sum(f_amount*pro_quantity) as Wednesday
from property, fund where pro_type=3 and pro_pif_id=f_id
and pro_purchase_time between '2022-2-1' and '2022-2-28'
group by pro_purchase_time
having to_char(pro_purchase_time,'dd')%7+1=3) wed 
on mon.week_of_trading= wed.week_of_trading
left join

(select (date_part('week',pro_purchase_time)-5) as week_of_trading , 
sum(f_amount*pro_quantity) as Thursday
from property, fund where pro_type=3 and pro_pif_id=f_id
and pro_purchase_time between '2022-2-1' and '2022-2-28'
group by pro_purchase_time
having to_char(pro_purchase_time,'dd')%7+1=4) thu 
on mon.week_of_trading= thu.week_of_trading
left join

(select (date_part('week',pro_purchase_time)-5) as week_of_trading , 
sum(f_amount*pro_quantity) as Friday
from property, fund where pro_type=3 and pro_pif_id=f_id
and pro_purchase_time between '2022-2-1' and '2022-2-28'
group by pro_purchase_time
having to_char(pro_purchase_time,'dd')%7+1=5) fri
on mon.week_of_trading= fri.week_of_trading;

