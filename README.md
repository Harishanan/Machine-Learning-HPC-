<h3 align="center">High-Performance Computing System</h3>

## Table Of Contents
- [5.Software Installation](#5software-installation)
  - [5.1 SLURM Configuration](#51-slurm-configuration)
  - [7. Performance Evaluation: Develop a strategy for evaluating HPC system performance.](#7-performance-evaluation-develop-a-strategy-for-evaluating-hpc-system-performance)
  - [8. Software and OS Maintenance:](#8-software-and-os-maintenance)
  - [9. Task Implementation:](#9-task-implementation)
    - [9.1. How to Create Machine Learning for Predict Crypto Currencies](#91-how-to-create-machine-learning-for-predict-crypto-currencies)
  - [10. Performance Evaluation:](#10-performance-evaluation)
  - [References](#references)
  - [Authors](#authors)
  
## About The Project
The provided documentation outlines the comprehensive process undertaken by Team 0 for the design of a High Performance Computing (HPC) system as part of the Advanced Computer Engineering Module for the Computer Engineering Program at the University of Greenwich for the academic year 2023/24. This report guides the reader through a detailed step-by-step procedure encompassing both hardware and software aspects of the project. By following this documentation, readers will gain insights into the systematic approach employed by the team, enabling them to replicate and create their own HPC systems.  

## Built With
- [JavaScript](https://www.javascript.com/)
- [VueJS](https://vuejs.org/)


## Introduction


## 1. System Design And Architecture

[Specification of all the components can be found here!](hardware.md)

***Design the architecture, integrating 14 ASUS CS-8 motherboards and single-board computers. Provide critical reflections on the chosen design.***

## 2. Technology Research: 
***Conduct comprehensive research on HPC technologies, power management, non-volatile storage, and RAM. Justify technology choices based on problem domain appropriateness.*** 

### 2.1 Operating System Selection: 

Initially, an attempt was made to determine which operating system the ASUS CS-B motherboard supports. However, the information available suggests that the ASUS CS-B is only compatible with Ubuntu 13.10, as indicated in the provided image.

![Os](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/3f1fbdae-3522-4e26-841c-ef19f4888d5a)
Figure: OS Compatibility of Asus CS-B 

#### 2.1.1 Install Operating System in Head Node

1. Once the operating system was determined, below steps are followed to install ubuntu desktop 13.10:
      - Downloaded the Ubuntu Desktop from the official Ubuntu website (https://old-releases.ubuntu.com/releases/13.10/). As Intel processor is used, PC (Intel x86) desktop image is chosen when downloading the image.
      - Created a bootable USB drive using Rufus.
      - Booted the motherboard from the USB drive.
      - Followed the installation wizard to install Ubuntu Desktop on the system.


                  sudo apt update                                           
            
                  sudo apt upgrade

3. Given its role as the head node in our setup, the desktop image is transformed into a server. Let's quickly delve into the significance of the head node within the realm of High-Performance Computing (HPC).

- The head node serves as a central control unit in an HPC environment, orchestrating and managing the entire cluster. Its primary purposes include task scheduling, resource allocation, and overall coordination of computational tasks within the cluster. By installing      the Ubuntu Server and setting the default target to multi-user mode optimize resource allocation, conserving RAM and CPU resources by eschewing unnecessary graphical sessions. This ensures that the head node operates efficiently, enabling it to efficiently manage and    oversee the computational workload of the entire HPC cluster.
  
            To install Ubuntu Server  : sudo apt install ubuntu-server
            To disable GUI            : sudo systemctl set-default multi-user.target
     
Although the documentation states that the ASUS CS-B motherboard can only run Ubuntu 13.10, a brief test was run to see how the motherboard would react to installing Ubuntu 24.04 (Nobel Numbat), a more recent version of the operating system. The Ubuntu 24.04      
operating system ran on the system very well, with no noticeable glitches. This surprising finding prompted more investigation into the motherboard's compatibility with the latest Ubuntu versions. 
Although documentation indicates otherwise, one plausible explanation for Ubuntu 24.04's successful running on the ASUS CS-B motherboard could be the hardware compatibility enhancements included in later Ubuntu editions. The Ubuntu operating system is continuously improved and optimised by its developers throughout time to improve compatibility with a wider variety of hardware setups. Because of this, more recent versions of Ubuntu might by nature support a greater range of motherboards, including the ASUS CS-B. Moreover, improvements in system libraries, kernel updates, and device drivers in Ubuntu 24.04 can also be responsible for its smooth operation on the ASUS CS-B motherboard. These updates might take care of any compatibility problems that earlier motherboard models might have had, making it possible to use current Ubuntu editions more smoothly.

After noticing that Ubuntu 24.04 operated steadily on the ASUS CS-B motherboard, the group chose to switch from Ubuntu 13.10 to this more recent version. This choice was driven by the goal of utilising Ubuntu 24.04's most recent software features, security updates, and hardware compatibility changes to provide the best possible computing environment for the team's activities.

#### 2.1.2 Install Operating System in Compute Node

The process of installing the operating system on a compute node is similar to that of the head node, with the exception that it is not required the installation of Ubuntu Server specifically.

### 2.2 Power Management
   Following a thorough examination of individual components, research has been conducted to determine the optimal power distribution among them. Initially, the plan was to utilize two 750W Power Supply Units (PSUs). However, due to technical malfunctions in one of the PSUs, the decision has been made to employ smaller PSUs for each motherboard separately. The power consumption of each hardware component is provided below for reference.
  
   |      Components        |     Power Consumption (approx)       |       Description        |
   |------------------------|-----------------------------|--------------------------|
   |Asus CS-B Intel Core i3 4th Gen | 25W - 40W       | CPU Power Management can be handeled directly from BIOS. It provides subitems that allows to manipulate the CPU ratio and feature.|
   |SAMSUNG V-NAND 500GB SSD| 3W (Active), 50mW (idle)|Each Motherboard will be connected to one of this SSD which can be powered by a same PSU.|  
   |NVIDIA QUADRO           |    45W (Max.)           |Only one of the GPU will be used in the entire system which will be connected to the head node. |        

   |Power Supply Unit (PSU)| Capacity | Description|
   |---|---|---|
   |FSP220-50LC|220W (total output) | This PSU has a maximum wattage of 60W. And the sum of the power requirements for all the components connected to the PSU should not exceed 220W. |


* Active Power Consumption:

        CPU: 25W - 40W
        SSD: 3W
        GPU: 45W
        Total Active Power Consumption = CPU + SSD + GPU
        = (25W - 40W) + 3W + 45W
        = 73W - 88W

* Idle Power Consumption (Assuming SSD and GPU are in idle state):


* Power Supply Unit (PSU) Capacity:

        Total Output Capacity: 220W
        Maximum Wattage: 60W

* Conclusion:

    The single PSU in our system will be connected to one motherboard, one SSD, and one graphics card. The total power consumption of the system should not exceed the PSU capacity.
    
    The system is expected to consume between 73W - 88W during active use and between 25.05W - 40.05W when idle. Although a single 220W PSU could theoretically handle the load for two motherboards, practical constraints like cable and port limitations restrict each PSU to power only one motherboard in our setup


### 2.3 Network Interconnect:
   
***Cluster Network is two or more computing device working together for a common computing purpose. This Network follows the principle of the parallel processing. Parallel processing is the method of using two or more processors(CPUs) to handle seperate chuncks of a same complex tasks.*** 

There are several interconnect technologies available with their own strength and specefic use-cases. Some of them are :

1. **Infiniband** : Computer Networking communication standard used in high-performance computing that features high throughput and very low latency. It supports Remote Direct Memory Access(RDMA), which means the ability to access host memory directly without CPU intervention. Infiniband is widely used in supercomputer clusters and it is preferred network interconnection technology for GPU servers.
2. **NVIDIA NVLink** : World's first high-speed GPU interconnect technology that can connect two graphics card , with low latency, and high bandwidth. It is ideal for the system that uses NVIDIA graphics card, such as those in deep-learning and GPU accelerated computing. It is not best option for our project,as it is only compatible with NVIDIA graphics card and we will be using intel graphics card for our HPC.
3. **Intel Omni-Path Architecture(OPA)** : OPA is communication architecture developed by intel which aims for low communication latency, low power consumption and a high throughput. It is often used for HPC application with Intel processor. OPA directly competes with infiniband.
4. **Ethernet** : Ethernet is one of the commonly used interconnect technology because of its versatility, scalability and compatibility.It migh not provide same low-latency level as specialised interconnect like infiniband but it provides various speed, ranging from 10 megabyte to 100 gigabyte per second.    

The type of interconnect technology one needs lies on what kind of system they are building and what kind of interconnect is compatible with the system. For our system, specefication and hardware is given above.

For this project, Ethernet cables will be utilized due to their accessibility and sufficient speed for project requirements. These cables will serve dual purposes: data transfer and network bridging. The motherboard provided includes two Ethernet ports, both of which will be utilized for interconnecting nodes.

The head node will establish connections with all other nodes via a switch. Two switches will be employed: one for interconnecting all nodes to facilitate data transfer, and the other to distribute internet connectivity from the head node to all compute nodes. 

By default, one of the ports is enabled. However, to activate the second port, users must adhere to the following steps:

            Reboot the motherboard 

            Press the 'F2' or 'Del' button to access the BIOS settings 

            Navigate to Advanced settings using arrow keys.

            Proceed to Network Interface Stack Setting

            Enable the Second Interface named "Retalke Interface" (most of the cases, name may vary)

            Esure that your "Intel Interface" is also enabled.

Once the steps are followed and both interfaces are activated, users can proceed to configure each interface to perform specific tasks. Detailed instructions can be found in the following link: [Configuring Interface using Nm-Connection-Editor](https://github.com/TeachingMaterial/ace-2023_-team-0/tree/documentation/nm-connection-editor-Harishanan)

Ethernet cables were manually crimped for this project, adhering to the Registered Jack 45 (RJ-45) standard. The figure below illustrates the color standard for RJ-45 cables..


![RJ-45 Standard](pictures/rj45_standard.PNG)<br>
      <b>Figure 1: RJ-45 Standard</b>
      <br>

Step wise Step  process is shown in figure 2 below:

![Ethernet-Crimp](pictures/stepwisestepcrimp.PNG)<br>
      <b>Figure 2: Step by Step Ethernet Cimp</b>
      <br>

## 3. System Construction:
***Assemble the HPC system, implementing power management and resource-efficient configurations. Configure non-volatile storage and RAM to meet performance requirements.***

## 4. Housing and Cooling Solutions: 
***Design and implement housing/structure using laser cutting or additive manufacturing. Discuss convection principles (natural and forced) for cooling.***

## 5. System Configuration

### 5.1. Background for power on and off function in HPC

Due to failures experienced with the power-on button for the entire HPC system, the strategy was changed to power the HPC on and off. In this project, a bash script was created using Wake-on-LAN communication and OpenSSH. Initially, the HPC's head node will be turned on using the power-on button. Afterwards, to turn on the compute nodes, a bash script will be run, which turns on the other compute nodes at intervals. Through this method, the compute nodes can be successfully powered on, allowing the whole HPC system to function. Then, to turn off all the compute nodes, the OpenSSH function was incorporated into the script, with the sudo shutdown command for all compute nodes. Through this, it is possible to turn off the entire compute nodes. Finally, to turn off the head node, one can press the power button or enter a separate sudo shutdown command for the head node.

[Step by Step Configuration File Can be Found Here](power-on-off.md)
# 5.Software Installation

## 5.1 SLURM Configuration

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

[Step by Step Configuration File Can be Found Here!](slurm.md)

## 6. Task Implementation:
### 6.1. How to Create Machine Learning for Predict Crypto Currencies

To predict cryptocurrency prices with machine learning, start by fetching historical data (prices, volumes, timestamps) using APIs like Alpha Vantage. Process this data, compute technical indicators (RSI, EMA, SMA), and normalize to ensure uniformity. Split the data into training, validation, and testing sets for model development and evaluation. Consider machine learning models such as Random Forest for its robustness, Gradient Boosting for error minimization, LSTM for capturing long-term dependencies, and GRU for efficient sequential data handling. Fine-tune models using the validation set and assess their performance with metrics like RMSE and MAE on the test set, aiming to select the model that best captures cryptocurrency market dynamics. (<b>This needs to be rewritten</b>)

[Access the detailed step-by-step guide here](Predicting_Cryptocurrency_Prices_with_ML.md)

### 6.2. Implementation of Cryptocurrency Price Prediction Application
<b>Write a introduction of this topic</b>

[Access the detailed step-by-step guide here](https://github.com/TeachingMaterial/ace-2023_-team-0/blob/dev/Implementation_of_ML.md)
## 7. Performance Evaluation: Develop a strategy for evaluating HPC system performance. 

## 8. Software and OS Maintenance: 
***Implement a system for updating software and the operating system using cron and Git. • Reflect on the importance of software and OS maintenance in an HPC environment.***


 # Configuring Prometheus and Grafana

## What is Prometheus 
•The primary uses of Prometheus, an open-source Linux server monitoring program, are alert management, event monitoring, and metrics monitoring.

•Because Prometheus has revolutionized system monitoring, the Cloud Native Computing Foundation (CNCF) has named it as one of its top projects.

•Prometheus supports dashboarding and graphing using a variety of modalities.

## Prometheus Components
The initial part of the Prometheus architecture is the Prometheus server. 
The central component of the Prometheus architecture, which is further split into storage, Prom, HTTP server, and so on, is the Prometheus server. 
Data is scraped from the target nodes in the Prometheus server and then saved in the database.

## Storage 
•The Prometheus server includes local on-disk storage . 

•Numerous interfaces in Prometheus enable integration with external storage systems.

## Service Discovery
•The services that need to be scraped are found with the use of service discovery.

•using the service discovery we can check what targets are activley being scraped aswell as monitoring all entitys 

## Scrape Target
•We can extract metrics and scrape metric from the target after the services have been determined and the targets are prepared.

•Node exporters allow us to export the endpoint's data.

•Prometheus keeps the metrics or other data in a local storage once it has been fetched.

 ## User Interface
Another crucial element is the user interface, which creates a link between the user and the system. Grafana, a visualization tool, and Prometheus work together to create excellent unique dashboards. Grafana dashboards show data using tables, pie charts, line charts, and data graphs of network load, CPU and RAM consumption, among other things, along with the ability to display alerts. Grafana uses prom ql in order to extract data from Prometheus

## What is Grafana
•Grafana, which is an open-source, free visualization tool that is typically utilized in conjunction with Prometheus to track metrics.

•Grafana offers a range of dashboards, diagrams, charts, and notifications for the specific data source.

•One of Grafana's key advantages is that we may share and store the dashboard with every member of the group. 

## Node exporter 
An agent called the Node Exporter collects system metrics and makes them available in a manner that Prometheus can read. One project that is managed by the Prometheus project is the Node Exporter. You can skip this step if system stats are not needed. We are using node exporter to scrape metrics from the different nodes and then relay them to Prometheus. The metrics scraped from port 9100 are for the head-node and the ports 9101,9102,9103 and 9104 are for the sub-nodes 

# Steps taken to configure both Prometheus 

## Creating Prometheus System Users and Directory
In this section I configured the system user, created directories where the configuration files will be stored and set the ownership of the Prometheus directory 

*sudo useradd --no-create-home --shell /bin/false Prometheus* -- Create a system user for Prometheus

*sudo mkdir /etc/prometheus*

*sudo mkdir /var/lib/Prometheus – stores the libraries and configuration files of the directories*

*sudo chown prometheus:prometheus /var/lib/prometheus -- sets prometheus as the owner of the directory*

## Download Prometheus Binary File
In this section I downloaded the latest version of prometheus for our operating system from the prometheus home page under downloads 

*cd /tmp/--enters tmp*

*wget. https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz –uses wget command to download the prometheus setup 
tar -xvf prometheus-2.46.0.linux-amd64.tar.gz – extracts the file form the setup*

## moves config file and sets the user access 
 *cd prometheus-2.46.0. linux-amd64* –- enters the Prometheus download
 
 *sudo mv console* /etc/prometheus* –- moves the configuration file
 
 *sudo mv prometheus.yml /etc/prometheus* –- moves the configuration file
 
 *sudo chown -R prometheus: prometheus /etc/prometheus* –- sets the user of prometheus


## Prometheus configuration file
In this section I confirmed the Prometheus yml file was present and modified as needed. i set the evaluation time and scrape intrval time to 15 seconds then
I added all data points that I wanted to scrap in the scrap configs section with the main prometheus job in the scrape config section. An alert manager can also be implemented if necessary to alert the user of certain readings that exceeds recommeneded values   

![alt text](prometheus.jpg)
<b>Figure .1 shows the prometheus yml file   </b>
<br><br>

## Creating Prometheus Systemd file
In this section I created a service file that sets up its startup and states its service type and users. I then reloaded the system to confirm the setup. The code used will be included in the appendix. 

![alt text](system.MD-Prom.jpg)
<b>Figure .2 system.MD file for prometheuese   </b>
<br><br>

 *./prometheus –config.file=prometheus.yml (or) ./prometheus – launches the Prometheus server*  
 
## Verification 
As the default configuration for the prometheus the local host on port 9090 we can verify that its up by accessing http://server-ip-address:9090.on our web browser. When the prometheus interface was displayed I could see if was configure correctly 

## Installing Grafana
Grafana was then installed by following a similar process which was adding the Grafana repository to the system and then installing it and updating the packages by using the *get-update* and *apt-get* commands. Followed by enabling the server using the enable command. The password for Grafana was then changed to using the *sudo grafana-cli admin reset-admin-password* command 

## Prometheus and Grafana inter-connection 
I added the prometheus connection my adding the URL of prometheus local host 9090 as a new data source and then saving the configuration. From here I created a new dashboard using the data source based of a template on the grafana download page 

## Grafana graphs 
The first graph displays the CPU core usage which tells us the percent of processing power that is being used as well as the memory usage which show the amount of ram being utilized 

![](<graph.1 cpu.jpg>)<br>
<b>Figure .2 cpu and memory graph readings </b>
<br><br>

The second graph used displayed disk space which determines the total data the hard disks can store. It also displays the load carried by the board

![alt text](<graph.2 disk space and load.jpg>)
<b>Figure .3 load and the disk usage readings  </b>
<br><br>

The third graph shows the disc utilization per device which is the percentage of your hard disk your computer is currently using to run programs and carry out tasks. It also displays the rate the disc can read or write to a device 

![alt text](<graph.3 disc utilzation per device.jpg>)
<b>Figure .4 disk usage per device and sta/stw readings   </b>
<br><br>


The fourth and final graph displays context switches which are the process of switching the CPU from one process, task or thread to another. It also shows the traffic over the network 

![alt text](<graph .4 context switch and network traffic.jpg>)
<b>Figure .5 context switch and network readings   </b>
<br><br>





   






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

