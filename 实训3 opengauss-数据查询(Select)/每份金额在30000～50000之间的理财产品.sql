-- 5) 查询理财产品中每份金额在30000～50000之间的理财产品的编号,每份金额，理财年限，并按照金额升序排序，金额相同的按照理财年限降序排序。
--    请用一条SQL语句实现该查询：

SELECT p_id, p_amount, p_year
FROM finances_product
WHERE p_amount<=50000 AND p_amount>=30000
ORDER BY p_amount, p_year DESC;


/*  end  of  your code  */
