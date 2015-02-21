#!/bin/sh

### for ansible setting

inventoryfile="production"

echo "IP?"
read ssh_ip
if [ -z "$ssh_ip" ]; then echo "please set ip"; fi

echo "ansible ssh user? [default : root]"
read ssh_user
if [ -z "$ssh_user" ]; then ssh_user="root"; fi

echo "ansible ssh port? [default : 22]"
read ssh_port
if [ -z "$ssh_port" ]; then ssh_port="22"; fi

echo "ansible private key? [default : ~/.ssh/id_rsa]"
read ssh_private_key_path
if [ -z "$ssh_private_key_path" ]; then ssh_private_key_path="~/.ssh/id_rsa"; fi

### for inventory setting
echo "hostname? [default : node]"
read host_name
if [ -z "$host_name" ]; then host_name="node"; fi

echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi

#echo "======================="
#echo "export ANSIBLE_SSH_IP=$ssh_ip >> .env
#echo "export ANSIBLE_SSH_USER=$ssh_user >> .env
#echo "export ANSIBLE_SSH_PORT=$ssh_port >> .env
#echo "export ANSIBLE_SSH_PRIVATE_KEY_PATH=$private_key_path" >> .env
#echo "export ANSIBLE_SSH_HOSTNAME=$host_name >> .env
#echo "export ANSIBLE_SSH_GROUP=$group >> .env
#echo "please execute below"
#echo ". .env"
#echo "======================="


### create inventory
echo "[${group}]" > ${inventoryfile}
echo "${host_name}" >> ${inventoryfile}

### create group_vars
echo "ansible_ssh_user: \"${ssh_user}\"" > group_vars/${group}
echo "ansible_ssh_port: \"${ssh_port}\"" >> group_vars/${group}
echo "ansible_ssh_private_key_file: \"${ssh_private_key_path}\"" >> group_vars/${group}

### create host_vars
echo "ansible_ssh_host: \"${ssh_ip}\"" > host_vars/${host_name}
