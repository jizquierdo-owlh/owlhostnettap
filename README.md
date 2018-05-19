# OwlH Host Network Tap

if you have an AWS deployment this may be useful.

Of course, we are working in provide a better approach, but this is working right now. 

* deploy tcpdump
* register your server in your OwlH master
* use ansible to manage your nodes and traffic capture
* read and analyze your traffic pcap files with Suricata in your OwlH master
* review detected alerts in your kibana dashboards
* use it with your wazuh deployment
