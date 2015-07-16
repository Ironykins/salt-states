# Deluge Salt States
# Adapted from the official systemd tutorial here:
# http://dev.deluge-torrent.org/wiki/UserGuide/Service/systemd

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

deluge-console_pkg:
  pkg.installed:
    - name: deluge-console

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
    
/var/lib/deluge/updateInterface.sh:
  file.managed:
    - source: salt://deluge/updateInterface.sh
    - user: deluge
    - group: deluge
    - mode: 755

updateJob:
  cron.present:
    - name: /var/lib/deluge/updateInterface.sh
    - user: deluge
    - hour: '*/1'


#This doesn't seem to work properly.
#deluge_config:
#  cmd.run:
#    - user: deluge
#    - shell: /bin/bash
#    - name: |
#        deluge-console config --set plugins_location /var/lib/deluge/.config/deluge/plugins
#        deluge-console config --set move_completed_path /home/nas/downloads
#        deluge-console config --set move_completed true
#        deluge-console config --set enc_level 2
#        deluge-console config --set max_upload_speed 200.0
#        deluge-console config --set max_download_speed 300.0
#        deluge-console config --set listen_interface 255.255.255.255 
