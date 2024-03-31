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

# Cooling Calculations

### 1.	Heat Dissipation Calculation:

####  1.1.  Caluclating Power Consumption for each component:

   *	CPU – 84 Watt  (https://www.cpu-world.com/CPUs/Core_i5/Intel-Core%20i5-4590.html )
   *	GPU – 45Watt (https://www.techpowerup.com/gpu-specs/quadro-k620.c2600 )
   *	Single Board – it is not going to generate too much power. (It is not used)
   *	RAM – 3 Watt (https://uk.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use#:~:text=As%20a%20rule%20of%20thumb,the%20voltage%20beyond%20XMP%20settings.)
   *	Power Supply – 132.50W
   *	SSD - 4 Watt (https://www.windowscentral.com/samsung-860-evo-review) 

####   1.2.	Sum up Power Consumption values for all components

      = Power Consumption (CPU + GPU + RAM + Power Supply + SSD)

      = (84 + 45 + 3 + 132.50 + 4) Watts

      = 268.50 Watt 

   Total Power Consumption for head Node is 268.50 Watt 

#### 1.3. To Calculate Heat Dissipation in BTU/Hr:

   *NOTE: One BTU per hour is the energy needed to heat One Pound of Water to 1°F, for one hour*

   Multplying Total Power Consumption  *  3.4192  (https://www.se.com/uk/en/faqs/FA213115/#:~:text=To%20calculate%20heat%20dissipation%2C%20multiply,is%20equal%20to%20BTU%20%2F%20HR.)

      = 268.50 * 3.4192
      
      = Approx. 920 BTU/Hr

   Taking into consideration, that onlu head node is using GPU, the heat dissipation of compute node will be :

         = Power Consumption (CPU + RAM + Power Supply + SSD) * 3.4192

         = (84 + 3 + 132.50 + 4) * 3.4192

         = 223.5 * 3.4192

         = 764.2 BTU/hr

#### 1.4 Requirement taken into Consideration while choosing the fan :

   * Size: Utilizing four fans of approximately 120mm, the standard dimension for case fans, is the chosen configuration.
   * Speed:
   * Connector: Fans are selected to be compatible with the motherboard's fan headers, featuring a 4-pin connector.
   * Noise level: Priority is given to fans with a low noise level to guarantee quieter system operation.
  
#### 1.5 Cooling Calculation:

   * Fan used in this project:
      
      Akasa 120mm LED Computer Fan with an airflow of approx. 40 CFM

   * Converting CFM(Cubic Feet Per Minute) to CMH (Cubic Meter Per Hour)
      
         1CFM = 1.699CMH

         40CFM = 40 * 1.699 = 67.96 CMH

   * As we are using 4 fans, total CMH will be:

         = 4 * 67.96 CMH = 271.84 CMH.  
   
      Now lets see if the airflow provided by fan is sufficient to dissipate the heat generated by the system effectively. 

      * `Airflow (CMH) = Total Heat Dissipiation (BTU/hr) / (ΔT * 1.08)` where,
      `∆T = Change in Temperature`

      Typical change in temperature for this kind of system is 17 to 20 ⁰C , but as there are in-built fan present for CPU, GPU and Power supply, the change in temperature will be approx. 14 - 15 ⁰C. Therefore, Airflow needed to te system will be :

      * Required Airflow for head node(CMH) 
            
            = 920 / 15 * 1.08 
            = 56.8 CMH.

      * Required Airflow for compute node(CMH)
            
            = 764.2 / 15 * 1.08 (for head node)
            = 47.2 CMH.

      * Total Airflow required 
               
            = Airflow needed for head node + 4 * (Airflow needed for compute node)
             = 56.8 + 4 * 47.2 
             = 56.8 + 188.8
             = 245.6 CMH
  
      Therefore, the total airflow required in the system which is 245.6 CMH is less than air flow which is provided by the fan which is 271.84 CMH.

   

#### 1.6.	3D Model 
 The selection of the fan was made with careful consideration of various factors, and a dual-fan system was chosen. Two fans are positioned at the front of the case to intake cool air, while another two are situated at the back to expel hot air as depicted in Figure 1. This configuration creates an airflow pattern that helps maintain optimal temperatures for all components.

   Additionally, the CPU fan, which is attached to the motherboard, provides active cooling for the CPU. Moreover, the GPU and power supply unit also have built-in fans for additional cooling.

   ![Fan Placement](fanplacement.png)<br>
   <b>Figure 1: 3D Model of Case with the fan where a) represents the front 3D view and b) represent the back 3D view </b>
   <br>

2. **Examination**

   A heat gun was employed to assess the heat dissipation of the entire system under two conditions: with the fan operational and with the fan deactivated.

## References
1. https://hpc.uni.lu/infrastructure/network
2. https://dlcdnimgs.asus.com/websites/global/aboutASUS/OS/Linux_Status_report_202312.pdf
3. 

## Authors


