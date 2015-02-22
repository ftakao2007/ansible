#!/bin/sh

echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi
export ANSIBLE_GROUP=$group

### install base packages
ansible-playbook -i production base.yml -vvv

### user add
#sh useradd.password.sh
sh useradd.key.sh

### install rbenv
sh znzj.rbenv.centos7.sh
