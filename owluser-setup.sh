#!/bin/bash
# Created 28.02.18
# v0.1 24.05.18 master@owlh.net

# tested in amazon Linux instance
# tested GCLOUD - centos7 - CIS version

# NOTE -- run this script in a server using
# sudo bash owluser-setup.sh


sudo adduser owlh
#echo "create owlh user ssh folder"
#sudo -u owlh mkdir /home/owlh/.ssh
#echo "setting ssh folder permissions"
#sudo -u owlh chmod 700 /home/owlh/.ssh
#echo "create authorized keys file"
#sudo -u owlh touch /home/owlh/.ssh/authorized_keys
#echo "setting authorized keys permissions"
#sudo -u owlh chmod 600 /home/owlh/.ssh/authorized_keys
#echo "include owlmaster key"
echo "be sure you have your owlh master pub key in /tmp/owlhmaster.pub file"
sudo cat /tmp/owlhmaster.pub >> /home/owlh/.ssh/authorized_keys

echo "install tcpdump"
if ! sudo yum list installed tcpdump ; then
    sudo yum -y install tcpdump
fi


# Allow owlh use tcpdump with sudo without password
echo "allow user owlh to use tcpdump and chown"
#sudo sed -i '/^%wheel/a owlh     ALL=(ALL)       NOPASSWD: /usr/sbin/tcpdump' /etc/sudoers
sudo echo "owlh     ALL=(ALL)       NOPASSWD: /usr/sbin/tcpdump" >> /etc/sudoers.d/owlh


# Prepare owlh related stuff folder
echo "prepare owlh stuff folders /etc, /var/log, /usr/share"
sudo mkdir /etc/owlh
sudo mkdir /var/log/owlh
sudo mkdir /usr/share/owlh
sudo mkdir /usr/share/owlh/pcap

sudo chown owlh /etc/owlh
sudo chgrp owlh /etc/owlh
sudo chown owlh /var/log/owlh
sudo chgrp owlh /var/log/owlh
sudo chown -R owlh /usr/share/owlh
sudo chgrp -R owlh /usr/share/owlh

# clean and end
echo "should be done. Enjoy your day."
