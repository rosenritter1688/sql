
import pandas as pd
import pymysql
from sqlalchemy import create_engine

cnx = create_engine('mysql://root:ZAQs8271911c@127.0.0.1/sql_intro')    
df = pd.read_sql('SELECT * FROM employees', cnx) #read the entire table
