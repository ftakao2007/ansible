#!/bin/sh

inventoryfile="production"
../init_user.sh

### output example
echo "$ ansible-playbook -i ${inventoryfile} vim.yml -vvv -k"
echo ""
