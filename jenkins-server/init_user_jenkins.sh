#!/bin/sh

inventoryfile="production"

../init_user.sh

### edit .env
# if [ ! -f ".env" ]; then
# cat << EOS > .env
# ### For roles/redmine/vars/configuration_vars.yml
# export CONFIGURATION_YML_SEND_ADDRESS=example@gmail.com
# export CONFIGURATION_YML_SEND_ADDRESS_PASSWORD=example
# 
# ### For roles/redmine/vars/database_vars.yml
# export DATABASE_YML_ADAPTER=mysql2
# export DATABASE_YML_DATABASE=redmine
# export DATABASE_YML_HOST=localhost
# export DATABASE_YML_USERNAME=redmine
# export DATABASE_YML_PASSWORD=redmine
# EOS
# fi

echo "==========="
echo "vi .env"
echo "source .env"
echo "$ ansible-playbook -i ${inventoryfile} -t jenkins site.yml -vvv"
echo "==========="
