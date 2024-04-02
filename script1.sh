#!/bin/bash 

# The first argument is the package name to install.
PACKAGE_NAME=$1

# Client machine details (add more as needed).
CLIENT_USERS=("username1" "username2" "username3" "username4" "username5")
CLIENT_HOSTS=("192.2143" "client_host_address2" "client_host_address3" "client_host_address4" "client_host_address5")

while getopts ":i:u:" opt; do
  case ${opt} in
    i ) ACTION="install"; PACKAGE_NAME=$OPTARG ;;
    u ) ACTION="remove"; PACKAGE_NAME=$OPTARG ;;
    \? ) echo "Usage: cmd [-i] for install or [-u] for uninstall followed by <package_name>"; exit 1 ;;
  esac
done

# Ensure the package name is provided
if [ -z "$PACKAGE_NAME" ]; then
    echo "Usage: $0 <package_name>"
    exit 1
fi

# Function to check if a package is installed on the local system
check_package_installed() {
    dpkg -l "$1" &> /dev/null
    return $?
}

# Check if the package is already installed or not on the host
if [ "$ACTION" = "install" ]; then
    if check_package_installed "$PACKAGE_NAME"; then
        echo "Package $PACKAGE_NAME is already installed on the host."
        exit 0
    fi
elif [ "$ACTION" = "remove" ]; then
    if ! check_package_installed "$PACKAGE_NAME"; then
        echo "Package $PACKAGE_NAME is not installed on the host."
        exit 0
    fi
fi

echo "Scanning for active hosts..."
# Using nmap to scan for active hosts and extracting IP addresses and hostnames
MAP_OUTPUT=$(nmap -sn 192.168.1.0/24 -oG - | awk '/Up$/{print $2" "$3}')

# Initialize empty arrays for hosts and users
CLIENT_HOSTS=()
CLIENT_USERS=()

# Parse the MAP_OUTPUT to fill CLIENT_HOSTS and CLIENT_USERS
while IFS= read -r line; do
    # Extracting IP and hostname from the line
    IP=$(echo "$line" | cut -d ' ' -f 1)
    HOSTNAME=$(echo "$line" | cut -d ' ' -f 2 | tr -d '()')

    # Adding IP to CLIENT_HOSTS
    CLIENT_HOSTS+=("$IP")

        if [ -n "$HOSTNAME" ]; then
        CLIENT_USERS+=("$HOSTNAME")
    else
        
        CLIENT_USERS+=("node1")
    fi
done <<< "$MAP_OUTPUT"

# Install the package on the host machine.
echo "Updating repositories and installing $PACKAGE_NAME on the host..."
sudo apt-get update && sudo apt-get install -y $PACKAGE_NAME

# Check if the package installed successfully on the host.
if [ $? -eq 0 ]; then
    echo "Package $PACKAGE_NAME installed successfully on the host."
else
    echo "Failed to install package $PACKAGE_NAME on the host."
    exit 1
fi

# Loop through the client hosts and install the package on each.
for i in "${!CLIENT_HOSTS[@]}"; do
    CLIENT_USER=${CLIENT_USERS[$i]}
    CLIENT_HOST=${CLIENT_HOSTS[$i]}

    echo "Installing $PACKAGE_NAME on the client $CLIENT_HOST..."

    if [ "$ACTION" = "install" ]; then
        PACKAGE_CHECK_COMMAND="dpkg -l $PACKAGE_NAME &> /dev/null || (sudo apt-get update && sudo apt-get install -y $PACKAGE_NAME)"
    elif [ "$ACTION" = "remove" ]; then
        PACKAGE_CHECK_COMMAND="dpkg -l $PACKAGE_NAME &> /dev/null && sudo apt-get remove -y $PACKAGE_NAME"
    fi

    ssh $CLIENT_USER@$CLIENT_HOST "sudo apt-get update && sudo apt-get install -y $PACKAGE_NAME" #Seb fork into background &, then add new while, with the command which ${PACKAGE_NAME}, when it returns package it is installed, maybe add a timer too?

    # Check if the SSH command was successful.
    if [ $? -eq 0 ]; then
        echo "Package $PACKAGE_NAME installed successfully on the client $CLIENT_HOST."
    else
        echo "Failed to install package $PACKAGE_NAME on the client $CLIENT_HOST."
    fi
done

