#!/bin/bash

echo "----------------------------------"
echo "Preprocess for docker image..."

echo "-------------------"
FILE="/usr/bin/python3"
if [ -f "$FILE" ]; then
    echo "No need to install python3"
else 
    echo "$FILE does not exist."
    echo "Install packages for being controlled by ansible"
    apt-get update
    apt-get install -y python3 python3-pip
fi
echo "-------------------"

echo "Preprocess end"
echo "----------------------------------"
