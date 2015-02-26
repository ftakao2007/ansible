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

if ! pip list | grep passlib 1> /dev/null; then sudo pip install passlib; fi
echo "psssword?"
read password
crypt_pass=`python -c "from passlib.hash import sha512_crypt; print sha512_crypt.encrypt(\"${password}\")"`
export ANSIBLE_USER_PASS=$crypt_pass

ansible-playbook -i production useradd.password.yml -vvv
