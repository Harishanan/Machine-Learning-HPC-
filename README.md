<br/>
<h3 align="center">High-Performance Computing System</h3>

## Table Of Contents
- [Table Of Contents](#table-of-contents)
- [About The Project](#about-the-project)
- [Built With](#built-with)
- [Abstract](#abstract)
- [Introduction](#introduction)
- [1. System Design And Architecture](#1-system-design-and-architecture)
- [2. Technology Research:](#2-technology-research)
  - [2.1 Network Interconnect:](#21-network-interconnect)
- [3. System Construction:](#3-system-construction)
- [4. Housing and Cooling Solutions:](#4-housing-and-cooling-solutions)
- [5. Operating System Selection:](#5-operating-system-selection)
  - [5.1. Install Operating System in Head Node](#51-install-operating-system-in-head-node)
  - [5.2 Install Operating System in Compute Node](#52-install-operating-system-in-compute-node)
  - [5.3. Power Management](#53-power-management)
- [6. BIOS Settings](#6-bios-settings)
- [7. Networking](#7-networking)
- [8. Software Installation](#8-software-installation)
- [9. Task Implementation:](#9-task-implementation)
  - [9.1. How to Create Machine Learning for Predict Crypto Currencies](#91-how-to-create-machine-learning-for-predict-crypto-currencies)
- [10. Performance Evaluation:](#10-performance-evaluation)
- [11. Software and OS Maintenance:](#11-software-and-os-maintenance)
- [References](#references)
- [Authors](#authors)
  
## About The Project
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


## Built With
- [JavaScript](https://www.javascript.com/)
- [VueJS](https://vuejs.org/)

## Abstract
The provided documentation outlines the comprehensive process undertaken by Team 0 for the design of a High Performance Computing (HPC) system as part of the Advanced Computer Engineering Module for the Computer Engineering Program at the University of Greenwich for the academic year 2023/24. This report guides the reader through a detailed step-by-step procedure encompassing both hardware and software aspects of the project. By following this documentation, readers will gain insights into the systematic approach employed by the team, enabling them to replicate and create their own HPC systems.  

## 1. System Design And Architecture


[Specification of all the components can be found here!](hardware.md)


***Design the architecture, integrating 14 ASUS CS-8 motherboards and single-board computers. Provide critical reflections on the chosen design.***

## 2. Technology Research: 
***Conduct comprehensive research on HPC technologies, power management, non-volatile storage, and RAM. Justify technology choices based on problem domain appropriateness.*** 



### 2.1 Network Interconnect:
   
***Cluster Network is two or more computing device working together for a common computing purpose. This Network follows the principle of the parallel processing. Parallel processing is the method of using two or more processors(CPUs) to handle seperate chuncks of a same complex tasks.***

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


In today's time, most computer have multi-cores (i.e., anywhere from two to tewelve cores) which follows the concept of parallel processing. These multi-cores set-ups are similar to having seperate processors installed in a same computer, which can executes more tasks than a single-core processors. In HPC, this concept is extended to multiple nodes, each equipped with its own set of processors where large computational tasks is broken down into smaller sub-tasks that can be executed simultaneously by multile processor at a same time. 


High-Speed interconnect are crucial for High-Performance Computer(HPC), as we want high data analysis and transfer rate between two nodes to move large amount of data quickly. Along with data transfer, low latency is equally imporatant in HPC, to minimize the time it takes for data to travel between different components of the system. If designing  stock prediction system, developing accurate models often requires extensive training and optimization processes. High-speed interconnects facilitate the rapid exchange of information during these iterative processes, allowing the model to be trained and refined more quickly. 

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

## 5. Operating System Selection: 

***Choose an operating system (e.g., Linux- Ubuntu or declarative system- NixOS). Justify the choice based on task requirements and overall design.***
Software and Network Configuration
Operating System: Overview of Ubuntu 24 installation across all nodes.
Networking: Description of the networking setup, including challenges and solutions for node communication and internet sharing.
Cluster Management: Configuration details for Slurm and challenges faced (e.g., PXE boot issues).
Containerization: Implementation of Apptainer for application deployment.
Monitoring: Setup of Node Exporter, Prometheus, and Grafana for system monitoring and performance tracking.


![Os](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/3f1fbdae-3522-4e26-841c-ef19f4888d5a)
Figure: OS Compatibility of Asus CS-B 

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
     
Although the documentation states that the ASUS CS-B motherboard can only run Ubuntu 13.10, a brief test was run to see how the motherboard would react to installing Ubuntu 22.04 (Jammy Jellyfish), a more recent version of the operating system. The Ubuntu 22.04       
operating system ran on the system very well, with no noticeable glitches. This surprising finding prompted more investigation into the motherboard's compatibility with the latest Ubuntu versions. 
Although documentation indicates otherwise, one plausible explanation for Ubuntu 22.04's successful running on the ASUS CS-B motherboard could be the hardware compatibility enhancements included in later Ubuntu editions. The Ubuntu operating system is continuously       improved and optimised by its developers throughout time to improve compatibility with a wider variety of hardware setups. Because of this, more recent versions of Ubuntu might by nature support a greater range of motherboards, including the ASUS CS-B. Moreover,         improvements in system libraries, kernel updates, and device drivers in Ubuntu 22.04 can also be responsible for its smooth operation on the ASUS CS-B motherboard. These updates might take care of any compatibility problems that earlier motherboard models might have     had, making it possible to use current Ubuntu editions more smoothly.
After noticing that Ubuntu 22.04 operated steadily on the ASUS CS-B motherboard, the group chose to switch from Ubuntu 13.10 to this more recent version. This choice was driven by the goal of utilising Ubuntu 22.04's most recent software features, security updates,      and hardware compatibility changes to provide the best possible computing environment for the team's activities.

### 5.2 Install Operating System in Compute Node


### 2.3. Power Management
--- Design the architecture, integrating 14 ASUS CS-8 motherboards and single-board computers. Provide critical reflections on the chosen design.
## 2. Technology Research: 
--- Conduct comprehensive research on HPC technologies, power management, non-volatile storage, and RAM. Justify technology choices based on problem domain appropriateness. 


The process of installing the operating system on a compute node is similar to that of the head node, with the exception that it is not required the installation of Ubuntu Server specifically.



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


## 3. System Construction:

***Assemble the HPC system, implementing power management and resource-efficient configurations. Configure non-volatile storage and RAM to meet performance requirements.***
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


* Idle Power Consumption (Assuming SSD and GPU are in idle state):





## 5. BIOS Settings


## 6. Networking

* Power Supply Unit (PSU) Capacity:

        Total Output Capacity: 220W
        Maximum Wattage: 60W


* Conclusion:

    The single PSU in our system will be connected to one motherboard, one SSD, and one graphics card. The total power consumption of the system should not exceed the PSU capacity.
    
    The system is expected to consume between 73W - 88W during active use and between 25.05W - 40.05W when idle. Although a single 220W PSU could theoretically handle the load for two motherboards, practical constraints like cable and port limitations restrict each PSU to power only one motherboard in our setup


## 9. Task Implementation:
### 9.1. How to Create Machine Learning for Predict Crypto Currencies

To predict cryptocurrency prices with machine learning, start by fetching historical data (prices, volumes, timestamps) using APIs like Alpha Vantage. Process this data, compute technical indicators (RSI, EMA, SMA), and normalize to ensure uniformity. Split the data into training, validation, and testing sets for model development and evaluation. Consider machine learning models such as Random Forest for its robustness, Gradient Boosting for error minimization, LSTM for capturing long-term dependencies, and GRU for efficient sequential data handling. Fine-tune models using the validation set and assess their performance with metrics like RMSE and MAE on the test set, aiming to select the model that best captures cryptocurrency market dynamics.

[Access the detailed step-by-step guide here](Predicting_Cryptocurrency_Prices_with_ML.md)

## 10. Performance Evaluation:
***Develop a strategy for evaluating HPC system performance.***


## 11. Software and OS Maintenance: 
***Implement a system for updating software and the operating system using cron and Git. • Reflect on the importance of software and OS maintenance in an HPC environment.***



   
## 12. Man Page
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



## Authors


