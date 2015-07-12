base:
  '*':
    - users
  'server-*':
    - samba_dirs
    - samba_sections
    - sshd_config
    - apache

