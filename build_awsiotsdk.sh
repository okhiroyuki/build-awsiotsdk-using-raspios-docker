#!/bin/bash

TAG="v1.21.1"

set -xeu

# Display the OS information
cat /etc/os-release
cat /etc/issue
cat /proc/version
lsb_release -a
lscpu | grep -e "Architecture" -e "Model name"
uname -a

# Install dependencies
apt-get update -y \
&& apt-get install git python3-pip -y --no-install-recommends

# Clone the AWS IoT Device SDK for Python v2 repository
git clone https://github.com/aws/aws-iot-device-sdk-python-v2.git -b $TAG

# Install the dependencies and build the wheel package
cp requirements.txt aws-iot-device-sdk-python-v2/
cd aws-iot-device-sdk-python-v2
python3 -m pip install -r requirements.txt
python3 setup.py bdist_wheel
