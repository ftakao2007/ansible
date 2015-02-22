#!/bin/sh

if [ -z "$ANSIBLE_GROUP" ]; then
  echo "group? [default : webservers]"
  read group
  if [ -z "$group" ]; then group=webservers; fi
  export ANSIBLE_GROUP=$group
fi

ansible-playbook -i production znzj.rbenv.centos7.yml -vvv
