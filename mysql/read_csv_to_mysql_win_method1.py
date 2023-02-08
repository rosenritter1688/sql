
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
excel_data = pd.read_csv('/home/bruce/Downloads/order_report_2.csv', index_col=False, delimiter = ',')

for row in excel_data.iterrows():
    # testlist = row[0] downloaded csv from big query. row[0]  is data that stores row number
    # therefore its useless
    testlist = row[1].values
    print(testlist)
    cursor.execute("INSERT INTO order_report_2 (order_id,date_ymd,taste,amount)"
                   " VALUES('%s','%s','%s','%s')" % tuple(testlist))
                   
conn.commit()
cursor.close()
conn.close()



