#cursor = conn.cursor()
import pandas as pd
excel_data = pd.read_csv('/home/bruce/Downloads/weather.csv', index_col=False, delimiter = ',')

for row in excel_data.iterrows():
    print(row)
    # testlist = row[1].values
    # print(testlist)
    