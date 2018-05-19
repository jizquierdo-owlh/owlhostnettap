#!/bin/bash
if [[ "$(ps -ef | grep ansible | grep -v grep | grep -v sudo | grep pcapmanage.yaml | wc -l)" = "0" ]] ; then
  echo `date '+%m-%d-%Y %H:%M:%S'`" [owlh-collector] running owlh-collector" >> /tmp/owlh.log
  sudo ansible-playbook /etc/ansible/playbooks/pcapmanage.yaml
else
  echo `date '+%m-%d-%Y %H:%M:%S'`" [owlh-collector] owlh-collector is running - maybe later" >> /tmp/owlh.log
fi
