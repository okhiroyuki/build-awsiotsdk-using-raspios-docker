#!/bin/bash

TAG="v0.20.5"

set -xeu

# Display the OS information
cat /etc/os-release
cat /etc/issue
cat /proc/version
lsb_release -a
lscpu | grep -e "Architecture" -e "Model name"
uname -m

# Install dependencies
apt-get update -y \
&& apt-get install git python3-pip cmake python3-dev -y --no-install-recommends

# Set the default directory for the safe command
git config --global --add safe.directory /app

python3 -V

# # Clone the AWS Common Runtime (CRT) for Python repository
# git clone https://github.com/awslabs/aws-crt-python.git -b $TAG
# cd aws-crt-python
# git submodule update --init
# python3 -m pip install .

# # Install the dependencies and build the wheel package
# python3 setup.py bdist_wheel
