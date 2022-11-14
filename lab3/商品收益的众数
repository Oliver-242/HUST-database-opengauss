-- 6) 查询资产表中所有资产记录里商品收益的众数和它出现的次数。
--    请用一条SQL语句实现该查询：

SELECT pro_income, COUNT(pro_income) presence
FROM property
GROUP BY pro_income
HAVING COUNT(*) >= all(SELECT COUNT(*) FROM property GROUP BY pro_income);



/*  end  of  your code  */
