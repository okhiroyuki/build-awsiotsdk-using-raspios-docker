#!/bin/bash

TAG="v1.21.1"

set -xeu

# Clone the AWS IoT Device SDK for Python v2 repository
git clone https://github.com/aws/aws-iot-device-sdk-python-v2.git -b $TAG

# Install the dependencies and build the wheel package
cp requirements.txt aws-iot-device-sdk-python-v2/
cd aws-iot-device-sdk-python-v2
python3 -m pip install -r requirements.txt
python3 setup.py bdist_wheel
