-- 创建包含所有保险资产记录的详细信息的视图v_insurance_detail，包括购买客户的名称、客户的身份证号、保险名称、保障项目、商品状态、商品数量、保险金额、保险年限、商品收益和购买时间。
-- 请用1条SQL语句完成上述任务：

CREATE VIEW v_insurance_detail
AS
SELECT c_name,c_id_card,i_name,i_project,pro_status,pro_quantity,i_amount,i_year,pro_income,pro_purchase_time
FROM client,insurance,property
WHERE pro_type='2' AND c_id=pro_c_id AND pro_pif_id=i_id;



/*   end  of your code  */
