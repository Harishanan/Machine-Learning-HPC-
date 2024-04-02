## Step 1: Required Package Installation

Following command can be used to install DHCP, TFTP, FTP, HTTP:

        sudo apt-get install dnsmasq nfs-kernel-server vsftpd apache2 samba

## Step 2: Configuration of pxe.conf file

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
    

## Step 3: Required directories creation to store PXE boot file

Following the configuration of the pxe.conf file, various directories will be created to store different files required for PXE booting. The following command can be used to make images, kernel, BIOS and UEFI directories:

        mkdir -pv /tftpboot/{images,kernels,BIOS,UEFI}

The image directory will store the Ubuntu image, while the kernel directory will store Ubuntu's kernel files. The UEFI/BIOS directory will contain PXE configuration files. Additionally, the permissions of the tftpboot directory should be adjusted to ensure accessibility to all client nodes in the future. 

        sudo chmod 777 -R /tftpboot

## Step 4: Installation of required pxe packages

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

## Step 5: Configuratio of DHCP & TFTP Server

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


## Step 6. Downloading OS Image

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


## Step 7. Adding PXE boot Menu

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
