import pandas as pd
import pyodbc

conn = pyodbc.connect(
    'Driver={SQL Server};'
    'Server=DESKTOP-BHCBB4T\MYSERVER;'
    'Database=sql_fr_ai;'
    'Trusted_Connection=yes;'
)

cursor = conn.cursor()
df = pd.read_csv(r'E:\order_report_2.csv', index_col=False, delimiter = ',')

n = 0
for row in df.itertuples():
    cursor.execute('''
                INSERT INTO order_report_2 ( order_id, date_ymd, taste, amount)
                VALUES (?,?,?,?)
                ''',
                row.order_id, 
                row.date_ymd,
                row.taste,
                row.amount
                )
    n+=1
    print(f"{ n } record inserted")
conn.commit()





