#!/bin/bash

wget https://downloads.raspberrypi.org/raspios_lite_armhf/root.tar.xz -q

docker image import ./root.tar.xz raspios-lite-armhf:2022-04-04

docker images
