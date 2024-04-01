<br/>
<h3 align="center">High-Performance Computing System</h3>

## Table Of Contents
- [Introduction](#Introduction)
- [System Design And Architecture](#System_Design_And_Architecture)
- [Technology Research]
- [Power Management]
- [System Construction]
- [Housing and Cooling Solutions]
- [Operating System Selection]
   - [Install Operating System in Head Node]
   - [Install Operating System in Compute Node]
- [Task Implementation]
   - [How to Create Machine Learning for Predict Crypto Currencies]
- [Performance Evaluation]
- [Software and OS Maintenance]
- [References]
- [Contributors]
- [License]
  
## About The Project

## Built With
- [JavaScript](https://www.javascript.com/)
- [VueJS](https://vuejs.org/)

## Abstract
## Introduction

## 1. System Design And Architecture
***Design the architecture, integrating 14 ASUS CS-8 motherboards and single-board computers. Provide critical reflections on the chosen design.***

## 2. Technology Research: 
***Conduct comprehensive research on HPC technologies, power management, non-volatile storage, and RAM. Justify technology choices based on problem domain appropriateness.*** 

### 2.1 Operating System Selection: 
***Choose an operating system (e.g., Linux- Ubuntu or declarative system- NixOS). Justify the choice based on task requirements and overall design.***
Software and Network Configuration
Operating System: Overview of Ubuntu 24 installation across all nodes.
Networking: Description of the networking setup, including challenges and solutions for node communication and internet sharing.
Cluster Management: Configuration details for Slurm and challenges faced (e.g., PXE boot issues).
Containerization: Implementation of Apptainer for application deployment.
Monitoring: Setup of Node Exporter, Prometheus, and Grafana for system monitoring and performance tracking.
### 5.1. Install Operating System in Head Node
---
Initially, an attempt was made to determine which operating system the ASUS CS-B motherboard supports. However, the information available suggests that the ASUS CS-B is only compatible with Ubuntu 13.10, as indicated in the provided image.

![Os](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/3f1fbdae-3522-4e26-841c-ef19f4888d5a)
Figure: OS Compatibility of Asus CS-B 

1. Once the operating system was determined, below steps are followed to install ubuntu desktop 13.10:
      - Downloaded the Ubuntu Desktop from the official Ubuntu website (https://old-releases.ubuntu.com/releases/13.10/). As Intel processor is used, PC (Intel x86) desktop image is chosen when downloading the image.
      - Created a bootable USB drive using Rufus.
      - Booted the motherboard from the USB drive.
      - Followed the installation wizard to install Ubuntu Desktop on the system.

2. After the installation process, the system undergoes a series of commands to ensure it possesses the latest security patches and software updates:

                  sudo apt update                                           
            
                  sudo apt upgrade

3. Given its role as the head node in our setup, the desktop image is transformed into a server. Let's quickly delve into the significance of the head node within the realm of High-Performance Computing (HPC).

- The head node serves as a central control unit in an HPC environment, orchestrating and managing the entire cluster. Its primary purposes include task scheduling, resource allocation, and overall coordination of computational tasks within the cluster. By installing      the Ubuntu Server and setting the default target to multi-user mode optimize resource allocation, conserving RAM and CPU resources by eschewing unnecessary graphical sessions. This ensures that the head node operates efficiently, enabling it to efficiently manage and    oversee the computational workload of the entire HPC cluster.
  
            To install Ubuntu Server  : sudo apt install ubuntu-server
            To disable GUI            : sudo systemctl set-default multi-user.target
     
Although the documentation states that the ASUS CS-B motherboard can only run Ubuntu 13.10, a brief test was run to see how the motherboard would react to installing Ubuntu 22.04 (Jammy Jellyfish), a more recent version of the operating system. The Ubuntu 22.04       
operating system ran on the system very well, with no noticeable glitches. This surprising finding prompted more investigation into the motherboard's compatibility with the latest Ubuntu versions. 
Although documentation indicates otherwise, one plausible explanation for Ubuntu 22.04's successful running on the ASUS CS-B motherboard could be the hardware compatibility enhancements included in later Ubuntu editions. The Ubuntu operating system is continuously       improved and optimised by its developers throughout time to improve compatibility with a wider variety of hardware setups. Because of this, more recent versions of Ubuntu might by nature support a greater range of motherboards, including the ASUS CS-B. Moreover,         improvements in system libraries, kernel updates, and device drivers in Ubuntu 22.04 can also be responsible for its smooth operation on the ASUS CS-B motherboard. These updates might take care of any compatibility problems that earlier motherboard models might have     had, making it possible to use current Ubuntu editions more smoothly.
After noticing that Ubuntu 22.04 operated steadily on the ASUS CS-B motherboard, the group chose to switch from Ubuntu 13.10 to this more recent version. This choice was driven by the goal of utilising Ubuntu 22.04's most recent software features, security updates,      and hardware compatibility changes to provide the best possible computing environment for the team's activities.

### 2.2 Install Operating System in Compute Node
---
The process of installing the operating system on a compute node is similar to that of the head node, with the exception that it is not required the installation of Ubuntu Server specifically.

### 2.3. Power Management
---

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
***Assemble the HPC system, implementing power management and resource-efficient configurations. Configure non-volatile storage and RAM to meet performance requirements.***

## 4. Housing and Cooling Solutions: 
***Design and implement housing/structure using laser cutting or additive manufacturing. Discuss convection principles (natural and forced) for cooling.***

## 5. BIOS Settings

## 6. Networking

## 7. Software Installation

## 6. Task Implementation:
### 6.1. How to Create Machine Learning for Predict Crypto Currencies

To predict cryptocurrency prices with machine learning, start by fetching historical data (prices, volumes, timestamps) using APIs like Alpha Vantage. Process this data, compute technical indicators (RSI, EMA, SMA), and normalize to ensure uniformity. Split the data into training, validation, and testing sets for model development and evaluation. Consider machine learning models such as Random Forest for its robustness, Gradient Boosting for error minimization, LSTM for capturing long-term dependencies, and GRU for efficient sequential data handling. Fine-tune models using the validation set and assess their performance with metrics like RMSE and MAE on the test set, aiming to select the model that best captures cryptocurrency market dynamics.

[Access the detailed step-by-step guide here](Predicting_Cryptocurrency_Prices_with_ML.md)

## 7. Performance Evaluation:
***Develop a strategy for evaluating HPC system performance.***


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
•The Prometheus server has local on-disk storage for storage. 

•Numerous interfaces in Prometheus enable integration with external storage systems.

## Service Discovery
•The services that need to be scraped are found with the use of service discovery.

•We can detect the targets and keep an eye on the entities using service discovery.

## Scrape Target
•We can extract metrics from it and scrape the target after the services have been determined and the targets are prepared.

•Node exporters allow us to export the endpoint's data.

•Prometheus keeps the metrics or other data in a local storage once it has been fetched.

 ## User Interface
Another crucial element is the user interface, which creates a link between the user and the system. Grafana, a visualization tool, and Prometheus work together to create excellent unique dashboards. Grafana dashboards show data using tables, pie charts, line charts, and excellent data graphs of network load, CPU and RAM consumption, among other things, along with indications. Grafana uses prom ql in order to extract data from Prometheus

## What is Grafana
•Grafana, which is an open-source, free visualization tool that is typically utilized in conjunction with Prometheus to track metrics.

•Grafana offers a range of dashboards, diagrams, charts, and notifications for the specific data source.

•One of Grafana's key advantages is that we may share and store the dashboard with every member of the group. 

## Node exporter 
An agent called the Node Exporter collects system metrics and makes them available in a manner that Prometheus can read. One project that is managed by the Prometheus project is the Node Exporter. You are free to skip this step if you would prefer not to collect system stats. We are using node exporter to scrape metric from the different node and then relay them to Prometheus. The metric scraped from port 9100 are for the head-node and the ports 9101,9102,9103 and 9104 are for the sub-nodes 

# Steps taken to configure both Prometheus 

## Creating Prometheus System Users and Directory
In this section I configured the system user, created directories where the configuration files will be stored and set the ownership of the Prometheus directory 
sudo useradd --no-create-home --shell /bin/false Prometheus -- Create a system user for Prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/Prometheus – stores the libraries and configuration files of the directories 
sudo chown prometheus:prometheus /var/lib/prometheus -- sets prometheus as the owner of the directory 

## Download Prometheus Binary File
In this section I downloaded the latest version of prometheus for our operating system from the prometheus home page under downloads 

cd /tmp/--enters tmp
wget. https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz –uses wget command to download the prometheus setup 
tar -xvf prometheus-2.46.0.linux-amd64.tar.gz – extracts the file form the setup

## moves config file and sets the user access 
('cd prometheus-2.46.0. linux-amd64 – enters the Prometheus download')
('sudo mv console* /etc/prometheus – moves the configuration file')
('sudo mv prometheus.yml /etc/prometheus – moves the configuration file')
('sudo chown -R prometheus: prometheus /etc/prometheus – sets the user of prometheus')


## Prometheus configuration file
In this section I confirmed the Prometheus yml file was present and modified as needed 
I added all data points that I wanted to scrap in the scrap configs section with the main prometheus job in the scrape config section  

## Creating Prometheus Systemd file
In this section I created a service file that sets up its startup and states its service type and users. I then reloaded the system to confirm the setup. The code used will be included in the appendix of the READ.ME FILE. 
 ./prometheus –config.file=prometheus.yml (or) ./prometheus – launches the Prometheus server  
 
## Verification 
As the default configuration for the prometheus the local host on port 9090 we can verify that its up by accessing http://server-ip-address:9090.on our web browser. When the prometheus interface was displayed I could see if was configure correctly 

   









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

