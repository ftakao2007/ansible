# rbenv

rbenv install to `/usr/local/rbenv`

## Requirements

- Ubuntu
- Debian

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
      - role: ftakao2007.rbenv
        rbenv_ruby_version: 2.2.3

## License

MIT License
