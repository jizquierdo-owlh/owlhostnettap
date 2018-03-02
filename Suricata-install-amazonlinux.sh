https://www.openinfosecfoundation.org/download/suricata-4.0.4.tar.gz

sudo yum -y install gcc autoconf
sudo yum -y --enablerepo=epel install pcre-devel libyaml-devel        \
         libpcap-devel file-devel zlib-devel libnetfilter_queue-devel   \
         libnfnetlink-devel libnet-devel libcap-ng-devel jansson-devel  \
         nss-devel GeoIP GeoIP-devel
cd ~
wget https://www.openinfosecfoundation.org/download/suricata-4.0.4.tar.gz
tar xzf suricata-4.0.4.tar.gz
cd suricata-4.0.4/
./configure --prefix=/usr/local/suricata-4.0.4   \
              --sysconfdir=/usr/local/etc          \
              --localstatedir=/var                 \
              --enable-nfqueue                     \
              --enable-gccprotect                  \
              --disable-gcc-march-native           \
              --disable-coccinelle                 \
              --enable-geoip
make
sudo make install-full

sudo /usr/local/suricata-4.0.4/bin/suricata      \
     -c /usr/local/etc/suricata/suricata.yaml    \
     -i eth0
