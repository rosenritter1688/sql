
# in windows

# from pandas 
# read csv import to mysql 

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
df = pd.read_csv('/home/bruceashbee/Downloads/L_PURCHASE.csv', index_col=False, delimiter = ',')

n = 0
for row in df.iterrows():
    testlist = row[1].values
    print(tuple(testlist))
    cursor.execute("INSERT INTO L_Purchase (date,p_code,quantity)"
                   " VALUES('%s','%s','%s')" %tuple(testlist))
    n += 1
    print(f"{ n } record inserted")
conn.commit()
cursor.close()
conn.close()









