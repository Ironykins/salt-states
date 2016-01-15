deps:
  pkg.installed:
    - pkgs:
      - network-manager
      - awesome
      - awesome-extra
      - light-locker
      - sakura
      - numlockx
      - dex
      - gnome-settings-daemon
      - gnome-keyring
      - synapse
      - pcmanfm
      - seahorse

/usr/share/xsessions/custom.desktop:
  file.managed:
    - source: salt://desktop-env/custom.desktop
