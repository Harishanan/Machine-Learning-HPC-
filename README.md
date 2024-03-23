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

# PXE Server Configuration on Ubuntu 

PXE stands for Preboot Execution Environment is a set of guidelines that allow a computer to boot an operating system (OS) via a network connection. In this project, the PXE Server was initially considered but ultimately not utilized due to technical challenges. Despite multiple attempts to configure PXE, the plan had to be abandoned due to technical issues. Instead, the group opted for a Static Interface Configuration approach for data sharing. Even though PXE booting was unsuccessful, the configuration details of the PXE Server were documented for future reference.

The basic topology for PXE Server is shown below:

![access SSH](topology.png)<br>
<b>Figure 1: Basic Topology for PXE</b>
<br><br>

The packages used for the configuration are given below in table:

|   Protocol    |   Package Name    |   Description |
|---------------|-------------------|-------------- |
|  DHCP server  | dnsmasq           | DHCPD stands for Dynamic Host Configuration Protocol whcich allocates IP address to Client Node from a predefined pool. This ensures that the client nodes can communicate and access network resources.
|  TFTP server  | tftpd-hpa         | TFTP stands for Trivial File Transfer Protocol which is used for transfering files between devices on a network. It is a lightweight protocol which lacks advanced features like authentication and directory listing. 
|  FTP Server   | vsftpd            | File Transfer Protocol is similar to TFTP which supports various commands for navigating directories, uploading, downloading, renaming, and deleting files on the server. 
|   HTTP        | apache2           |HTTP is a flexible and extensively used protocol that offers a convenient way to communicate and transfer data within cluster computing setups.
|   NFS         | nfs-kernel-server | [NFS Configuration](https://github.com/TeachingMaterial/ace-2023_-team-0/tree/documentation/Configure-NFS-sameyr)

**Step 1: Required Package Installation**

Following command can be used to install DHCP, TFTP, FTP, HTTP:

        sudo apt-get install dnsmasq nfs-kernel-server vsftpd apache2 samba

**Step 2: Configuration of pxe.conf file**

If the pxe.conf file does not exist, it should be created. If it already exists, it needs to be modified to specify the range of IP addresses that the DHCPD server should use when allocating addresses to compute nodes. the pxe.conf file can be accessed by using this command:

        sudo nano /etc/dnsmasq.conf.d/pxe.conf

The PXE configuration file should closely resemble the following according to the requirements:

        interface=eno1
        bind-interfaces
        dhcp-range=192.168.0.100,192.168.0.200
        dhcp-boot=pxelinux.0
        dhcp-match=set:efi-x86_64,option:client-arch,7
        dhcp-boot=tag:efi-x86_64,bootx64.efi
        enable-tftp
        tftp-root=/srv/tftp

After changing the configuration file. dnsmasq service should be restarted using the following command:
        
        sudo systemctl restart dnsmasq.service
    

**Step 3: Required directories creation to store PXE boot file** 

Following the configuration of the pxe.conf file, various directories will be created to store different files required for PXE booting. The following command can be used to make images, kernel, BIOS and UEFI directories:

        mkdir -pv /tftpboot/{images,kernels,BIOS,UEFI}

The image directory will store the Ubuntu image, while the kernel directory will store Ubuntu's kernel files. The UEFI/BIOS directory will contain PXE configuration files. Additionally, the permissions of the tftpboot directory should be adjusted to ensure accessibility to all client nodes in the future. 

        sudo chmod 777 -R /tftpboot

**Step 4: Installation of required pxe packages**

This step is crucial as it involves installing all the necessary PXE bootable files. Failure to complete this step properly will result in the PXE boot process not functioning correctly.

Command to install syslinux and pxelinux:

        sudo apt-get install syslinux pxelinux

All downloaded files that are required should be copied to the previously created directories.

***UEFI FILES***

        cp -av /usr/lib/syslinux/modules/efi64/{ldlinux.e64,libcom32.c32,libutil.c32,vesamenu.c32} /tftpboot/UEFI
        
        cp -av /usr/lib/SYSLINUX.EFI/efi64/syslinux.efi /tftpboot/UEFI

***BIOS FILES***

        cp -av /usr/lib/PXELINUX/pxelinux.0 /tftpboot/BIOS
        cp -av /usr/lib/syslinux/modules/bios/{ldlinux.c32,libcom32.c32,libutil.c32,vesamenu.c32} /tftpboot/BIOS

**Step 5: Configuratio of DHCP & TFTP Server**

Before setting up the DHCP, it's necessary to edit the '/etc/default/tftp-hpa' file to assign the LAN interface. To confirm the LAN interface, the following command can be used:

                ip a

This command displays all active interfaces, including their MAC addresses and IP addresses. In this project, the 'eno1' interface is being utilized.

After identifying the interface name, modifications were made to the '/etc/default/tftp-hpa' file, adding the following configuration settings.


        at << EOF > /etc/dnsmasq.conf
        interface=eno1
        bind-interfaces
        
        #dhcp-range=ens33,192.168.100.100,192.168.100.240,255.255.255.0,8h
        dhcp-range=$ethInt,192.168.2.2,192.168.2.254,255.255.255.0,8h
        dhcp-option=option:router,192.168.2.1
        dhcp-option=option:dns-server,192.168.2.1
        dhcp-option=option:dns-server,8.8.8.8
        
        enable-tftp
        #tftp-root=/netboot/tftp
        tftp-root=/tftpboot
        #dhcp-boot=pxelinux.0,linuxhint-s20,192.168.2.1
        dhcp-boot=pxelinux.0
        pxe-prompt="Press F8 for PXE Network boot.", 2
        # PXEClient:Arch:00000
        pxe-service=X86PC, "Boot BIOS PXE", BIOS/pxelinux
        # PXEClient:Arch:00007
        pxe-service=BC_EFI, "Boot UEFI PXE-BC", UEFI/syslinux.efi
        # PXEClient:Arch:00009
        pxe-service=X86-64_EFI, "Boot UEFI PXE-64", UEFI/syslinux.efi
        EOF

After modifying the configuration file, it's crucial to restart the service; otherwise, the changes made to the configuration will not take effect. Following command can be utilized for restarting the dnsmasq services.

        sudo systemctl restart dnsmasq
        sudo systemctl status dnsmasq


**Step 6. Downloading OS Image**

To download the ubuntu image for PXE booting, ubuntu netboot image should be downloaded. Following command can be used for fetching ubuntu 20.04 netboot image form official Ubutnu arcive.  

        wget http://archive.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/current/legacy-images/netboot/mini.iso

Upon acquiring the image, mounting it can be achieved using the subsequent command.

        mout -o loop mini.iso /mnt

Following the mounting of the netboot image, kernel files must be copied to their respective directories.

        sudo mkdir -pv /tftpboot/kernels/ubuntu2004
        sudo cp -av /mnt/casper/{initrd,vmliniuz} /tftpboot/kernels/ubuntu2004

Subsequntly, entire OS imae can be copied to `/image` directory wich was created before:

        mkdir -pv /tftpboot/images/ubuntu2004
        rsync -av --progress /mnt/* /tftpboot/images/ubuntu2004
        umount /mnt

**Setting up FTP Server**

OS image will be mounted under the image directory within FTP, a new directory can be created inside FTP using the following command. Subsequently, the required permissions should be assigned to the directory.

        cd /srv/ftp
        mkdir -pv pub

        sudo chmod -R 777 /srv/ftp/pub

Once a directory is created, the OS image can be mounted, making it easier to share with other compute nodes. The following command can be utilized for this process:

        sudo mkdir /srv/ftp/pub/images

        sudo mount --bind /tftp/images /srv/ftp/pub/images 

FTP service shpuld be restarted to apply all the changes:

        sudo systemctl enable vsftpd
        sudo systemctl start vsftpd
        sudo systemctl status vsftpd

***NOTE: NFS configuration wont be provided in this file but can be followed goig to the link provided.*** [NFS Configuration](https://github.com/TeachingMaterial/ace-2023_-team-0/tree/documentation/Configure-NFS-sameyr)


**Step 7. Adding PXE boot Menu**

A PXE boot menu will be generated and displayed on the client node during the PXE boot process. This menu will provide options for downloading the operating system. To create a boot menu, a file should be created which will hold all the inormation hat will be shown to he user in client node. following command is used to create a boot menu.

        sudo mkdir -vp /tftpboot/pxelinux.cfg/
        touch /tftpboot/pxelinux.cfg/default

After creating the default file, the following line can be added to display a message during the PXE booting process.

        default menu.c32
        prompt 0
        timeout 300
        TIMEOUT local
        menu title ########## PXE Boot Menu ##########        

*Note: The boot menu can be customized according to the user's preferences, and it is not necessary to replicate the exact configuration as above.*



## References
1. https://hpc.uni.lu/infrastructure/network
2. https://dlcdnimgs.asus.com/websites/global/aboutASUS/OS/Linux_Status_report_202312.pdf
3. https://medium.com/jacklee26/set-up-pxe-server-on-ubuntu20-04-and-window-10-e69733c1de87

## Authors


