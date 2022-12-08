-- 11) 给出黄姓用户的编号、名称、办理的银行卡的数量(没有办卡的卡数量计为0),持卡数量命名为number_of_cards,
--     按办理银行卡数量降序输出,持卡数量相同的,依客户编号排序。
-- 请用一条SQL语句实现该查询：


SELECT c_id,c_name,COUNT(b_c_id) number_of_cards
FROM client LEFT OUTER JOIN bank_card ON(c_id=b_c_id)
WHERE c_name LIKE '黄%'
GROUP BY c_id
ORDER BY number_of_cards DESC, c_id









/*  end  of  your code  */ 
