#! /usr/bin/env bash

# Usage function to display help text
usage() {
    echo "Usage: $0 -i|-u <package_name>"
    echo "  -i  Install package"
    echo "  -u  Uninstall package"
    exit 1
}

# Parse command-line options
while getopts ":iu" opt; do
    case ${opt} in
        i ) ACTION="install";;
        u ) ACTION="remove";;
        \? ) usage;;
    esac
done
shift $((OPTIND -1))

# Check if package name is provided
PACKAGE_NAME=$1
if [ -z "$PACKAGE_NAME" ]; then
    usage
fi

# Function to check if a package is installed
check_package_installed() {
    dpkg -l "$1" &> /dev/null
    return $?
}

# Function to perform the specified action on the local system
perform_action_local() {
    if [ "$ACTION" = "install" ] && check_package_installed "$PACKAGE_NAME"; then
        echo "Package $PACKAGE_NAME is already installed on the host."
        return 0
    elif [ "$ACTION" = "remove" ] && ! check_package_installed "$PACKAGE_NAME"; then
        echo "Package $PACKAGE_NAME is not installed on the host."
        return 0
    fi

    if [ "$ACTION" = "install" ]; then
        echo "Updating repositories and installing $PACKAGE_NAME on the host..."
        sudo apt-get update && sudo apt-get install -y "$PACKAGE_NAME"
    elif [ "$ACTION" = "remove" ]; then
        echo "Removing $PACKAGE_NAME from the host..."
        sudo apt-get remove -y "$PACKAGE_NAME"
    fi

    if [ $? -eq 0 ]; then
        echo "Package $PACKAGE_NAME $ACTION successfully on the host."
    else
        echo "Failed to $ACTION package $PACKAGE_NAME on the host."
        exit 1
    fi
}

# Perform action on the local system
perform_action_local

# Scanning for active hosts
echo "Scanning for active hosts..."
MAP_OUTPUT=$(nmap -sn 192.168.0.1/24 -oG - | awk '/Up$/{print $2" "$3}')

# Initialize empty arrays for hosts and users
CLIENT_HOSTS=()
CLIENT_USERS=()

# Parse the MAP_OUTPUT to fill CLIENT_HOSTS and CLIENT_USERS
while IFS= read -r line; do
    IP=$(echo "$line" | cut -d ' ' -f 1)
    HOSTNAME=$(echo "$line" | cut -d ' ' -f 2 | tr -d '()')

    if [[ "$HOSTNAME" != "headnode" ]]; then
       HOSTNAME=${HOSTNAME/node/slave}
       CLIENT_HOSTS+=("$IP")
       CLIENT_USERS+=("${HOSTNAME:-slave1}")
    fi
   done <<< "$MAP_OUTPUT"

# Function to perform the specified action on a client
perform_action_client() {
    local CLIENT_HOST=$1
    local CLIENT_USER=$2

    echo "Processing $CLIENT_HOST..."

    if [ "$ACTION" = "install" ]; then
        ssh "$CLIENT_USER@$CLIENT_HOST" "sudo apt-get update && sudo apt-get install -y $PACKAGE_NAME" &
    elif [ "$ACTION" = "remove" ]; then
        ssh "$CLIENT_USER@$CLIENT_HOST" "sudo apt-get remove -y $PACKAGE_NAME" &
    fi
}

# Loop through clients and perform the action in parallel
for i in "${!CLIENT_HOSTS[@]}"; do
    perform_action_client "${CLIENT_HOSTS[$i]}" "${CLIENT_USERS[$i]}"
done

wait
echo "All client operations completed."
