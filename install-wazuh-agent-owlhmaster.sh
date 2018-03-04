# install agent
sudo yum -y install wazuh-agent

# register agent
./agent-auth -m 172.31.40.198 -A owlhmaster

# Modify ossec.conf - server_ip
<ossec_config>
  <client>
    <server>
      <address>1.1.1.1</address>
      <port>1514</port>
      <protocol>udp</protocol>
    </server>
    <config-profile>

# Modify ossec.conf - localfile suricata json log
<localfile>
  <log_format>syslog</log_format>
  <location>/var/log/suricata/eve.json</location>
</localfile>
