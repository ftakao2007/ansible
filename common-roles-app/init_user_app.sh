#!/bin/sh

inventoryfile="production"
../init_user.sh

### output example
echo "### ubuntu"
echo "$ ansible-playbook -i ${inventoryfile} -t ubuntu apache.yml -vvv"
echo ""

echo "### centos6"
echo "$ ansible-playbook -i ${inventoryfile} -t centos6 apache.yml -vvv"
echo ""

echo "### centos7"
echo "$ ansible-playbook -i ${inventoryfile} -t centos7 apache.yml -vvv"
echo ""
