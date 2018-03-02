#!/bin/bash
# OwlH master on Amazon Linux

sudo yum update


# Activate epel repository
# TODO - sed command to allow this option

sudo vi /etc/yum.repos.d/epel.repo

[epel]
...
enabled=1

# como decir que no pregunte el yum install
sudo yum install ansible

# Modify ansible host file
# TODO check roles
# TODO register servers - roles

[srv_nodes]
172.31.10.108

# create palybooks folder
sudo mkdir /etc/ansible/playbooks

# Create ssh keys
ssh-keygen -q -t rsa -C "owlmaster@owlh.net" -f .ssh/owl -N ""

# run ansible command ping
# use always --private-key option to avoid cache issues
sudo ansible srvs -m ping -u owl --private-key .ssh/owl

# run tcpdump using ansible and user owl
sudo ansible srvs -a 'sudo tcpdump -i eth0 -n not port 22' -u owl --private-key .ssh/owl


# run tcpdump from playbook
sudo ansible-playbook /etc/ansible/playbooks/tcpdump.yaml --limit 'srvs' -u owl --private-key /home/ec2-user/.ssh/owl


# stop tcpdump
PID=$(/usr/bin/ps -ef | grep tcpdump | grep -v grep | grep -v ".sh" | awk '{print $2}')
/usr/bin/kill -9 $PID
