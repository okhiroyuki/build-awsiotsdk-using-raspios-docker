#!/bin/bash

echo "Downloading the latest Raspbian Lite image..."
wget https://downloads.raspberrypi.org/raspios_lite_armhf/root.tar.xz -q

echo "Importing the Raspbian Lite image into Docker..."
docker image import --platform linux/arm/v7 ./root.tar.xz raspios-lite-armhf:2022-04-04
