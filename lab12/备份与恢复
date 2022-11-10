-- test1_1 --

# 你写的命令将在linux的命令行运行(test1_1.sh)
# 对数据库postgres作海量备份,备份至文件residents_bak.sql:

gs_dump -U gaussdb -W 'Passwd123@123'  -p 5432 residents -f residents_bak.tar -F t




-- test1_2 --
# 你写的命令将在linux的命令行运行(test1_2.sh)
# 利用备份文件residents_bak.sql还原数据库:

gs_restore -U gaussdb -W 'Passwd123@123' residents_bak.tar -p 5432 -d residents
