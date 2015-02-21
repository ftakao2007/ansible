#!/bin/sh

if [ -z "$DO_PRIVATE_KEY_PATH" ]; then
 echo "please set DO_PRIVATE_KEY_PATH"
 exit 1
fi

if [ -z "$DO_HOSTNAME" ]; then
 echo "please set DO_HOSTNAME"
 exit 1
fi

echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi

echo "IP?"
read IP
if [ -z "$IP" ]; then 
  echo "please set IP"
fi



### create inventory
#if [ ! -f "production" ];then echo hoge; fi
echo "[${group}]" > production
echo "${DO_HOSTNAME}" >> production

### create group_vars
echo 'ansible_ssh_user: "root"' > group_vars/${group}
echo 'ansible_ssh_port: "22"' >> group_vars/${group}
echo "ansible_ssh_private_key_file: \"${DO_PRIVATE_KEY_PATH}\"" >> group_vars/${group}

### create host_vars
echo "ansible_ssh_host: \"${IP}\"" > host_vars/${DO_HOSTNAME}
