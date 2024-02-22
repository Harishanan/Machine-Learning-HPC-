import requests

url = 'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=GBP&apikey=2HQRY5N3I5MPMIDO'
r = requests.get(url)
data = r.json()

print(data)