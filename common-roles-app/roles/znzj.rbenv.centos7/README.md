# rbenv

rbenv install to `/usr/local/rbenv`

## Requirements

- CentOS7

## Role Variables

- `rbenv_root`: rbenv install location
- `rbenv_ruby_version`: global default ruby version
- `rbenv_packages`: rbenv depends packages

## Dependencies

None.

## Example Playbook

    ---
    - hosts: all
      sudo: yes
      roles:
      - role: znzj.rbenv.centos7
        rbenv_ruby_version: 2.1.3

## License

MIT License

## Source
https://galaxy.ansible.com/list#/roles/968
