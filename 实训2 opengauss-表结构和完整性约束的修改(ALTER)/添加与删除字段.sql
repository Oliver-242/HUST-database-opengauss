----请在以下空白处添加适当的SQL代码，实现编程要求
----语句1：删除表orderDetail中的列orderDate
ALTER TABLE orderDetail DROP orderdate;
----语句2：添加列unitPrice
ALTER TABLE orderDetail ADD unitPrice numeric(10, 2);
