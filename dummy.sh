sudo echo 'dummy' >> /etc/modules-load.d/dummy.conf
sudo echo 'install dummy /sbin/modprobe --ignore-install dummy; /sbin/ip link set name owlh dev dummy0 ' >> /etc/modprobe.d/dummy.conf

sudo echo "
NAME=owlh
DEVICE=owlh
#MACADDR=00:22:22:ff:ff:ff
#IPADDR=10.10.10.1
#NETMASK=255.255.255.0
ONBOOT=yes
TYPE=Ethernet
NM_CONTROLLED=no
" > /etc/sysconfig/network-scripts/ifcfg-ethdummy1
