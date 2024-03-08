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

7. Power Management:

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

# Configure Network File System (NFS)
The Network File System (NFS) is a networking protocol designed for distributed file sharing. A file system organizes and stores data in the form of files, typically on Hard Disk Drives (HDDs) or Solid-State Drives (SSDs). NFS operates on a similar principle, allowing files to be stored and accessed over a network, enabling multiple devices within the same network to retrieve and share data.

NFS is a widely utilized protocol for file sharing servers, offering compatibility across a broad spectrum of operating systems. In this project, NFS will play a crucial role in facilitating seamless file sharing among all client nodes. In this project, the functionality of NFS can be illustrated using a visualization similar to Figure 1:
<div style="text-align: center;">

![alt text](NFS.PNG)

<p> Figure 1. Network File Sharing </p>
</div>

In this representation:

- The "Head Node" hosts a shared directory containing files.
- The "Client Node" connects to the File Server using NFS.
- The shared directory is mounted on the Client Node, allowing  seamless access to files.
- Applications running on the Client Node can interact with the shared files through the mounted directory.


#
   
#

## Helpful Resources
1. https://www.diva-portal.org/smash/get/diva2:1778251/FULLTEXT03
2. https://www.sharpsightlabs.com/blog/machine-learning-hyperparameters-explained/
3. https://scikit-learn.org/stable/index.html
4. https://www.warse.org/IJATCSE/static/pdf/file/ijatcse351942020.pdf

## Description

## Etc

## References
1. https://hpc.uni.lu/infrastructure/network

## Authors
