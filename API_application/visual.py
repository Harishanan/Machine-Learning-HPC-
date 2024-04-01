from pandas_datareader import data
import matplotlib.pyplot as plt
import pandas as pd
import datetime as dt
import urllib.request, json
import os
import numpy as np
import tensorflow as tf 
from sklearn.preprocessing import MinMaxScaler

file_path='data.csv'
#All this stuff were committed for don't call the API
#url = 'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=GBP&apikey=2HQRY5N3I5MPMIDO'
#r = requests.get(url)
#data = r.json()

#time_series = data.get('Time Series (Digital Currency Daily)')

#converting csv to dataframe
#df = pd.DataFrame(time_series).T

# Save the DataFrame to a CSV file
#df.to_csv('data.csv', index=True)

#print("Data saved to data.csv")


BTC_data= pd.read_csv(file_path)#,index_col='Unnamed: 0', parse_dates=True) # Recongize first column as a date
#BTC_data.index.freq='D' #Dealing with dayily data
BTC_data= BTC_data.sort_values('Unnamed: 0') #Unamed: is the name of the date column

#print(BTC_data.head()) # print first 5 rows

#plt.figure(figsize = (18,9))
#plt.plot(range(BTC_data.shape[0]),(BTC_data['3a. low (GBP)']+BTC_data['2a. high (GBP)'])/2.0)
#plt.xticks(range(0,BTC_data.shape[0],75),BTC_data['Unnamed: 0'].loc[::75],rotation=45)
#plt.xlabel('Date',fontsize=18)
#plt.ylabel('Mid Price',fontsize=18)
#plt.show()

# Calculate the mid prices from the highest and lowest
high_prices = BTC_data.loc[:, '2a. high (GBP)'].to_numpy()
low_prices = BTC_data.loc[:, '3a. low (GBP)'].to_numpy()
mid_prices = (high_prices + low_prices) / 2.0


data_size = len(mid_prices)  

# Calculate split indices
train_size = int(0.7 * data_size)  # 70% for training
validation_size = int(0.1 * data_size)  # 10% for validation
# The test size is implicitly the remaining 20%

# Split the data
train_data = mid_prices[:train_size]
validation_data = mid_prices[train_size:train_size + validation_size]
test_data = mid_prices[train_size + validation_size:]

# Scale the data to be between 0 and 1
scaler = MinMaxScaler()
train_data = train_data.reshape(-1,1)
validation_data= validation_data.reshape(-1,1)
test_data = test_data.reshape(-1,1)

# Train the Scaler with training data and smooth data
# Set the size of the smoothing window to 250 data points.
smoothing_window_size = 250

# Loop through the training data in increments of the smoothing window size.
for di in range(0, train_size, smoothing_window_size):
    # Calculate the end index for the current smoothing window. It is the minimum between
    # the start index + smoothing window size and the total size of the training set.
    # This ensures we don't go past the end of the training data.
    end_index = min(di + smoothing_window_size, train_size)
     # Fit the scaler only to the data within the current window.
    scaler.fit(train_data[di:end_index,:])
     # Transform the data within the current window using the scaler fitted to this window.
    train_data[di:end_index,:] = scaler.transform(train_data[di:end_index,:])


#Normalize the last bit of remaining data
if end_index < train_size:
    scaler.fit(train_data[end_index:,:])
    train_data[end_index:,:] = scaler.transform(train_data[end_index:,:])
# Reshape both train and test data
train_data = train_data.reshape(-1)

# Normalize test data
test_data = scaler.transform(test_data).reshape(-1)


# Perform exponential moving average smoothing
# So the data will have a smoother curve than the original ragged data
EMA = 0.0
gamma = 0.1
for ti in range(len(train_data)):
  EMA = gamma*train_data[ti] + (1-gamma)*EMA
  train_data[ti] = EMA

# Used for visualization and test purposes
all_mid_data = np.concatenate([train_data,test_data],axis=0)

# Calculate Standard Average
window_size = 20
N = train_data.size
std_avg_predictions = []
std_avg_x = []
mse_errors = []

for pred_idx in range(window_size,N):

    if pred_idx >= N:
        date = dt.datetime.strptime(k, '%Y-%m-%d').date() + dt.timedelta(days=1)
    else:
        date = BTC_data.loc[pred_idx,'Unnamed: 0']

    std_avg_predictions.append(np.mean(train_data[pred_idx-window_size:pred_idx]))
    mse_errors.append((std_avg_predictions[-1]-train_data[pred_idx])**2)
    std_avg_x.append(date)

print('MSE error for standard averaging: %.5f'%(0.5*np.mean(mse_errors)))

 #Plottinng MSE prediction vs real 
#plt.figure(figsize = (18,9))
#plt.plot(range(len(all_mid_data)), all_mid_data, color='b', label='True')
#plt.plot(range(window_size, window_size + len(std_avg_predictions)), std_avg_predictions, color='orange', label='Prediction')
#plt.xlabel('Date')
#plt.ylabel('Mid Price')
#plt.legend(fontsize=18)
#plt.show()


#Calculate exponetial moving average 
window_size = 100
N = train_data.size

run_avg_predictions = []
run_avg_x = []

mse_errors = []

running_mean = 0.0
run_avg_predictions.append(running_mean)

decay = 0.5

for pred_idx in range(1,N):

    running_mean = running_mean*decay + (1.0-decay)*train_data[pred_idx-1]
    run_avg_predictions.append(running_mean)
    mse_errors.append((run_avg_predictions[-1]-train_data[pred_idx])**2)
    run_avg_x.append(date)

print('MSE error for EMA averaging: %.5f'%(0.5*np.mean(mse_errors)))


#Ploting EMA prediction vs real

plt.figure(figsize = (18,9))
plt.plot(range(len(all_mid_data)),all_mid_data,color='b',label='True')
plt.plot(range(0,N),run_avg_predictions,color='orange', label='Prediction')
#plt.xticks(range(0,df.shape[0],50),df['Date'].loc[::50],rotation=45)
plt.xlabel('Date')
plt.ylabel('Mid Price')
plt.legend(fontsize=18)
plt.show()