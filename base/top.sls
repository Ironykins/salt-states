base:
    '*':
        - zsh
        - users
        - users.sudo
        - vim
        - ddate
        - figlet
        - git
        - cowsay
        - gcc
        - ghc
        - fortune
        - htop
        - homeshick
        - openssh.client
    'server-*':
        - motd
        - samba
        - samba_dirs
        - samba.config
        - deluge
        - apache-copysite
        - apache.debian_full
        - dns
        - openssh
        - openssh.config
        - openvpn_client
        - deluge-interface-bind
