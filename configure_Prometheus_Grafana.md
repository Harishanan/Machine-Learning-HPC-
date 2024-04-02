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
![prometheus](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/115148130/dcefdc5f-dc1a-4a9a-9c6f-a670e4c17083)
<b>Figure .1 shows the prometheus yml file   </b>
<br><br>

## Creating Prometheus Systemd file
In this section I created a service file that sets up its startup and states its service type and users. I then reloaded the system to confirm the setup. The code used will be included in the appendix. 
![system MD-Prom](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/115148130/ecd478a6-f445-4c58-99ae-7a304370358c)
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
