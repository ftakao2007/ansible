#!/bin/sh

echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi
export ANSIBLE_GROUP=$group

ansible-playbook -i production base.yml -vvv



### other task
#sh useradd.password.sh
sh useradd.key.sh
