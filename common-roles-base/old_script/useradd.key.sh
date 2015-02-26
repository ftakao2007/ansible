#!/bin/sh

if [ -z "$ANSIBLE_GROUP" ]; then
  echo "group? [default : webservers]"
  read group
  if [ -z "$group" ]; then group=webservers; fi
  export ANSIBLE_GROUP=$group
fi

echo "user name? [default : deploy]"
read user
if [ -z "$user" ]; then user=deploy; fi
export ANSIBLE_USER=$user

echo "user public key? [default : ~/.ssh/id_rsa.pub]"
read public_key
if [ -z "$public_key" ]; then public_key=~/.ssh/id_rsa.pub; fi
export ANSIBLE_USER_PUBLICK_KEY=$public_key

ansible-playbook -i production useradd.key.yml -vvv
