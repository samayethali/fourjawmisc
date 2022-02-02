#!/bin/bash
USBNAME=239a:800f #Put here the usb ID
LSUSB=$(lsusb | grep --ignore-case $USBNAME)
FOLD="/dev/bus/usb/"$(echo $LSUSB | cut --delimiter=' ' --fields='2')"/"$(echo $LSUSB | cut --delimiter=' ' --fields='4' | tr --delete ":")
echo $LSUSB
echo $FOLD
sudo wget https://gist.githubusercontent.com/x2q/5124616/raw/bf21dbda4a67de2c2d15d6c66b1e1bd0b1db7e1b/usbreset.c -O /usr/bin/usbreset.c
sudo gcc -o /usr/bin/usbreset /usr/bin/usbreset.c
sudo /usr/bin/usbreset $FOLD; #The path where you have the usbreset executable
