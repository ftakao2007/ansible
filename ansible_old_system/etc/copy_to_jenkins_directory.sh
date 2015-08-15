#!/bin/sh

hosts_file=$1

if [ -z $hosts_file ]; then
  echo hosts file?
  read hosts_file
fi

#echo $hosts_file
#exit 

mv $hosts_file /home/vagrant/ansible/etc
sudo cp /home/vagrant/ansible/etc/$hosts_file /var/lib/jenkins/userContent
