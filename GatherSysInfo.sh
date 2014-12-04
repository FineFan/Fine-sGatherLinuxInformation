#!/bin/bash
#Wirtten by FineFan
#For gathering the brief Information for Servers that handover to me, 
#which I never touched them before they going to the front line to service us
#Version 0.1--notfinished 
#20141204
#fine.fan@hotmail.com

#Hardware Information Begin#############
#Get Manufacturer Information
echo 'System brief infromation:'
dmidecode -t system | awk 'NR>=6&&NR<=9&&NR!=8 {print $0}'

#Get Cpu Information
echo 'CPU brief information:'
dmidecode -t processor | grep Version

#Get Memory Information
echo 'Memory brief information:'
dmidecode -t 17 | grep Size

#Get HardDisk Information
echo 'HardDisk brief information:'
fdisk -l | awk '/^Disk \/dev\/s/{print "       ",$0}'
fdisk -l | awk '/^磁盘 \/dev\/s/{print "       ",$0}'

#Get MainBoard Information
echo 'MainBoard brief information:'
dmidecode -t 2 | awk 'NR>5&&NR<14{print $0}'

#Get Power Supply Information
echo 'Power supply brief information:'
dmidecode -t 39 | awk 'NR>5{print $0}'

#Hardware Information End#############
#OS Information Begin@@@@@@@@@@@@@@@@@

#Login user
echo 'Login user brief information:'
echo -e '\t'`awk -F : '$3 >= 500 {print "Line:",NR,$0}' /etc/passwd | grep -v nologin`

#OS Information End@@@@@@@@@@@@@@@@@@@
