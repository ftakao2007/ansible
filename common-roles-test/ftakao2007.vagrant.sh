#!/bin/sh
if [ -z "$ANSIBLE_GROUP" ]; then
  echo "group? [default : webservers]"
  read group
  if [ -z "$group" ]; then group=webservers; fi
  export ANSIBLE_GROUP=$group
fi
ansible-playbook -i production ftakao2007.vagrant.yml -vvv
