#!/bin/sh


echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi
export ANSIBLE_GROUP=$group

### install base packages
#ansible-playbook -i production base.yml -vvv

### user add
sh useradd.key.sh

### install vagrant

