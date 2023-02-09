import pymysql
#连接数据库
conn=pymysql.connect(host = '127.0.0.1' # 连接名称，默认127.0.0.1
,user = 'root' # 用户名
,passwd='19821205' # 密码
,port= 3306 # 端口，默认为3306
,db='sql_fr_ai' # 数据库名称
#,charset='utf8' # 字符编码
)
cur = conn.cursor() # 生成游标对象
sql="select * from `l_purchase` " # SQL语句
cur.execute(sql) # 执行SQL语句
data = cur.fetchall() # 通过fetchall方法获得数据
#for i in data[:2]: # 打印输出前2条数据
for i in data:
    print (i)
cur.close() # 关闭游标

conn.close() # 关闭连接



import mysql.connector as sql
import pandas as pd

# auth_plugin is needed, can check by commends 
# SELECT user,authentication_string,plugin,host FROM mysql.user;
# check the columns plugin and user

mydb = sql.connect (
    host = "localhost",
    user = "root",
    password = "19821205$",
    #auth_plugin='mysql_native_password',
    database = "sql_fr_ai",
    buffered = True             # Unread result found issue
)                                              # if using pandas no need to use buffer

print(mydb)
