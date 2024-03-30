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
### The Critical Role of Software and OS Maintenance
The importance of software and OS maintenance in high-performance computing (HPC) environments is crucial due to several factors. Maintenance activities, ranging from routine updates to comprehensive system overhauls, ensure that HPC systems deliver optimal performance, security, and compatibility over time.

1. <b>Software Maintenance for Enhanced Performance and Reliability:</b>
Regular software maintenance is essential for correcting errors, improving performance, and ensuring the compatibility of HPC systems with new hardware and software technologies. It involves updating applications and system software to fix bugs, address security vulnerabilities, and add new features, thereby enhancing both performance and reliability (Pan Ming, 2003; Ahmad Salman Khan & M. Kajko-Mattsson, 2012).

2. <b>OS Maintenance for Stability and Security:</b> 
Maintenance of the operating system is equally important in HPC environments. This includes patching security vulnerabilities, updating drivers for new hardware components, and optimizing the OS for performance. Such maintenance tasks ensure that the HPC environment remains stable, secure, and capable of delivering high-performance computing resources efficiently (M. Joy, S. Jarvis, & Michael Luck, 2002).

3. <b>Impact of Maintenance on Software Complexity and Maintenance Performance:</b>
Maintenance activities also play a pivotal role in managing software complexity, which in turn affects the ease and cost of future maintenance efforts. Implementing best practices in software development and maintenance can reduce complexity, making software easier to update and maintain. This is crucial in HPC environments where the complexity of tasks and the volume of data can be very high (R. Banker, G. Davis, & S. Slaughter, 1998).

Thus, effective software and OS maintenance in HPC environments is pivotal for ensuring that these complex systems operate at their peak efficiency, remain secure, and continue to support the evolving needs of high-performance computing tasks. The maintenance process, while often resource-intensive, is essential for the long-term success and reliability of HPC systems.

### Setting Up a System for Software and Operating System Updates Using Cron and Git
[A Detailed Guide: Step-by-Step Instructions Available Here]()
   
## Create Man Page
The creation of manual pages, or "man pages," serves as a cornerstone in documenting software within Unix and Unix-like operating systems. Their primary purpose is to offer users, system administrators, and developers a comprehensive, accessible, and standardized documentation format. Man pages provide an indispensable quick reference for commands, system calls, configuration files, and beyond, detailing usage, options, examples, and environmental considerations. They adhere to a specific structure, ensuring information is consistently organized and easily retrievable. This standardization not only aids in quick learning and reference but also ensures documentation is readily accessible directly from the command line, eliminating the need for internet access or external resources. Beyond serving as a practical guide, man pages play an educational role, helping new users navigate the complexities of the command line and offering developers detailed insights into system programming interfaces. Additionally, they document system behaviors and configurations, contributing to a deeper understanding and more effective management of Unix-like systems. Man pages, therefore, are more than just documentation; they are an integral part of the Unix ecosystem, fostering a culture of self-sufficiency and informed usage among its user base.

[Step-By-Step Guide can be found here](CreateManPage/createManPage.md)








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



    Pan Ming (2003) The discussion about software maintenance. Information Technology.
    Ahmad Salman Khan & M. Kajko-Mattsson (2012) Evaluating the Role of Maintenance Environment Activities in Software Handover. 2012 8th International Conference on Computing Technology and Information Management (NCM and ICNIT), 1, pp. 230-237.
    R. Banker, G. Davis, & S. Slaughter (1998) Software Development Practices, Software Complexity, and Software Maintenance Performance: a Field Study. Management Science, 44, pp. 433-450.
    M. Joy, S. Jarvis, & Michael Luck (2002) Maintaining your Linux OS.


## Authors

