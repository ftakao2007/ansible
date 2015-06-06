# vnc

Setup VNC For Ubuntu14.04

## Requirements

- Ubuntu
- Debian

## Role Variables

- `vnc_packages`: vnc depends packages

## Dependencies

None.

## Example Playbook

    ---
    - hosts: all
      sudo: yes
      roles:
      - role: ftakao2007.vnc.ubuntu 

## License

MIT License
