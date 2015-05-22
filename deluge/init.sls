deluge:
  user.present: 
    - home: /var/lib/deluge
    - system: True
  group.present:
    - addusers:
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
    
deluged:
  service.running:
    - enable: True

deluge-web:
  service.running:
    - enable: True
    
