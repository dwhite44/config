#!/bin/bash

# Settings
HOSTS_FILE="/mnt/c/Windows/System32/drivers/etc/hosts"
HOSTNAME="wsl.local"
MARKER="# updated by wsl update-windows-hosts script"

# Get WSL2 IP
WSL_IP=$(hostname -I | awk '{print $1}')
HOST_ENTRY="${WSL_IP}${HOSTNAME}	${MARKER}"

# Remove previous entry
sed -i "/${HOSTNAME}.*${MARKER}/d" "$HOSTS_FILE"

# Remove all trailing blank lines from hosts file
sed -i '/^\s*$/d' "$HOSTS_FILE"

# Add new entry
#printf "%s" ${HOST_ENTRY} | tee -a "$HOSTS_FILE" > /dev/null
printf "\n\n%s\t%s\t%s" $WSL_IP $HOSTNAME "$MARKER" | tee -a "$HOSTS_FILE" > /dev/null

echo "Added ${WSL_IP} as ${HOSTNAME} to hosts file."
