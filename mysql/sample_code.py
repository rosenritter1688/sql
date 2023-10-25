# from pandas 
# read csv import to mysql 

import mysql.connector as sql
from mysql.connector import Error
import pandas as pd
conn = sql.connect (
    host = "localhost",
    user = "hsuan",
    password = "Zs8271911c",
    auth_plugin='mysql_native_password',
    buffered = True,          # using this for reading table, panda dont need it
    #multi=True,                 # if wanna use mulitple query
    database = "sql_fr_ai"
)


empdata = pd.read_csv(
    '/home/bruce/Downloads/holiday_master.csv', 
    index_col=False, 
    delimiter = ','
    )



cursor = conn.cursor()
for row in empdata.iterrows():
    record = row[1].values
    cursor.execute('INSERT INTO holiday_master (Date_YMD, Public_Holiday )VALUES ("%s","%s")'%tuple(record) )
    print("Record inserted")
    # the connection is not auto committed by default, so we must commit to save our changes
    conn.commit()
    

