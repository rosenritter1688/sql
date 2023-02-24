
# in windows

# from pandas 
# read csv import to mysql 

import mysql.connector as sql
import pandas as pd
from mysql.connector import Error


conn = sql.connect (
    host = "localhost",
    user = "root",
    password = "19821205",
    auth_plugin='mysql_native_password',
    buffered = True,          # using this for reading table, panda dont need it
    #multi=True,                 # if wanna use mulitple query
    database = "sql_fr_ai"
)

cursor = conn.cursor()
excel_data = pd.read_csv('D:/AI academic/教材とデータ/02.SQL/01.教材\DATA/holiday_master.csv', header=None,index_col=False, delimiter = ',')

#for row in excel_data.iterrows():
for row in excel_data.itertuples():
    # testlist = row[0] downloaded csv from big query. row[0]  is data that stores row number
    # therefore its useless
    testlist = row[1],row[2]
    
    #? checking content of row[1]
    # ['2020-09-22' 'Equinox Day']
    # ['2020-11-03' 'Culture Day']
    # ['2020-11-23' 'Labor Thanksgiving Day']
    print(testlist)

    cursor.execute('INSERT INTO holiday_master_hsuan (Date_YMD, Public_Holiday)'
                            'VALUES("%s","%s")' % tuple(testlist))
                   
conn.commit()
cursor.close()
conn.close()



