#!/bin/sh

inventoryfile="production"
../init_user.sh

### output example
echo "### ubuntu"
echo "$ ansible-playbook -i ${inventoryfile} -t redmine site.yml -vvv"
echo ""
