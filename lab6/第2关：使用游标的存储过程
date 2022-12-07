
-- 编写一存储过程，自动安排某个连续期间的大夜班的值班表:

create procedure sp_night_shift_arrange(in start_date date, in end_date date)
AS
declare now_date date := start_date;
declare leader_name char(30);
declare leader_adjustment int := 0;
declare d_name char(30);
declare n_name1 char(30);
declare n_name2 char(30);
declare d_type int := 0;
declare cursor d_cursor for select e_name,e_type from employee where e_type != 3;
declare cursor n_cursor for select e_name from employee where e_type = 3;
begin
    open d_cursor;
    open n_cursor;
    fetch d_cursor into d_name,d_type;
    fetch n_cursor into n_name1;
    fetch n_cursor into n_name2;
    select e_name into leader_name from employee where e_type = 1;
    while now_date <= end_date loop
        if d_type = 1 and (extract(dow from cast(now_date as timestamp)) = 0 or extract(dow from cast(now_date as timestamp)) = 6) then
            leader_adjustment := 1;
            fetch d_cursor into d_name,d_type;
            if d_cursor%notfound then
                close d_cursor;
                open d_cursor;
                fetch d_cursor into d_name,d_type;
            end if;
            insert into night_shift_schedule values(now_date,d_name,n_name1,n_name2);
            now_date := now_date + 1;
            fetch d_cursor into d_name,d_type;
            if d_cursor%notfound then
                close d_cursor;
                open d_cursor;
                fetch d_cursor into d_name,d_type;
            end if;
            fetch n_cursor into n_name1;
            if n_cursor%notfound then
                close n_cursor;
                open n_cursor;
                fetch n_cursor into n_name1;
            end if;
            fetch n_cursor into n_name2;
            if n_cursor%notfound then
                close n_cursor;
                open n_cursor;
                fetch n_cursor into n_name2;
            end if;
        elseif extract(dow from cast(now_date as timestamp)) = 1 and leader_adjustment = 1 then
            leader_adjustment := 0;
            insert into night_shift_schedule values(now_date,leader_name,n_name1,  n_name2);
            now_date := now_date + 1;
            fetch n_cursor into n_name1;
            if n_cursor%notfound then
                close n_cursor;
                open n_cursor;
                fetch n_cursor into n_name1;
            end if;
            fetch n_cursor into n_name2;
            if n_cursor%notfound = true then
                close n_cursor;
                open n_cursor;
                fetch n_cursor into n_name2;
            end if;
        else 
            insert into night_shift_schedule values(now_date,d_name,n_name1,n_name2);
            now_date := now_date + 1;
            fetch d_cursor into d_name,d_type;
            if d_cursor%notfound then
                close d_cursor;
                open d_cursor;
                fetch d_cursor into d_name,d_type;
            end if;
            fetch n_cursor into n_name1;
            if n_cursor%notfound then
                close n_cursor;
                open n_cursor;
                fetch n_cursor into n_name1;
            end if;
            fetch n_cursor into n_name2;
            if n_cursor%notfound then
                close n_cursor;
                open n_cursor;
                fetch n_cursor into n_name2;
            end if;
        end if;
    end loop;


end;


/*  end  of  your code  */ 
