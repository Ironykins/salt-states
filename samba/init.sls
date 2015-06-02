# Adapted from the samba-formula repo found here:
# https://github.com/saltstack-formulas/samba-formula/blob/master/samba/map.jinja
{% from "samba/map.jinja" import samba with context %}

nas:
  user.present:
    - home: /home/nas
    - system: True
  group.present:
    - addusers:
        - nas

/home/nas/media:
  file.directory:
    - user: nas
    - group: nas
    - mode: 775

/home/nas/family:
  file.directory:
    - user: nas
    - group: nas
    - mode: 775

/home/nas/music:
  file.directory:
    - user: nas
    - group: nas
    - mode: 775

/home/nas/downloads:
  file.directory:
    - user: nas
    - group: nas
    - mode: 775

/home/nas/share:
  file.directory:
    - user: nas
    - group: nas
    - mode: 775

samba:
  pkg.installed:
    - name: {{ samba.server }}
  service.running:
    - name: {{ samba.service }}
    - enable: True
    - require:
      - pkg: samba

