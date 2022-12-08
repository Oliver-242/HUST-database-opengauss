 请给出ER图文件存放的URL:
https://github.com/Oliver-242/HUST-database-opengauss/blob/main/%E5%AE%9E%E8%AE%AD13%20opengauss-%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1%E4%B8%8E%E5%AE%9E%E7%8E%B0/ersolution.jpg
 以下给出关系模式：
顾客(c_ID, name, type, phone), primary key:(c_ID);
电影票(ticket_ID, seat_num, schedule_ID), primary key(ticket_ID), foreign key(schedule_ID);
排场(schedule_ID, date, time, price, number, movie_ID, hall_ID), primary key:(schedule_ID), foreign key(movie_ID, hall_ID);
放映厅(hall_ID, mode, capacity, location), primary key:(hall_ID);
电影(movie_ID, title, type, runtime, release_date, director, starring), primary key:(movie_ID);
