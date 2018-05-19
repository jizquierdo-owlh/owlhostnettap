#!/bin/bash
if [[ "$(ps -ef | grep ansible | grep -v grep | grep -v sudo | grep localsuricata.yaml | wc -l)" = "0" ]] ; then
  echo `date '+%m-%d-%Y %H:%M:%S'`" [owlh-analyzer] running owlh-analyzer" >> /tmp/owlh.log
  sudo ansible-playbook /etc/ansible/playbooks/localsuricata.yaml
else
  echo `date '+%m-%d-%Y %H:%M:%S'`" [owlh-analyzer] owlh-analyzer is running - maybe later" >> /tmp/owlh.log
fi
