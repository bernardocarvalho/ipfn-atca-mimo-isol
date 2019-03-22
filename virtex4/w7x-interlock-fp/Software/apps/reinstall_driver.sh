#!/bin/bash
echo REINSTALLING DRIVER
modName=atca_ioc_w7x_intrlck
rmmod $modName
insmod ../driver/atca_ioc_w7x_intrlck.ko
lsmod | grep atca
