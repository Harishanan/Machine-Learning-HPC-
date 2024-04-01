# **Networking with nm-connection-editor**

## **1. Background of nm-connection-editor**

The nm-connection-editor helps to create new network connections and manage existing network connections in Linux OS. It is a GUI based application.

                sudo nm-connection-editor

By typing the above command in Linux terminal, user can start the nm connection editor application. It is only available in GUI (desktop or GNOME) environment. To instead work with terminal, can use nm-cli connection. It available in all platforms such as terminal, desktop and ssh,or instead, can use nmtui, it is a curses-based application. It works on terminal and desktop and support all the feature of network manager.

<b>Table 1: Comparing nmtui and nm-connection-editor</b>
![nmtui_nmconnections](pictures/nm-connection-nmtui.png)<br>
<br><br>

## **2. Methodology of nm-connection-editor implementation**
 
### **2.1 How to add a new network connection with nm-connection-editor**
<br>

![new_nm_connections](pictures/add-connection.png)<br>
<b>Figure 1:Flow diagram to add a new network connection in nm-connection-editor</b>
<br><br>

(Note: The above flow chart, made in consideration of following static IP address configuration and HPC purpose only.)

In the head node, the nm-connection editor saves all the network configuration files in etc/sysconfig/network-scripts/ directory.

                    sudo nmcli connection show

By using the above command, can verify the made network connections.

                    sudo nmcli connection up [Network Connection name]
By using the above command, can activate the specific network connection.

                    sudo ip address show [Network interface]

After activating network connection, can view the IP configuration of the specific device.
<br>

### **2.2 How to edit a network connection with nm-connection-editor**

![edit_nm_connections](pictures/edit-connection.png)<br>
<b>Figure 2:Flow diagram to edit network connection in nm-connection-editor</b>
<br><br>


                    sudo nmcli connection down [Network Connection name]
		            sudo nmcli connection up [Network Connection name]
After customisation, the Network Manager/ Net plan won’t change the customise options. Therefore, must manually change the customisation by shutting down and turning on network connection.

                    sudo ip address show [Network Interface]
Verify the customised  IP address changed/ updated.
<br>

 ### **2.3 How to delete a network connection with nm-connection-editor**

 
![delete_nm_connections](pictures/delete-connection.png)<br>
<b>Figure 3:Flow diagram to delete a network connection in nm-connection-editor</b>
<br><br>

                    sudo nmcli connection show 
Can verify the connection above was deleted.
<br>


## **3. Networking implemenatation for HPC**

### **3.1 Network bridging**

To implement networking for this project, have used the network bridging format. It has been enabled with two ethernet cables, as follows:
<ol>
<b><li> Internet Sharing Cable</li></b>
<ul>
<li>	Purpose: Used to provide internet access to all network devices in the HPC. </li>

<li>	How it Functions: The HPC's head node has an internet connection through the Wi-Fi adapter, but the other compute nodes do not. Therefore, to share the internet connection with the other compute nodes, this internet sharing cable was established.</li>

<li>	Assigned Port (NIC) Name: en01</li>
</ul>
<b><li> Data Sending Cable</li></b><ul>
<li>Purpose: Used to share data packets or facilitate intra-communication between the nodes in the HPC.</li>

<li>How it Functions: In the HPC, most of the function inputs and packet installations occur in the head node. However, to enable parallel processing, the installed packets have to be present in both the compute node and the head node. Furthermore, the head node must send inputs or tasks to the compute nodes to perform. Therefore, an intra-communication link is needed. To fulfill this purpose, these data sending cables were established on all nodes’ NICs.</li>

<li>Assigned Port (NIC) Name: enp3s0 </li>
</ol>

### **3.2 Static IP Address**

After establishing network connections, it is necessary to assign an IP address to each node to uniquely identify each one in the HPC network. Therefore, we use static IP address configuration. A static IP address means manually assigning an IP address to network devices. In this case, a Class C IPv4 address is used. The given subnet mask is /24 or 255.255.255.0.The assigned IP addresses are shown below in Table 2. Additionally, the table contains the MAC address of each node.

<b>Table 2: IP Address and MAC Address of each node</b>
![ipandmacaddressinfo](pictures/ip&macaddress.png)<br>
<br>

### **3.3 Network implementation in HPC using nm-connection editor**

![nm-connect-implement](pictures/nm-connect-implement.png)<br>
<b>Figure 4:Implementation of networking in HPC using nm-connection-editor</b>
<br>

In accordance with the methodology described in section 2.1, a static IP address was assigned to each node, as detailed in Table 2. Figure 4 illustrates the implementation of this setup. As depicted in Figure 4, this implementation was applied to each node to manage the network within the HPC.

### **3.4 Implemented network topology**


![topology-implement](pictures/startopology.png)<br>
<b>Figure 5: Network topology implemented in HPC</b>
<br>

For this HPC’s network, star network topology has been implemented, as shown in Figure 5. In a star topology, each node is independently connected to a central hub or switch. If one node fails, it does not affect the rest of the network, as each has a direct line to the switch, which facilitates error detection and isolation. This topology is common in Ethernet LANs because of its simplicity and the ease with which systems can be added or removed. In the above can observe two topologies, due to internet sharing and data sharing ethernet connection.


## **4. Testing networking implementation**
### **4.1 Verification of Internet Connection**

![internet_test](pictures/internettest.png)<br>
<b>Figure 6: Internet connection test on compute node</b>
<br>

<ul>
<li>Purpose: To confirm that an internet connection is shared among all nodes.</li>

<li>Method: This is achieved by pinging Google's DNS (Domain Name System) server, as depicted in Figure 6.</li>

<li>Result: As shown in Figure 6, executing the command ping 8.8.8.8 on one of the compute nodes—which targets Google’s DNS Server—successfully verifies that the internet connection is active on that node. This procedure was replicated across all nodes, with each reporting successful outcomes. Therefore, it can be concluded that downloading necessary packages on the compute nodes is feasible, indicating a functioning internet connection across the network.</li>
</ul>

### **4.2. Ping Tests**

![ping_test](pictures/pingtest.png)<br>
<b>Figure 7: Ping test on compute node</b>
<br>

<ul>
<li>Purpose: To verify basic connectivity between nodes and measure the round-trip time (RTT) for packets.</li>

<li>Method: The method involves using the ping command to send ICMP (Internet Control Message Protocol) echo requests to each node, as illustrated in Figure 7.</li>

<li>Result: As depicted in Figure 7, on one of the compute nodes, executing the command ping 192.168.0.10 targets the head node's IP address and successfully completes the ping test. This test was similarly conducted across all nodes, yielding successful outcomes. This demonstrates that connectivity between nodes is established, allowing for effective communication and coordination within the network.</li>
</ul>

 ## **5. Helpful Resources**
 1. How to implement nm-connection editor: https://help.ubuntu.com/community/NetworkManager

2. Star topology information: https://www.techtarget.com/searchnetworking/definition/star-network

3. Network bridge implementation information: https://www.howtogeek.com/892923/what-is-a-network-bridge-and-should-you-use-one/
