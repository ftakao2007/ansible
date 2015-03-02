staenker.ipv6-support
=========
[![Ansible Galaxy](http://img.shields.io/badge/AnsibleGalaxy-staenker.ipv6--support-blue.svg?style=flat)](https://galaxy.ansible.com/list#/roles/2125)

Ensures that ipv6 is either enabled or disabled on a Debian based system.

Requirements
------------

A Debian based system is enough

Role Variables
--------------

 - enabled, default: true

Dependencies
------------

none

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: staenker.ipv6-support, enabled: false }

License
-------

Apache License, Version 2.0

Author Information
------------------

Awesome dude
