#!/bin/bash

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

# Clone the AWS Common Runtime (CRT) for Python repository
git clone https://github.com/awslabs/aws-crt-python.git -b v0.20.5
git config --global --add safe.directory /app
cd aws-crt-python
git submodule update --init
python3 -m pip install .

# Install the dependencies and build the wheel package
python3 setup.py bdist_wheel
