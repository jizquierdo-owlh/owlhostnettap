#!/bin/bash
# 28.02.18 tested in amazon Linux instance - @owlmaster

# NOTE -- run this script in a server using
# sudo bash owluser-setup.sh


sudo adduser owl
echo "create owl user ssh folder"
sudo -u owl mkdir /home/owl/.ssh
echo "setting ssh folder permissions"
sudo -u owl chmod 700 /home/owl/.ssh
echo "create authorized keys file"
sudo -u owl touch /home/owl/.ssh/authorized_keys
echo "setting authorized keys permissions"
sudo -u owl chmod 600 /home/owl/.ssh/authorized_keys
echo "include owlmaster key"
sudo -u owl echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUcJhz9gpE2a1gra67eF/0jjsTBtNHRMawZGLDjQM5mXkmcfy4BTrykvuby0eEEO9hhSRMA5so9cAsmAkQKpW0dxRx0Y5c8LKwrtkzmOHrltQrFTeLmaJaojXDIjVch6XNTwOSnOO9b9O5KKjsJe86I55YP+4sf3ux7azEYVEUWzoN5aqELe+Z4+/A93F142QlJLuCra3Jp5GgeZoBBU7H2bKnSOXOmEQHUjiPETDUDTb1xyb3lVdYALAW3P424KvfmoTK+i3S8hy9vMHcgHQUkyH8ijfKbHZ0V0PTC5WEqVp6bGSGmd2qzyUbapeCnzrtWjiGEhFIL+jZoIg3xXH/ owlmaster@owlh.net" >> /home/owl/.ssh/authorized_keys

echo "install tcpdump"
sudo yum -y install tcpdump

# Allow owl use tcpdump with sudo without password
echo "allow user owl to use tcpdump"
sudo sed -i '/^root/a owl     ALL=(ALL)       NOPASSWD: /usr/sbin/tcpdump' /etc/sudoers

# JUST IN CASE -
# sudo -u owl sudo tcpdump -i eth0

# Prepare owlh related stuff folder
echo "prepare owlh stuff folder /var/owlh"
sudo mkdir /var/owlh
sudo chown owl /var/owlh
sudo -u owl mkdir /var/owlh/traffic
sudo -u owl mkdir /var/owlh/etc
sudo -u owl mkdir /var/owlh/bin

# clean and end
echo "should be done. Enjoy your day."
