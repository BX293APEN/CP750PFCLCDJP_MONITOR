#!/usr/bin/env bash

echo 'ATTR{idVendor}=="0764", ATTR{idProduct}=="0601", MODE="0666"' | sudo tee /etc/udev/rules.d/99-nut-usb.rules
sudo udevadm control --reload
sudo udevadm trigger