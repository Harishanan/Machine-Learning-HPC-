## Abstract
## Introduction

## 1. System Design And Architecture
--- Design the architecture, integrating 14 ASUS CS-8 motherboards and single-board computers. Provide critical reflections on the chosen design.
## 2. Technology Research: 
--- Conduct comprehensive research on HPC technologies, power management, non-volatile storage, and RAM. Justify technology choices based on problem domain appropriateness. 

### Power Management

   Following a thorough examination of individual components, research has been conducted to determine the optimal power distribution among them. Initially, the plan was to utilize two 750W Power Supply Units (PSUs). However, due to technical malfunctions in one of the PSUs, the decision has been made to employ smaller PSUs for each motherboard separately. The power consumption of each hardware component is provided below for reference.
  
   |      Components        |     Power Consumption (approx)       |       Description        |
   |------------------------|-----------------------------|--------------------------|
   |Asus CS-B Intel Core i3 4th Gen | 25W - 40W       | CPU Power Management can be handeled directly from BIOS. It provides subitems that allows to manipulate the CPU ratio and feature.|
   |SAMSUNG V-NAND 500GB SSD| 3W (Active), 50mW (idle)|Each Motherboard will be connected to one of this SSD which can be powered by a same PSU.|  
   |NVIDIA QUADRO           |    45W (Max.)           |Only one of the GPU will be used in the entire system which will be connected to the head node. |        

   |Power Supply Unit (PSU)| Capacity | Description|
   |---|---|---|
   |FSP220-50LC|220W (total output) | This PSU has a maximum wattage of 60W. And the sum of the power requirements for all the components connected to the PSU should not exceed 220W. |

* The single PSU in our system will be connected to one motherboard, one SSD, and one graphics card. The combined power consumption of these components is estimated to be around 95W during active use and less than 90W when in idle state. Although a single 220W PSU could theoretically handle the load for two motherboards, practical constraints like cable and port limitations restrict each PSU to power only one motherboard in our setup


## 3. System Construction:
--- Assemble the HPC system, implementing power management and resource-efficient configurations. Configure non-volatile storage and RAM to meet performance requirements. 
## 4. Housing and Cooling Solutions: 
-- Design and implement housing/structure using laser cutting or additive manufacturing. Discuss convection principles (natural and forced) for cooling. 
## 5. Operating System Selection: 
-- Choose an operating system (e.g., Linux- Ubuntu or declarative system- NixOS). Justify the choice based on task requirements and overall design. 
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

# SLURM Configuration

SLURM, an acronym for Simple Linux Utility for Resource Management, is an open-source workload manager developed for supercomputers and Linux-based cluster systems. It offers three primary functions: 

1. It allocates both exclusive and non-exclusive access to compute node resources from a central head node, allowing tasks to be executed efficiently.
2. It furnishes a structured framework for initiating, executing, and overseeing tasks across a designated set of allocated nodes.
3. It resolves resource contention by administering a queue of pending work, ensuring fair access to resources among multiple users or processes.  

The primary commands for submitting, allocating, and monitoring jobs in SLURM are outlined as follows:

1. **sbatch**: Employed to submit batch jobs, allowing users to send job requests to the SLURM scheduler. Job parameters and requirements are defined within a job script, and SLURM schedules and executes the job accordingly.

2. **salloc**: Facilitates interactive resource allocation, enabling users to acquire compute resources in real-time. Once resources are allocated, users can execute commands within this dedicated resource environment.

3. **srun**: Used to execute parallel tasks within allocated resource environments, whether obtained interactively through `salloc` or as part of a batch job submitted with `sbatch`. It manages the execution of parallel tasks across specified nodes.

4. **squeue**: Utilized for monitoring the status of jobs in the SLURM job queue, providing details such as job ID, user, status, and resource utilization. This allows users to monitor job progress and identify queued or running jobs.

5. **scancel**: Enables users to terminate running or queued jobs within the SLURM job queue by specifying the job ID(s) of the targeted jobs to be canceled.

6. **scontrol**: Used for modifying or querying the configuration and state of the SLURM cluster, granting users the ability to manage SLURM resources by configuring nodes, partitions, and accounts, as well as accessing information about jobs and nodes.

These commands serve as essential tools for effectively interacting with SLURM and managing job execution on high-performance computing clusters.

**SLURM CONFIGURATION IN HEAD NODE**
---
To begin configuring Slurm on the head node, the initial step involves defining and exporting an environment variable representing the user ID (UID) for the 'munge' group. This variable serves as a placeholder for the UID that will later be assigned to the 'munge' group. Additionally, a user account named 'munge' is established. MUNGE is employed as the default authentication mechanism. This process is accomplished using the following command:

      export MUNGEUSER=1001 
      sudo groupadd -g $MUNGEUSER munge 
      sudo useradd -m -c "MUNGE Uid 'N' Gid Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge -s /sbin/nologin munge 

Likewise, an environment variable for SLURM is established, exported, and associated with the SLURM group. Concurrently, a user account named 'slurm' is created. This process is executed using the following command:

      export SLURMUSER=1002 
      sudo groupadd -g $SLURMUSER slurm 
      sudo useradd -m -c "SLURM workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm -s /bin/bash slurm

Finally MUNGE is installed using the following command:

      sudo apt-get install -y munge 

Upon installing MUNGE, ownership and permissions for MUNGE across various parts of the system are modified to "munge:munge". This task is accomplished using the following command:

      sudo chown -R munge: /etc/munge/ /var/log/munge/ /var/lib/munge/ /run/munge/
      sudo chmod 0700 /etc/munge/ /var/log/munge/ /var/lib/munge/ /run/munge/

Following the configuration of MUNGE, the munge.key file is copied to the `/nfs/slurm` directory. This action facilitates the utilization of the same munge key for authentication purposes on the client node. The command utilized for this step is:

      sudo scp /etc/munge/munge.key /nfs/slurm/

MUNGE services can be enabled and started utilising following command:

      sudo systemctl enable munge
      sudo systemctl start munge

After setting up MUNGE, the following command can be used to check the status of MUNGE:

      sudo systemctl status munge 

After configuring MUNGE, the next step involves downloading a database server that will store job history and scheduling reports. For this project, Mariadb is chosen due to its simplicity in configuration. The following command is utilized to download the Mariadb server:

      sudo apt-get install mariadb-server

In addition to installing the mariadb-server, the Slurm Database Daemon and Slurm-wlm are also installed using the following command:

      sudo apt-get install slurmdbd
      sudo apt-get install slurm-wlm

The database is configured to grant permissions to the 'localhost'. Furthermore, a Slurm database is created to store all the logs of Slurm activities. Following command can be employed to achieve this process:

      mysql
      grant all on slurm_acct_db.* TO 'slurm'@'localhost' identified by 'toor' with grant option; 
      create database slurm_acct_db;
      exit

 Once the database is configured, the slurmdbd.conf file is created. The following line can be used to make slurmdbd.conf file.

      sudo nano /etc/slurm/slurmdbd.conf

The database configuration file should contain the following line of code:

      AuthType=auth/munge
      DbdAddr=localhost
      #DbdHost=headnode
      DbdHost=localhost
      DbdPort=6819
      SlurmUser=slurm
      DebugLevel=4
      LogFile=/var/log/slurm/slurmdbd.log
      PidFile=/run/slurm/slurmdbd.pid
      StorageType=accounting_storage/mysql
      StorageHost=localhost
      StorageLoc=slurm_acct_db
      StoragePass=toor
      StorageUser=slurm
      ###Setting database purge parameters
      PurgeEventAfter=12months
      PurgeJobAfter=12months
      PurgeResvAfter=2months
      PurgeStepAfter=2months
      PurgeSuspendAfter=1month
      PurgeTXNAfter=12months
      PurgeUsageAfter=12months
 
 Required Ownership and Permission should be give to the conf file.
      chown slurm:slurm /etc/slurm/slurmdbd.conf
      chmod -R 600 slurmdbd.conf
 
  The Slurm configuration file can be generated based on the system requirements using the provided link: [Slurm Configuration Generator](https://slurm.schedmd.com/configurator.html).

The following command can be used to create the configuration file and place it inside the /etc/slurm/ directory

      sudo nano /etc/slurm/slurm.conf 
      (Add the configuration file which is created using the link)

The firewall is deactivated to enable inbound traffic on ports 6817, 6818, and 6819 using the following command:

      sudo ufw allow 6817
      sudo ufw allow 6818
      sudo ufw allow 6819

Directories are created to store logs and reports generated by SLURM. Subsequently, permissions and ownership are adjusted accordingly.

      mkdir /var/spool/slurmctld
      chown slurm:slurm /var/spool/slurmctld
      chmod 755 /var/spool/slurmctld

      mkdir  /var/log/slurm
      touch /var/log/slurm/slurmctld.log
      touch /var/log/slurm/slurm_jobacct.log /var/log/slurm/slurm_jobcomp.log
      chown -R slurm:slurm /var/log/slurm/
      chmod 755 /var/log/slurm



After completing the configuration of SLURM on the Head Node, following commands is utilised to enable and start all the necessary SLURM services:

      systemctl daemon-reload
      systemctl enable slurmdbd
      systemctl start slurmdbd
      systemctl enable slurmctld
      systemctl start slurmctld

Lastly, following command is employed to check the status of the SLURM services:

      systemctl status slurmdbd
      systemctl status slurmctld
**SLURM CONFIGURATION IN CLIENT NODE**
--
The process of configuring SLURM on the client node closely resembles that of the head node, with the primary distinction being the absence of the need to set up a database. Similar to the head node, MUNGE must be configured by creating MUNGE and SLURM groups, as well as MUNGE and SLURM users. Following this setup, MUNGE should be installed. The following command is employed to accomplish these tasks:

      export MUNGEUSER=1001 
      $ sudo groupadd -g $MUNGEUSER munge 
      $ sudo useradd -m -c "MUNGE Uid 'N' Gid Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge -s /sbin/nologin munge 
      $ export SLURMUSER=1002 
      $ sudo groupadd -g $SLURMUSER slurm 
      $ sudo useradd -m -c "SLURM workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm -s /bin/bash slurm
      sudo apt-get install -y munge

Now, the munge.key file, previously copied to `/nfs/slurm`, can be further distributed to each client node by copying it to `/etc/munge/`. This can be achieved using the following command:

      sudo scp /nfs/slurm/munge.key /etc/munge/
      sudo chown munge:munge /etc/munge/munge.key
      sudo chmod 400 /etc/munge/munge.key

Once the key has been copied and permissions have been adjusted, the MUNGE service is ready to be enabled and started. This task can be accomplished using the following command:

      sudo systemctl enable munge
      sudo systemctl start munge

After setting up Munge, SLURM should be installed in the compute node. To install SLURM on the compute node, you can use the following command:

      sudo apt-get install slurm-wlm

For compute node, the same configuration file should be used as headnode. Therefore, all the configuration file from headnode must be copied to `/nfs/slurm`, which then can be copied to `/etc/slurm/` directory in compute node. 

**Copying `slurm.conf` and `slurmdbd.conf` to `/nfs/slurm` directory in headnode** 

      sudo scp /etc/slurm/slurm.conf /nfs/slurm/
      sudo scp /etc/slurm/slurmdbd.conf /nfs/slurm/

**Copying `slurm.conf` and `slurmdbd.conf` from  `/nfs/slurm` to `/etc/slurm/` directory in compute node**

      sudo scp /nfs/slurm/slurm.conf /etc/slurm
      sudo scp /nfs/slurm/slurmdbd.conf /etc/slurm

Once all the configuration files are copied, the following commands are used to set up the required directories and log files for SLURM, ensuring ownership and permissions are appropriately configured to collect SLURM messages.

      mkdir /var/spool/slurmd 
      chown slurm: /var/spool/slurmd
      chmod 755 /var/spool/slurmd

      mkdir /var/log/slurm/
      touch /var/log/slurm/slurmd.log
      chown -R slurm:slurm /var/log/slurm/slurmd.log
      chmod 755 /var/log/slurm

      mkdir /run/slurm
      touch /run/slurm/slurmd.pid (For compute node)
      chown slurm /run/slurm
      chown slurm:slurm /run/slurm
      chmod -R 770 /run/slurm

After setting up the file, the path of slurmd.pid has to be changed inside slurmd.service file, slurmd.service can be accessed using following command:

      nano /usr/lib/systemd/system/slurmd.service

After completing the configuration of SLURM on the Compute Node, following commands is utilised to enable and start the SLURM services:

      systemctl daemon-reload
      systemctl enable slurmd
      systemctl start slurmd

Lastly, following command is employed to check the status of the SLURM services:

      systemctl status slurmd

## 6. Task Implementation:
### How to Create Machine Learning for Predict Crypto Currencies

#### Step 1: Get infomartion from API
The Alpha Vanatge API is going to be used to retrieve historical information from their database. The data will be imported in JSON format. Features to predict prices should be defined; some of them could include price, volume, and corresponding timestamps.

#### Step 2: Processing Data
After obtaining the information, it is possible to use panda libraries to convert the data to numeric or date formats. Using these data, technical indicators can be calculated . It is important to fill missing values with zeros and scale the data to ensure that it is on the same scale.

#### Step 3: Define Techninal Indicators 
The technical indicators RSI, EMA, and SMA are commonly employed in financial analysis to comprehend market dynamics and generate trading signals. Integrating these indicators into the ML model will assist in identifying complex patterns. Additionally, the inclusion of further technical indicators could enhance the model's analytical capabilities.

##### SMA
The Simple Moving Average (SMA) calculates the average price of a security or asset over a specified period. It is derived by summing up the prices for a given number of periods and dividing the total by the same number of periods. This indicator can be instrumental in identifying both short-term and long-term trends in the data.
<div style="text-align: center;">

![alt text](image.png)
</div>

Where *N* is the number of periods used in the calculation, *Pi* denotes the price of the asset at period *i*.

##### EMA 
The Exponential Moving Average (EMA) is a type of moving average that assigns greater significance to recent price data. Its calculation involves two primary components: the smoothing factor and the previous EMA value. The smoothing factor determines the weightage allocated to the most recent data point and is usually derived from a specified time period or number of data points. Due to its focus on recent data, the EMA responds more rapidly to price changes in comparison to the Simple Moving Average (SMA).

<div style="text-align: center;">

![alt text](image-1.png)
</div>

##### RSI
The Relative Strength Index (RSI) evaluates the strength of price movements in financial assets. Typically, it is calculated by averaging gains and losses on an item over a specified time frame. The RSI can predict changes in momentum or impulse and signal potential trend reversals. Traders and analysts utilize the RSI to identify probable overbought or oversold conditions in an asset, as well as to anticipate potential price corrections or reversals.

<div style="text-align: center;">

![alt text](image-2.png)
</div>

Now the data set is ready with 6 features (Time, Price, Volume, SMA, EMA, RSI)

#### Step 4: Split the data

The data should be split into training, validation, and testing sets with proportions of 70%, 10%, and 20%, respectively. The validation set is utilized to fine-tune the hyperparameters of the model and is considered part of the training process. The model solely evaluates this data but does not learn from it, ensuring an objective and unbiased evaluation of the model's performance.


#### Step 5: Choosign ML model (proposals)
### Random Forest Algorithm:

The Random Forest Algorithm is commonly used for regression and classification problems. This technique entails creating a forest of decision trees, where each tree is trained on a different subset of the dataset using a distinct set of parameters. This approach aims to enhance diversity and mitigate overfitting.

<div style="text-align: center;">

![alt text](image-3.png)
</div>

After each tree has been constructed, the algorithm predicts the class or regression value by aggregating the results of each tree. In classification tasks, the forest produces the mode of the predicted classes from each tree, while in regression tasks, it produces the mean of the predictions.

A notable feature of Random Forest is its capability to perform feature selection and analyze feature importance. This is beneficial for identifying which input features are most relevant for predicting cryptocurrency prices.

To make predictions at a new point *x* , the following equation is used:

<div style="text-align: center;">

![alt text](image-4.png)

</div>

*f_Jrf(x)*  represents the predicted value of the target variable for a given input variable *x*, *J* represents the number of decision trees in the forest, *T_j(x)* represents each decision tree in the forest.

##### Gradient Boosting Algorithm
The ML method belongs to the ensemble approach family, which integrates several models to produce predictions that are more accurate than those of a single model. In simpler terms, it assembles a group of less effective learners, such as decision trees, and trains them to decrease the errors of the previous model.

The residual error is utilized to train the subsequent decision tree. This process is repeated until the error is minimized. As each iteration aims to reduce errors, it also helps mitigate overfitting. Gradient Boosting (GB) can be applied to both classification and regression tasks.

One of the benefits of Gradient Boosting is its effectiveness in handling missing data and outliers. This characteristic is particularly advantageous in cryptocurrency markets, where data may be scarce and unreliable.
<div style="text-align: center;">

![alt text](image-5.png)
</div>

##### Long Short-Term Memory (most recommended, it’s seems is the more accurate for our task)

The RNN (Recurrent Neural Network) architecture, particularly Long Short-Term Memory (LSTM), is adept at capturing long-term dependencies in data sequences. LSTM employs a memory cell to store and retrieve input from earlier time steps, making it well-suited for modeling sequential data with long-term dependencies. It comprises four main components: three gates (Input, Output, and Forget gates) and a memory cell.

- The input gate governs the entry of fresh inputs into the memory cell.
- The forget gate determines how much of the previous memory state should be forgotten by the memory cell.
- The output gate regulates the output of memory cell states.
- The memory cell retains and transmits data to the next time step.


To predict future prices, LSTMs can analyze historical price data to identify patterns. The model utilizes a sequence of historical prices to forecast subsequent prices. The loss function calculates the disparity between predicted and actual prices, and optimization techniques are applied to train the LSTM model effectively.

<div style="text-align: center;">

![alt text](image-6.png)
</div>

The training process is described by:
<div style="text-align: center;">

![alt text](image-7.png)
</div>

Where *x_t*  is the input at time step  *t* ,  *h_t*  is the hidden state at time  *t* , *c_t*  is the cell state at time step  *t* , and *i_t* ,  *f_t*, and  *o_t*  are the input gate, forget gate, and output gate, respectively, at time step *t* .  *W*  and  *b* are the weight matrices and bias vectors, respectively. The sigmoid function and the hyperbolic tangent function *tanh* are used to bound the output between 0 and 1, and between -1 and 1, respectively.

##### Gated Recurrent Unit (GRU)
RNN architecture is also used in sequential data analysis applications, such as price predictions. It processes sequential data by maintaining an internal state that is altered whenever new input is added to the sequence.
In order to predict price trends in the crypto market, it is necessary to capture long-term dependencies and patterns in the time series data. The hidden state at time *t*, *h_t*, is updated based on the input at time *t*, *x_t*, and the previous hidden state, *h_t-1*, using the following equations:

<div style="text-align: center;">

![alt text](image-8.png)
</div>

#### Step 6: Evaluation Metrics
Evaluation metrics can be utilised for comparing algorithms and determining which features in the dataset have the most significant impact on the predictions of each model.
### RMSE
Mean Squared Error (MSE) is a commonly used metric to evaluate the performance of a predictive model, particularly in regression analysis. It quantifies the disparity between the predicted and actual values of a dataset, offering a measure of the average deviation of predictions from actual values.

<div style="text-align: center;">

![alt text](image-9.png)
</div>

Where, *n* is the number of data points in the dataset, *predicted_i* is the predicted value for the i-th data point, *actual_i* is the actual value for the i-th data point.
### MAE 
Mean Absolute Error (MAE) is a commonly used metric for evaluating the accuracy of a predictive model. It calculates the average magnitude of errors in a set of predictions, without considering their direction.
<div style="text-align: center;">

![alt text](image-10.png)
</div>

Where, *Y_i* is the actual value,  *Y*^_i is the predicted value and *n* the number of observations.

##### MSE
Mean Squared Error (MSE) is a commonly used metric to measure the disparity between the predicted and actual values in a regression problem. It is calculated by averaging the squared differences between the predicted and actual values. A lower MSE value indicates better performance
<div style="text-align: center;">

![alt text](image-11.png)
</div>

Where, *Y_i* is the actual value,  *Y*^_i is the predicted value and *n* the number of observations.

##### R-Squared

R-squared (R2) is a statistical measure that represents the proportion of the variance in the dependent variable that is predictable from the independent variable(s). In other words, it measures how well the independent variables explain the variability of the dependent variable. R-squared values range from 0 to 1, with higher values indicating a better fit of the model to the data.

The formula to clacalute R-Squared is: 
<div style="text-align: center;">

![alt text](image-13.png)
</div>
Where,

 SSR (Sum of Squared Residuals) is the sum of the squared differences between the
 predicted values and the actual values.
 SST (Total Sum of Squares) is the sum of the squared differences between the actual values and the mean of the target variable.

##### TWAP
 Time-Weighted Average Price or TWAP is a metric used to measure the averag e price of an asset over a specif period of time.
The formula to calculte TWAP is:
<div style="text-align: center;">

![alt text](image-14.png)
</div>

Where,
*Price 1* to *Price n* represent the prices recorded for each time interval, while *Time 1* to *Time n* denote the durations of each time interval. Total *time* is the sum of the durations of all time intervals



##### VWAP
VWAP stands for Volume-Weighted Average Price. It's a trading benchmark used primarily by institutional traders to measure the average price a stock has traded at throughout the trading day, based on both volume and price. VWAP is calculated by dividing the total value of all trades by the total volume traded over a specific time horizon, typically the entire trading day.

The formula for VWAP is as follows:
<div style="text-align: center;">

![alt text](image-15.png)
</div>


Where:
-  *Price_i*  is the price of the asset at time  *i* .
-  *Volume_i* is the volume of the asset traded at time  *i* .
-  *n*  is the total number of time intervals or data points considered.


#### Step 7: Create Prediction Model
RF and GB models can be created using the scikit-learn library. The LSTM model is constructed using the Keras library by invoking the Sequential() function and incorporating the LSTM units. The GRU model is built using the Keras library by employing the Sequential() function and adding the GRU units.

#### Step 8: Selct Hypeparameters
Hyperparameters aid in fine-tuning machine learning models to fit well with unseen data and enhance performance. Hyperparameter tuning is accomplished with the assistance of a validation dataset.
### Random Forest
1. Number of trees: The Random Forest Regressor has a hyperparameter called n_estimators, which specifies the number of decision trees that compose the forest. More trees increase the risk of overfitting but also enhace the model's conpelixity. 
2. Maximum Depth of Trees (max_depth): The tree depth parameter controls the maximum depth of each tree in the ensemble. Deeper trees can capture more intricate patterns but may increase the risk of overfitting.
3. Minimum Samples for a Split: This parameter determines the minimum number of samples needed to split an internal node. A higher value can mitigate the risk of overfitting by ensuring that nodes with insufficient samples are not split."

##### GB
1. Number of Trees (n_estimators): This hyperparameter specifies the number of decision trees to be built in the random forest. Increasing the number of trees generally improves the performance of the model, up to a certain point where further increases may not result in significant improvements but increase computational cost.

2. Maximum Depth of Trees (max_depth): This hyperparameter controls the maximum depth of each decision tree in the random forest. Deeper trees can capture more complex relationships in the data but are more prone to overfitting. Setting an appropriate max_depth helps balance between model complexity and overfitting.

3. Number of Features Considered for Split (max_features): This hyperparameter determines the maximum number of features to consider when looking for the best split at each node of the decision tree. It can be specified as an integer (considering a fixed number of features) or as a fraction (considering a fraction of total features). Choosing a lower value reduces the correlation between trees and helps improve the diversity of the ensemble, which can lead to better generalization performance.

### LSTM
1. Number of LSTM Units (units): This hyperparameter determines the number of memory cells or units in the LSTM layer. More units can help the model learn more complex patterns in the data, but it also increases the computational cost and the risk of overfitting.

2. Dropout Rate (dropout): Dropout is a regularization technique used to prevent overfitting in neural networks. It randomly drops a proportion of the units (neurons) in the LSTM layer during training. The dropout rate hyperparameter controls the probability of dropping a unit. A common value for dropout rate is between 0.2 and 0.5.

3. Sequence Length (input_length): In a sequence-to-sequence model like LSTM, the sequence length represents the length of input sequences fed into the network. It's important to choose an appropriate sequence length based on the nature of the problem and the characteristics of the data. A longer sequence length allows the model to capture more temporal dependencies but requires more memory and computational resources.

### GRU 
1. Number of Units (units): This hyperparameter determines the dimensionality of the hidden state and the output of the GRU cell. More units allow the model to capture more complex patterns in the data but increase computational cost. The number of units is a key factor in determining the capacity of the model to learn from sequential data.

2. Dropout Rate (dropout): Dropout is a regularization technique used to prevent overfitting in neural networks. It randomly drops a proportion of the units (neurons) in the GRU layer during training. The dropout rate hyperparameter controls the probability of dropping a unit. A common value for dropout rate is between 0.2 and 0.5.

3. Activation Function (activation): This hyperparameter specifies the activation function used in the GRU cell. The most common activation functions for GRU cells are 'tanh' (hyperbolic tangent) for the update and reset gates, and 'sigmoid' for the candidate activations. However, depending on the problem and data, other activation functions like ReLU (Rectified Linear Unit) may also be used.


## Step 9: Training Model
Modesl are tained using the trainiog dataset and setting the hyper-parameters to the value found during validation.

## Step 10: Testing the model 
Testing assesses the performance of the ML model using a separate testing dataset. This dataset is created by splitting the original dataset, ensuring that the models are evaluated on data they haven't been trained on. Usually a the Ml model has got a predict() function for make a prediction.

## Step 11: Evaluation Metrics
Evaluation metrics are crucial for assessing a model's performance and its suitability for addressing a specific problem. When comparing multiple machine learning models, analyzing metric values helps in selecting the most effective model.

## 7. Performance Evaluation: Develop a strategy for evaluating HPC system performance. 
## 8. Software and OS Maintenance: 
--- Implement a system for updating software and the operating system using cron and Git. • Reflect on the importance of software and OS maintenance in an HPC environment.


   


## References
1. The button can be find here: https://uk.rs-online.com/web/p/push-button-switches/2099127?cm_mmc=UK-PLA-DS3A-_-google-_-CSS_UK_EN_PMAX_RS+PRO-_--_-2099127&matchtype=&&gad_source=1&gclid=EAIaIQobChMIpP3xg7-mhAMVFAUGAB0t5QD5EAQYByABEgIy1_D_BwE&gclsrc=aw.ds

2. How to install WOL : https://pimylifeup.com/ubuntu-enable-wake-on-lan/#:~:text=Wake%2Don%2DLAN%20is%20a,functionality%20through%20your%20devices%20BIOS.

3. Power button and Front panel connections : https://www.pcinq.com/how-to-connect-motherboard-front-panel-headers/
                            https://www.electronicshub.org/power-button-on-motherboard/#:~:text=Ans%3A%20The%20power%20switch%20on,for%20the%2020-pin%20header

1. https://www.diva-portal.org/smash/get/diva2:1778251/FULLTEXT03
2. https://www.sharpsightlabs.com/blog/machine-learning-hyperparameters-explained/
3. https://scikit-learn.org/stable/index.html
4. https://www.warse.org/IJATCSE/static/pdf/file/ijatcse351942020.pdf
5. https://hpc.uni.lu/infrastructure/network
6. https://dlcdnimgs.asus.com/websites/global/aboutASUS/OS/Linux_Status_report_202312.pdf




## Authors

