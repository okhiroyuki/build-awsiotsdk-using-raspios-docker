#!/bin/bash

TAG="v0.20.5"

set -xeu

# Display the OS information
# cat /etc/os-release
# cat /etc/issue
# cat /proc/version
# lsb_release -a
# lscpu | grep -e "Architecture" -e "Model name"

# Install dependencies
sudo apt-get update -y

# Install dependencies refs: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt-get install git cmake \
build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
-y --no-install-recommends

# Install pyenv
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Python Install
pyenv install


# Display the OS information
uname -m # CPU architecture
uname -o # OS
python3 -V
git --version
cmake --version

# Clone the AWS Common Runtime (CRT) for Python repository
git clone https://github.com/awslabs/aws-crt-python.git -b $TAG
cd aws-crt-python
git submodule update --init
python3 -m pip install .

# Install the dependencies and build the wheel package
python3 setup.py bdist_wheel
