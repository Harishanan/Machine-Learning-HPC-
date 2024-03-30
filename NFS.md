# Configuring NFS In Head Node

This file outlines the steps to configure NFS in a Network.

## Prerequisites
All the nodes must be ina same network and should be able to ping each other. It is suggested to configure Open SSH aswell. 

1. Install nfs-server in the head node.
      
         sudo apt update
         sudo apt-get install nfs-server

2. Establish a shared directory on the head node and modify the '/etc/exports' file to grant permission to all client nodes to access the '/nfs' directory.  

         mkdir /nfs
         sudo nano /etc/exports
         # add the following line inside /etc/exports
         /nfs *(rw,sync)

3. Restart nfs-kernel-server
         
         sudo systemctl nfs-kernel-server restart

4. Changing the ownership of '/nfs' from root to user

         sudo chown #username /nfs

5. Check the ownership of the file to be sure

         ls -ld /nfs

### Configuring NFS In Client Node

1. Install nfs-client in the client node 

         sudo apt update
         sudo apt-get install nfs-client

2. Create a similar shared directory '/nfs' as headnode

         mkdir /nfs 

3. Navigate to the '/etc/fstab' file and add the file system to be mounted on the client node.
   
         sudo nano /etc/fstab
         #add the following line to mount /nfs 
         headnode_username:/nfs /nfs nfs

      #### NOTE: if you get an error while unmounting the file in client node, you can use ip-address of headnode instead of username 

4. Restart daemon if necessary 

         sudo systemctl daemon-reload

5. Mount all file partitions.

         sudo mount -a


After following the steps provided above, users will be able to configure NFS on their cluster computers. After configuring NFS, the resource management system should be set up to handle processes.