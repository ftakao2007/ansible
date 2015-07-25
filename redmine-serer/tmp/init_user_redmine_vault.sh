#!/bin/sh

inventoryfile="production"

../init_user.sh


### For configuration.yml
CONF_YML="roles/redmine/vars/configuration_vars.yml"

echo "send mail address? [default : redmine@example.com]"
read send_mail_address
if [ -z "$send_mail_address" ]; then
  send_mail_address="redmine@example.com"
fi

echo "send mail address pass? [default : redmine]"
read send_mail_address_pass
if [ -z "$send_mail_address_pass" ]; then
  send_mail_address_pass="redmine"
fi

echo "configuration_yml_send_address: ${send_mail_address}" > $CONF_YML
echo "configuration_yml_password: ${send_mail_address_pass}" >> $CONF_YML

ansible-vault encrypt $CONF_YML


### output example
echo "### ubuntu"
echo "$ ansible-playbook -i ${inventoryfile} -t redmine site.yml -vvv --ask-vault-pass"
echo ""
