# Deluge Salt States
# Adapted from the official systemd tutorial here:
# http://dev.deluge-torrent.org/wiki/UserGuide/Service/systemd

deluge-account:
  group.present:
    - name: nas
  user.present:
    - name: deluge
    - home: /var/lib/deluge
    - system: True
    - groups:
      - nas

nas-ownership:
  user.present: 
    - name: nas
    - home: /home/nas
    - system: True
    - groups:
      - deluge

deluged_pkg:
  pkg.installed:
    - name: deluged

deluge-web_pkg:
  pkg.installed:
    - name: deluge-web

/etc/systemd/system/deluged.service:
  file.managed:
    - source: salt://deluge/deluged.service
    - file_mode: 755

/etc/systemd/system/deluge-web.service:
  file.managed:
    - source: salt://deluge/deluge-web.service
    - file_mode: 755

/var/log/deluge:
  file.directory:
    - user: deluge
    - group: deluge
    - mode: 750

/etc/logrotate.d/deluge:
  file.managed:
      - source: salt://deluge/deluge-logrotate
      - user: deluge
      - group: deluge
    
deluged:
  service.running:
    - enable: True

deluge-web:
  service.running:
    - enable: True

