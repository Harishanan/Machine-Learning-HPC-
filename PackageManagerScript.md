## Cluster Package Management Script

### Script Breakdown

1. Display Usage Information

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/aa28cc31-584c-4d2c-832c-fbcab50bfabd)

&nbsp; This function provides the user with information on how to use the script correctly. It is called when the script is run without arguments or &nbsp;with invalid options.

2. Parse Command-Line Options

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/fdfd4e44-7990-4ed6-b65e-09d985b36082)

&nbsp;This snippet processes the command-line options passed to the script, determining whether the user wishes to install or uninstall a package. It &nbsp;calls the usage function if an invalid option is provided.

3. Check for Package Name Argument

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/c4cd04ec-e28a-4595-9580-d242c32ff763)

&nbsp; After option parsing, the script checks if the package name has been specified. If not, it displays the usage information.

4. Perform Action on the Host

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/96acc7c7-03df-4d6d-b395-b0461172c04a)


perform_action_local function defines and calls a function to install or uninstall the package on the host system, based on the previously set ACTION variable.

5. Scan for Active Hosts

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/627f3cbb-55ca-4586-9e71-ca789b4ff5d9)

The above code utilizes nmap to scan for active hosts within the subnet 192.168.0.1/24. The output is processed to extract IP addresses and hostnames.

6. Identify Client Hosts and Users

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/fce71ad6-9851-4212-903d-dadcde82fde5)

This part parses the output from the previous step, filtering out the head node and preparing a list of client hosts and corresponding user names for SSH access.

7. Perform Action on Client Nodes

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/d841e167-9d5c-4961-8bc5-7de728b1d4c7)

perform_action_client function performs the specified action (install/uninstall) on each client node via SSH, then iterates over the list of client hosts and users to apply these actions concurrently.

8. Finalize Operations

![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/72d9b014-47f1-4191-9d43-8a9411ebbbd1)

Finally, waits for all background operations (SSH commands) to complete, then prints a message indicating that the script has finished executing ([Full Script can be found here](packageManager.sh))

