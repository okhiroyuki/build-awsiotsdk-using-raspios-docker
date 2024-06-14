#!/bin/bash

TAG="v0.20.5"

set -xeu

# Clone the AWS Common Runtime (CRT) for Python repository
git clone https://github.com/awslabs/aws-crt-python.git -b $TAG
cd aws-crt-python
git submodule update --init
python3 -m pip install .

# Install the dependencies and build the wheel package
python3 setup.py bdist_wheel

ls -R dist
