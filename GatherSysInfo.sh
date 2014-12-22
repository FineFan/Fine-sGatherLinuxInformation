#!/bin/bash
#Wirtten by FineFan
#For gathering the brief Information for Servers that handover to me,
#which I never touched them before they going to the front line to service us
#Version 0.1.1
#20141222
#fine.fan@hotmail.com
#Hardware Information Begin#############
#Get Manufacturer Information
echo 'System brief infromation:'
dmidecode -t system | awk 'NR>=6&&NR<=9&&NR!=8 {print $0}'
#Get Cpu Information
echo 'CPU brief information:'
dmidecode -t processor | grep Version:
#Get Memory Information
echo 'Memory brief information:'
dmidecode -t 17 | grep Size
#Get HardDisk Information
echo 'HardDisk brief information:'
fdisk -l | awk '/^Disk \/dev\/s/{print "       ",$0}' #There should be seven speaces
fdisk -l | awk '/^磁盘 \/dev\/s/{print "       ",$0}' #There should be seven speaces
#Get MainBoard Information
echo 'MainBoard brief information:'
dmidecode -t 2 | awk 'NR>5&&NR<14{print $0}'
#Get Power Supply Information-----Problem here!!!!!!!!!!!!!!!!!!!!!!!!!
#echo 'Power supply brief information:'
#dmidecode -t 39 | awk 'NR>5{print $0}'
#####################################
# There should be more perceptual one thing is:
# show the physical Ethernet Face on the output.
# show the physical Hard Disk number on the output
#Hardware Information End#############
#OS Information Begin@@@@@@@@@@@@@@@@@
#Hostname
echo 'HostName:'
uname -a | awk '{print "       ",$2}' #There should be seven speaces
#The distro
echo 'The Distro:'
awk '{print "       ",$0}' /etc/redhat-release
#The kernel version
echo 'Kernel Version:'
uname -a | awk '{print "       ",$3}' #There should be seven speaces
#IP information
echo 'IP Information:'
ip addr | awk '{print "       ",$0}' #There should be seven speaces
#Route Information
echo 'Route Information:'
route -n | awk 'NR>1 {print "       ",$0}' #There should be seven speaces
#Disk useage 
echo 'The disk useage:'
df -h --total | awk '{print "       ",$0}' #There should be seven speaces
#Login user
echo 'Login user brief information:'
awk -F : '$3 >= 500 {print "Line:",NR,$0}' /etc/passwd | grep -v nologin | awk '{print "       ",$0}' #There should be seven speaces
#Bridge Information
echo 'Show Bridge Information:'
brctl show | awk '{print "       ",$0}' #There should be seven speaces
#List the KVM machines
echo 'The KVM on this machines:'
virsh list --all | awk '{print "       ",$0}' #There should be seven speaces
#OS Information End@@@@@@@@@@@@@@@@@@@
