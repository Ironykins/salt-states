# For the ympd mpd client.
# A nice web client.

ympd-account:
  group.present:
    - name: ympd
  user.present:
    - name: ympd
    - home: /home/ympd
    - system: True
    - groups:
      - ympd

/etc/systemd/system/ympd.service:
  file.managed:
    - source: salt://ympd/ympd.service
    - file_mode: 755

ympd:
  service.running:
    - enable: True

