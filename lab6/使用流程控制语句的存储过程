-- 创建存储过程`sp_fibonacci(in m int)`，向表fibonacci插入斐波拉契数列的前m项，及其对应的斐波拉契数。fibonacci表初始值为一张空表。请保证你的存储过程可以多次运行而不出错。

create procedure sp_fibonacci(in m int)
as
    DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 1;
    DECLARE n INT DEFAULT 2;
    DECLARE temp INT DEFAULT 0;
begin

    IF m>0 THEN
        INSERT INTO fibonacci VALUES (0,0);
    END IF;

    IF m>1 THEN
        INSERT INTO fibonacci VALUES (1,1);
    END IF;

    WHILE m>n LOOP
        INSERT INTO fibonacci VALUES (n,a+b);
        temp := a+b;
        a:=b;
        b:=temp;
        n:=n+1;
    END LOOP;

end;
/
 

