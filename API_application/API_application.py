import requests
import matplotlib.pyplot as plt
import pandas as pd
import os

crypto ="BTC"
currency="GBP"
file_path='data.csv'
url = 'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=%s&market=%s&apikey=2HQRY5N3I5MPMIDO'%(crypto,currency)

if not os.path.exists(file_path): 
    r = requests.get(url)
    data = r.json()
    time_series = data.get('Time Series (Digital Currency Daily)')
    #converting csv to dataframe
    df = pd.DataFrame(time_series).T
    # Save the DataFrame to a CSV file
    df.to_csv('data.csv', index=True)
    print("Data saved to data.csv")
else: 
    print("File already exists.")

