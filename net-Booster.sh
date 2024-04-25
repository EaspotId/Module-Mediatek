#!/bin/bash

# Menu for selecting script
echo "Please select the script to run:"
echo "1. Net Booster"
echo "2. Other Script"
echo -n "Enter your choice (1 or 2): "
read choice

case $choice in
    1)
        # Welcome message for Net Booster
        echo "***************************************"
        echo "*** Goten | Open Source Free ***"
        echo "       *** Use with caution ***"
        echo "     *** Developer: @Evoloser ***"
        echo "*** Join group: @GotenOpenSource ***"
        echo "       *** Channel: @GotenOpenSource ***"
        echo " **************************************"
        echo "      ******* Net Booster *******"
        echo " ***** Be a helpful person ****"
        echo "     *** To everyone *** "
        echo " Not taking advantage of everyone "
        ;;
    2)
        # Welcome message for Other Script
        echo "Welcome to Other Script"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Ensure root access
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Disable IPv6
echo "Disabling IPv6..."
echo "1" > /proc/sys/net/ipv6/conf/all/disable_ipv6 || { echo "Error: Unable to disable IPv6"; exit 1; }
echo "1" > /proc/sys/net/ipv6/conf/default/disable_ipv6 || { echo "Error: Unable to disable IPv6"; exit 1; }
echo "IPv6 has been disabled successfully."

# Optimize TCP bandwidth usage (example settings)
echo "Optimizing TCP bandwidth usage..."
echo "16777216" > /proc/sys/net/core/rmem_max || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "16777216" > /proc/sys/net/core/wmem_max || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "4096 87380 16777216" > /proc/sys/net/ipv4/tcp_rmem || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "4096 65536 16777216" > /proc/sys/net/ipv4/tcp_wmem || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "1" > /proc/sys/net/ipv4/tcp_window_scaling || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "1" > /proc/sys/net/ipv4/tcp_timestamps || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "1" > /proc/sys/net/ipv4/tcp_sack || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }
echo "1" > /proc/sys/net/ipv4/tcp_no_metrics_save || { echo "Error: Unable to optimize TCP bandwidth"; exit 1; }

echo "TCP bandwidth optimization completed."

# Clean DNS cache (optional, might cause reboot on some devices)
#echo "Cleaning DNS cache..."
#setprop ctl.restart netd || { echo "Error: Unable to clean DNS cache"; exit 1; }

echo "Network boosting completed."
