#!/bin/bash

set -xeu

# Display the OS information
cat /etc/os-release
cat /etc/issue
cat /proc/version
lsb_release -a
lscpu | grep -e "Architecture" -e "Model name"
uname -a

# Display the installed software versions
python3 --version
git --version
cmake --version
