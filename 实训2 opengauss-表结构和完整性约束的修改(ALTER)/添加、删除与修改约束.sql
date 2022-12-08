---请在以下空白处填写适当的诘句，实现编程要求。
---(1) 为表Staff添加主码
ALTER TABLE Staff ADD PRIMARY KEY(staffNo);
---(2) Dept.mgrStaffNo是外码，对应的主码是Staff.staffNo,请添加这个外码，名字为FK_Dept_mgrStaffNo:
ALTER TABLE Dept ADD CONSTRAINT FK_Dept_mgrStaffNo FOREIGN KEY(mgrStaffNo) REFERENCES Staff(staffNo);
---(3) Staff.dept是外码，对应的主码是Dept.deptNo. 请添加这个外码，名字为FK_Staff_dept:
ALTER TABLE Staff ADD CONSTRAINT FK_Staff_dept FOREIGN KEY(dept) REFERENCES Dept(deptNo);
---(4) 为表Staff添加check约束，规则为：gender的值只能为F或M；约束名为CK_Staff_gender:
ALTER TABLE Staff ADD CONSTRAINT CK_Staff_gender CHECK(gender IN ('F', 'M'));
---(5) 为表Dept添加unique约束：deptName不允许重复。约束名为UN_Dept_deptName：
ALTER TABLE Dept ADD CONSTRAINT UN_Dept_deptName UNIQUE(deptName);
