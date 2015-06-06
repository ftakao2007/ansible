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
#echo "hostname? [default : node]"
#read host_name
#if [ -z "$host_name" ]; then host_name="node"; fi

echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi

### create inventory
echo "[${group}]" > ${inventoryfile}
echo "${ssh_ip}" >> ${inventoryfile}
### for host_vars
#echo "${host_name}" >> ${inventoryfile}

### create group_vars
if [ ! -d "group_vars" ]; then mkdir group_vars; fi
echo "ansible_ssh_user: \"${ssh_user}\"" > group_vars/${group}
echo "ansible_ssh_port: \"${ssh_port}\"" >> group_vars/${group}
echo "ansible_ssh_private_key_file: \"${ssh_private_key_path}\"" >> group_vars/${group}

### create host_vars
#echo "ansible_ssh_host: \"${ssh_ip}\"" > host_vars/${host_name}

### output example
echo "### ubuntu"
echo "$ ansible-playbook -i ${inventoryfile} -t ubuntu site.yml -vvv"
echo ""

echo "### centos6"
echo "$ ansible-playbook -i ${inventoryfile} -t centos6 site.yml -vvv"
echo ""

echo "### centos7"
echo "$ ansible-playbook -i ${inventoryfile} -t centos7 site.yml -vvv"
echo ""

