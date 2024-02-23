import requests
import pandas as pd

file_path='data.csv'
url = 'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=GBP&apikey=2HQRY5N3I5MPMIDO'
r = requests.get(url)
data = r.json()

time_series = data.get('Time Series (Digital Currency Daily)')

#converting csv to dataframe
df = pd.DataFrame(time_series).T

# Save the DataFrame to a CSV file
df.to_csv('data.csv', index=True)

print("Data saved to data.csv")