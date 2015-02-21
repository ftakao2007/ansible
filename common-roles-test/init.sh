#!/bin/sh

echo "private key? [default : ~/.ssh/id_rsa]"
read PRIVATE_KEY_PATH
if [ -z "$PRIVATE_KEY_PATH" ]; then
  PRIVATE_KEY_PATH="~/.ssh/id_rsa"
fi

echo "hostname? [default : node]"
read HOSTNAME
if [ -z "$HOSTNAME" ]; then
  HOSTNAME="node"
fi

echo "group? [default : webservers]"
read group
if [ -z "$group" ]; then group=webservers; fi

echo "IP?"
read IP
if [ -z "$IP" ]; then 
  echo "please set IP"
fi


echo "user name? [default : deploy]"
read user
if [ -z "$user" ]; then user=deploy; fi


if ! pip list | grep passlib 1> /dev/null; then
  sudo pip install passlib
fi
echo "psssword?"
read password
#python -c 'import crypt; print crypt.crypt("${password}", "$1$SomeSalt$")'
crypt_pass=`python -c "from passlib.hash import sha512_crypt; print sha512_crypt.encrypt(\"${password}\")"`
#echo "please edit roles/common/tasks/main.yml"

echo "======================="
echo "export USER_PASS='$crypt_pass'" > .env
echo "export USER=$user" >> .env
echo "please execute below"
echo ". .env"
echo "======================="

### create inventory
#if [ ! -f "production" ];then echo hoge; fi
echo "[${group}]" > production
echo "${HOSTNAME}" >> production

### create group_vars
echo 'ansible_ssh_user: "root"' > group_vars/${group}
echo 'ansible_ssh_port: "22"' >> group_vars/${group}
echo "ansible_ssh_private_key_file: \"${PRIVATE_KEY_PATH}\"" >> group_vars/${group}

### create host_vars
echo "ansible_ssh_host: \"${IP}\"" > host_vars/${HOSTNAME}
