[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/vcAhwuzK)
# ELEE1119 Advantage Computer Engineering 2023

## Introduction
---todo


## Step 1: Define Requirements

1. Purpose of the HPC System
2. Performance Requirements
   Determine the performance specifications required for the applications, including processing power, memory, storage, and interconnectivity.

## Step 2: Hardware Components

1. Motherboards
2. Single board computers
3. Processor (CPU)
   Select CPUs based on performance requirements. Consider multi-core processors for parallel processing.
4. Memory (RAM)
   Choose sufficient RAM for each node to handle the workload efficiently.
5. Storage:
   Decide on the storage configuration, considering the need for fast access times. SSDs are commonly used for HPC systems.
6. Network Interconnect:
   Choose a high-speed network interconnect, such as InfiniBand or 10/25/40/100 Gigabit Ethernet, depending on your needs.
   ### Interconnect
         --Cluster Network is two or more computing device working together for a common computing purpose. This Network follows the principle of the parallel processing. Parallel processing is the method of using two or more processors(CPUs) to handle seperate chuncks of a same complex tasks.
      
      In today's time, most computer have multi-cores (i.e., anywhere from two to tewelve cores) which follows the concept of parallel processing. These multi-cores set-ups are similar to having seperate processors installed in a same computer, which can executes more tasks than a single-core processors. In HPC, this concept is extended to multiple nodes, each equipped with its own set of processors where large computational tasks is broken down into smaller sub-tasks that can be executed simultaneously by multile processor at a same time. 

      High-Speed interconnect are crucial for High-Performance Computer(HPC), as we want high data analysis and transfer rate between two nodes to move large amount of data quickly. Along with data transfer, low latency is equally imporatant in HPC, to minimize the time it takes for data to travel between different components of the system. If designing  stock prediction system, developing accurate models often requires extensive training and optimization processes. High-speed interconnects facilitate the rapid exchange of information during these iterative processes, allowing the model to be trained and refined more quickly. 

      There are several interconnect technologies available with their own strength and specefic use-cases. Some of them are :
      
      1. **Infiniband** : Computer Networking communication standard used in high-performance computing that features high throughput and very low latency. It supports Remote Direct Memory Access(RDMA), which means the ability to access host memory directly without CPU intervention. Infiniband is widely used in supercomputer clusters and it is preferred network interconnection technology for GPU servers.
      2. **NVIDIA NVLink** : World's first high-speed GPU interconnect technology that can connect two graphics card , with low latency, and high bandwidth. It is ideal for the system that uses NVIDIA graphics card, such as those in deep-learning and GPU accelerated computing. It is not best option for our project,as it is only compatible with NVIDIA graphics card and we will be using intel graphics card for our HPC.
      3. **Intel Omni-Path Architecture(OPA)** : OPA is communication architecture developed by intel which aims for low communication latency, low power consumption and a high throughput. It is often used for HPC application with Intel processor. OPA directly competes with infiniband.
      4. **Ethernet** : Ethernet is one of the commonly used interconnect technology because of its versatility, scalability and compatibility.It migh not provide same low-latency level as specialised interconnect like infiniband but it provides various speed, ranging from 10 megabyte to 100 gigabyte per second.    

      The type of interconnect technology one needs lies on what kind of system they are building and what kind of interconnect is compatible with the system. For our system, specefication and hardware is given above.


# Install Operating System in Head Node
Initially, an attempt was made to determine which operating system the ASUS CS-B motherboard supports. However, the information available suggests that the ASUS CS-B is only compatible with Ubuntu 13.10, as indicated in the provided image.
![Os](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/3f1fbdae-3522-4e26-841c-ef19f4888d5a)
Figure: OS Compatibility of Asus CS-B 

1. Once the operating system was determined, below steps are followed to install ubuntu desktop 13.10:
      - Downloaded the Ubuntu Desktop from the official Ubuntu website (https://old-releases.ubuntu.com/releases/13.10/). As Intel processor is used, PC (Intel x86) desktop image is chosen when downloading the image.
      - Created a bootable USB drive using Rufus.
      - Booted the motherboard from the USB drive.
      - Followed the installation wizard to install Ubuntu Desktop on the system.

2. After the installation process, the system undergoes a series of commands to ensure it possesses the latest security patches and software updates:

                                                                  `(sudo apt update
                                                                                                                                          
                                                                  sudo apt upgrade)`

3. Given its role as the head node in our setup, the desktop image is transformed into a server. Let's quickly delve into the significance of the head node within the realm of High-Performance Computing (HPC).

- The head node serves as a central control unit in an HPC environment, orchestrating and managing the entire cluster. Its primary purposes include task scheduling, resource allocation, and overall coordination of computational tasks within the cluster. By installing      the Ubuntu Server and setting the default target to multi-user mode optimize resource allocation, conserving RAM and CPU resources by eschewing unnecessary graphical sessions. This ensures that the head node operates efficiently, enabling it to efficiently manage and    oversee the computational workload of the entire HPC cluster.
  
                                                To install Ubuntu Server  : (`sudo apt install ubuntu-server`)
                                                To disable GUI            : (`sudo systemctl set-default multi-user.target`)
     
Although the documentation states that the ASUS CS-B motherboard can only run Ubuntu 13.10, a brief test was run to see how the motherboard would react to installing Ubuntu 22.04 (Jammy Jellyfish), a more recent version of the operating system. The Ubuntu 22.04       
operating system ran on the system very well, with no noticeable glitches. This surprising finding prompted more investigation into the motherboard's compatibility with the latest Ubuntu versions. 
Although documentation indicates otherwise, one plausible explanation for Ubuntu 22.04's successful running on the ASUS CS-B motherboard could be the hardware compatibility enhancements included in later Ubuntu editions. The Ubuntu operating system is continuously       improved and optimised by its developers throughout time to improve compatibility with a wider variety of hardware setups. Because of this, more recent versions of Ubuntu might by nature support a greater range of motherboards, including the ASUS CS-B. Moreover,         improvements in system libraries, kernel updates, and device drivers in Ubuntu 22.04 can also be responsible for its smooth operation on the ASUS CS-B motherboard. These updates might take care of any compatibility problems that earlier motherboard models might have     had, making it possible to use current Ubuntu editions more smoothly.
After noticing that Ubuntu 22.04 operated steadily on the ASUS CS-B motherboard, the group chose to switch from Ubuntu 13.10 to this more recent version. This choice was driven by the goal of utilising Ubuntu 22.04's most recent software features, security updates,      and hardware compatibility changes to provide the best possible computing environment for the team's activities.

# Install Operating System in Compute Node
The process of installing the operating system on a compute node is similar to that of the head node, with the exception that it is not required the installation of Ubuntu Server specifically.


# Creatting Machine Learning for predict cryptocurrency

## Libraries and Modules Documentation


### Core Python Libraries

- **`array`**: Provides space-efficient storage of basic C-style data types. Used for specific low-level data operations.
- **`math`**: Essential for advanced mathematical operations, such as square roots or logarithms, beyond basic arithmetic.

### Data Manipulation and Analysis

- **`pandas`** (`pd`): A pivotal library for data manipulation and analysis, ideal for working with structured data.
- **`numpy`** (`np`): The foundational package for numerical computing in Python, supporting array operations, mathematical functions, and more.
- **`statistics`**: Offers functions for calculating mathematical statistics of numeric (real-valued) data.

### Machine Learning and Neural Networks

- **`sklearn.preprocessing.MinMaxScaler`**: Scales features to a specified range, usually between zero and one, crucial for many machine learning algorithms.
- **`keras.models.Sequential`**: Allows for easy assembly of models where each layer has exactly one input tensor and one output tensor.
- **`keras.layers`**: Contains various neural network layers, including:
  - **`Dense`**: Standard fully connected neural network layer.
  - **`LSTM`** (Long Short-Term Memory): A type of RNN layer important for sequence prediction problems.
  - **`GRU`** (Gated Recurrent Unit): A streamlined version of LSTM, faster to train but similarly effective for sequence data.
  - **`Dropout`**: Helps prevent overfitting by randomly setting input units to 0 at each update during training time.

### Data Visualization

- **`matplotlib.pyplot`** (`plt`): A comprehensive library for creating static, animated, and interactive visualizations in Python.

### Financial Data

- **`yfinance`** (`yf`): Enables access to Yahoo Finance's market data, useful for obtaining historical financial data for analysis.

### Date and Time Management

- **`datetime`**: Provides classes for manipulating dates and times, crucial for managing time series data effectively.

### Performance Metrics

- **`sklearn.metrics`**: Includes various metrics for evaluating the performance of machine learning models, such as:
  - **`mean_squared_error, mean_absolute_error`**: Quantify the average errors between predicted and actual values.
  - **`explained_variance_score, r2_score`**: Assess the explanatory power of regression models.
  - **`mean_poisson_deviance, mean_gamma_deviance`**: Evaluate models for count data and positive continuous data, respectively.
  - **`accuracy_score`**: Measure the accuracy of classification models.

These libraries collectively support the processes of data preparation, modeling, evaluation, and visualization for this ML.

```bash 

# -*- coding: cp1252 -*-
from array import array
from ast import mod
from pickletools import optimize
import math
from sklearn.metrics import mean_squared_error, mean_absolute_error, explained_variance_score, r2_score 
from sklearn.metrics import mean_poisson_deviance, mean_gamma_deviance, accuracy_score
from statistics import mode
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
from keras.models import Sequential
from keras.layers import Dense, LSTM, GRU
from keras.layers import Dropout
import yfinance as yf
from datetime import datetime, timedelta

```
## Getting Data
The initial step in creating a Machine Learning model involves accessing historical data for the cryptocurrencies that will be utilised for making predictions. Initially, the use of an API to access this historical data was contemplated. However, due to the constraints imposed by APIs, the decision was ultimately made to employ data available from Yahoo Finance. This platform facilitates the acquisition of historical datasets for the most significant cryptocurrencies. For this project, data pertaining to Bitcoin and Ethereum will be used.

## Processing the data
To process the data, the pandas library is being utilised, which will enable us to manipulate the data as desired.

``` bash
self.BTC_data= pd.read_csv(file_path,index_col='Date', parse_dates=['Date'], dayfirst=True)
```
`pd.read_csv()`: This function is pandas' workhorse for loading CSV files. It's versatile and powerful, allowing for fine-tuning of the data ingestion process.

`index_col='Date'`: By setting the Date column as the index, you transform the dates into the DataFrame's row labels, making time-series data manipulation more intuitive.

`parse_dates=['Date']`: This ensures the 'Date' column is treated as datetime objects, not strings, unlocking time-sensitive methods and functionality.

`dayfirst=True`: This parameter is crucial for correctly interpreting dates when the day precedes the month in your data source, avoiding common pitfalls in date parsing.

In order to facilitate predictions based on the Bitcoin dataset, parameters such as the high price and volume will be selected. However, since these may not be sufficient for accurate forecasting, technical indicators will also be incorporated to enhance the predictive capability.


## Technincal Indicators
The technical indicators RSI, EMA, SMA and MACD are generally used for financial analysis to understand market dynamics and generate trading signals. Those indicators will help ML model to identify complex patterns

### Simple Moving Average (SMA)
 The average price of a security or asset over a given length of time, it is determined by summing up the prices for a given number of periods and dividing those values by the same number of periods. Can assist in identifying both 11 short-term and long-term trends in the data

 $$
\text{SMA} = \frac{\sum_{i=1}^{N} P_i}{N}
$$

  Where:

  - $N$ is the number of periods used in the calculation.
  -  $P$<sub>i</sub> denotes the price of the asset at period $i$.



### The Exponential Moving Average (EMA) 
IT is a type of moving average that places a greater weight and significance on the most recent data points. It is also referred to as the exponentially weighted moving average. EMAs are commonly used to gauge the direction of the trend in the prices of financial assets such as stocks or cryptocurrencies.
$$
\text{EMA}_{\text{today}} = (\text{Price}_{\text{today}} \times \text{K}) + (\text{EMA}_{\text{yesterday}} \times (1 - \text{K}))
$$

where:

- $\text{Price}_{\text{today}}$ is the current closing price,
- $\text{EMA}_{\text{yesterday}}$ is the previous EMA value,
- $K$ is the smoothing factor, calculated as $K = \frac{2}{(N+1)}$,
- $N$ is the number of periods.

In simpler terms:

$$
\text{EMA} = \text{Current Price} \times \text{Smoothing Factor} + \text{EMA}_{\text{previous day}} \times (1 - \text{Smoothing Factor})
$$

EMA involves two main components: the smoothing factor and the previous EMA value. The smoothing factor determines the weightage given to the most recent data point and is typically derived from a specified time period or the number of data points. Since it places more emphasis on recent data, the EMA reacts more quickly to price changes compared to the SMA.

### The Moving Average Convergence Divergence (MACD)
 MACD is a trend-following momentum indicator that shows the relationship between two moving averages of a security’s price. The MACD is calculated by subtracting the 26-period Exponential Moving Average (EMA) from the 12-period EMA.


 $$
\text{MACD} = \text{EMA}_{12} - \text{EMA}_{26}
$$


where:

- $\text{EMA}_{12}$ :  The 12-period exponential moving average of the closing prices.
- $\text{EMA}_{26}$: The 26-period exponential moving average of the closing prices.

### The Relative Strength Index (RSI)
RSI a momentum oscillator that measures the speed and change of price movements. The RSI oscillates between zero and 100 and is typically used to identify overbought or oversold conditions in trading assets, indicating a potential reversal in price.

The RSI is calculated using the following formula:

$$
\text{RSI} = 100 - \frac{100}{1 + \text{RS}}
$$

Where RS (Relative Strength) is the average gain of the up periods divided by the average loss of the down periods over the specified time frame.

$$
\text{RS} = \frac{\text{Average Gain over N periods}}{\text{Average Loss over N periods}}
$$



### Intregation of technical indicators 
To add those indiciators  to our dataset will be use function that will make all the calculations required and added to our orginal data set.


```bash
 def technical_indicators(self,dataset):
           
            # Create MACD
            
             dataset['26ema'] = dataset['Price'].ewm(span=26).mean()
             dataset['12ema'] = dataset['Price'].ewm(span=12).mean()
             dataset['MACD'] = dataset['12ema']-dataset['26ema']

            
    
            # Create Exponential moving average
               dataset['ema'] = dataset['Price'].ewm(com=0.5).mean()
    
           

            # Calculate RSI
            delta = dataset['Price'].diff(1)
            gain = (delta.where(delta > 0, 0)).rolling(window=14).mean()
            loss = (-delta.where(delta < 0, 0)).rolling(window=14).mean()

            RS = gain / loss
            RSI = 100 - (100 / (1 + RS))

            dataset['RSI'] = RSI


             
            # Calculate SMA (Simple Moving Average)
               dataset['SMA30'] = dataset['Price'].rolling(window=30).mean()  # 30-day SMA
               dataset['SMA21'] = dataset['Price'].rolling(window=21).mean()  # 21-day SMA, if needed

            
            return dataset

```
After integreating the all technical indicators the next step will be to scale and split the data.

## Scalign and Splitting
### Scaling features
First, the feautes price, volumen and all the previus technical  are extracted form the DataFrame and then, scaled independently using the MinMaxScaler from the scikit-learn library. This scaler transforms each feature by scaling it to a given range, here defaulting to [0, 1], which is the typical range for MinMaxScaler without specifying any arguments. This normalization step is crucial for neural network models to converge more quickly and efficiently during training.

```bash

    # Separate the features
   prices = self.BTC_data[['Price']].values
   volumes = self.BTC_data[['Volume'].values
   EMA = self.BTC_data[['ema']].values
   SMA= self.BTC_data[['SMA30']].values
   RSI=self.BTC_data[['RSI']].values
   MACD=self.BTC_data[['MACD']].values

   # Scale each feature independently
   scaler_price = MinMaxScaler()
   scaler_volume = MinMaxScaler()
   scaler_EMA = MinMaxScaler()
   scaler_SMA= MinMaxScaler()
   scaler_RSI= MinMaxScaler()
   scaler_MACD= MinMaxScaler()

   prices_scaled = scaler_price.fit_transform(prices)
   volumes_scaled = scaler_volume.fit_transform(volumes)
   EMA_scaled = scaler_EMA.fit_transform(EMA)
   SMA_scaled = scaler_SMA.fit_transform(SMA)
   RSI_scaled= scaler_RSI.fit_transform(RSI)
   MACD_scaled=scaler_MACD.fit_transform(MACD)


```

After scaling, all features are concatenated horizontally (axis=1) to form a single array, scaled_features, where each row represents a timestamp, and each column represents a scaled feature.

```bash
# Concatenate the scaled features
caled_features = np.concatenate([prices_scaled, volumes_scaled, EMA_scaled,SMA_scaled,RSI_scaled,MACD_scaled], axis=1)
```

### Spliting the Dataset
#### Setting Parameters
Now is required to prepare the scaled features for training, validation, and testing by splitting the dataset according to specified ratios.
For that task it is goin to set:
- `time_step`: This parameter specifies the window size for each input sequence to the model. In this context, a time_step of 60 means that each input sequence will consist of data from 60 consecutive time steps.
- `num_features`: Indicates the number of features used in the dataset, which is 6 in this case. 
  
- `split_ratio`: A dictionary that defines the proportion of the dataset to be used for training, validation, and testing. Here, 60% of the data is allocated for training, 20% for validation, and the remaining 20% for testing.

####  Trimming the Dataset
To ensure that the dataset can be divided evenly by the `time_step`,  the code trims the dataset to a size that is divisible by 60. This step ensures that every sequence used for training or testing is complete and contains exactly 60 time steps.
```bash
trimmed_size = len(scaled_features) - (len(scaled_features) % time_step)
trimmed_data = scaled_features[:trimmed_size]
```

#### Calculate Spliting Indices
```bash
train_size = int(trimmed_size * split_ratio['train'])
validation_size = int(trimmed_size * split_rati['validation'])
test_size = trimmed_size - train_size - validation_size
```


The dataset is split into training, validation, and test sets using the calculated sizes:
```bash
train_data = scaled_features[:train_size]
validation_data = scaled_features[train_size:train_size + validation_size]
test_data = scaled_features[-test_size:]
```

- `train_data`: Used for training the model.
- `validation_data`: Used for validating the model's performance during training.
- `test_data`: Used for evaluating the model's performance on unseen data.

Once all these paramters has been defines everthing is ready to split de dataset, for this purpose it is going to be used the function `create_dataset` :
```bash
 def create_dataset(self,data, time_step):
            X, Y = [], []
            for i in range(len(data) - time_step):
               X.append(data[i:(i + time_step), :])
               Y.append(data[i + time_step, 0]) 
            
               return np.array(X), np.array(Y)
```
This method iterates over the data array, constructing input sequences (X) and the corresponding labels (Y) for the model:

Input Sequences (X): For each iteration i, a slice of the data array from i to `i + time_step` is taken. This slice represents a sequence of `time_step` consecutive time steps, which serves as one input example for the model. These sequences are appended to the list `X`.

Labels (Y): The label for each input sequence is the value immediately following the sequence in the dataset. Specifically, `data[i + time_step, 0]` is used as the label for the sequence ending at `i + time_step - 1`. This means the model is trained to predict the next value in the series based on the preceding `time_step` values. The labels are appended to the list `Y`.







  







  
## References
1. https://hpc.uni.lu/infrastructure/network
2. https://dlcdnimgs.asus.com/websites/global/aboutASUS/OS/Linux_Status_report_202312.pdf
3. 

## Authors


