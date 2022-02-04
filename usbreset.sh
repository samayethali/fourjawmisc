#!/bin/bash
USBNAME=239a:800f #Put here the usb ID
LSUSB=$(lsusb | grep --ignore-case $USBNAME)
FOLD="/dev/bus/usb/"$(echo $LSUSB | cut --delimiter=' ' --fields='2')"/"$(echo $LSUSB | cut --delimiter=' ' --fields='4' | tr --delete ":")
echo $LSUSB
echo $FOLD
sudo gcc -o ~/usbreset/reset.o ~/usbreset/reset.c
sudo ~/usbreset/reset.o $FOLD; #The path where you have the usbreset executable
