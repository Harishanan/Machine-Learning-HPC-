#! /usr/bin/env bash

# Function to show current CPU scaling governor
show_current_governor() {
    echo "Current CPU Scaling Governor(s):"
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    do
        echo -n "$(basename $(dirname $cpu)) : "
        cat $cpu
    done
}

# Function to change the CPU scaling governor
change_governor() {
    echo "Available governors: performance powersave ondemand userspace conservative"
    read -p "Enter the desired governor: " governor

    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    do
        echo $governor > $cpu
    done

    echo "CPU Scaling Governor changed to $governor."
    show_current_governor
}

# Main menu
echo "CPU Scaling Governor Management"
echo "1. Show current CPU Scaling Governor"
echo "2. Change CPU Scaling Governor"
read -p "Please choose an option (1 or 2): " option

case $option in
    1)
        show_current_governor
        ;;
    2)
        change_governor
        ;;
    *)
        echo "Invalid option selected. Exiting."
        exit 1
        ;;
esac

exit 0

