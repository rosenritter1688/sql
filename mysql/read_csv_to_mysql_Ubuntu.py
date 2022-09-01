

#---- using file Tran.csv create table user_tran
# 
# create table user_tran(
# 			user_id varchar(15),
#             date_buy date,
#             category varchar(20),
#             amount int);
# import mysql.connector as sql
# import pandas as pd
# from mysql.connector import Error


# conn = sql.connect (
#     host = "localhost",
#     user = "root",
#     password = "ZAQs8271911c$",
#     auth_plugin='mysql_native_password',
#     buffered = True,          # using this for reading table, panda dont need it
#     #multi=True,                 # if wanna use mulitple query
#     database = "sql_fr_ai"
# )

# cursor = conn.cursor()
# df = pd.read_csv('/home/bruceashbee/Downloads/Tran.csv', index_col=False, delimiter = ',')
# # 
# n = 0
# for row in df.iterrows():
#     testlist = row[1].values
#     print(tuple(testlist))
#     cursor.execute("INSERT INTO user_tran (user_id,date_buy,category,amount)"
#                    " VALUES('%s','%s','%s','%s')" %tuple(testlist))
#     n += 1
#     print(f"{ n } record inserted")
# conn.commit()
# cursor.close()
# conn.close()



# ----------------------------------------------------------------- for shop_user table using User.csv file
# create table shop_user (
# 		user_id varchar(15) primary key,
#         age int,
#         gender varchar(1),
#         sports int,
#         WatchingSports int,
#         travel int,
#         mobility int,
#         reading int,
#         music int,
#         movie int,
#         computer int,
#         game int,
#         gamble int)
import mysql.connector as sql
import pandas as pd
from mysql.connector import Error


conn = sql.connect (
    host = "localhost",
    user = "root",
    password = "ZAQs8271911c$",
    auth_plugin='mysql_native_password',
    buffered = True,          # using this for reading table, panda dont need it
    #multi=True,                 # if wanna use mulitple query
    database = "sql_fr_ai"
)

cursor = conn.cursor()
df = pd.read_csv('/home/bruceashbee/Downloads/User.csv', index_col=False, delimiter = ',')
# 
n = 0
for row in df.iterrows():
    testlist = row[1].values
    print(tuple(testlist))
    cursor.execute("INSERT INTO shop_user (user_id,age,gender,sports,WatchingSports,travel,mobility,reading,music,movie,computer,game,gamble)"
                   " VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" %tuple(testlist))
    n += 1
    print(f"{ n } record inserted")
conn.commit()
cursor.close()
conn.close()


































