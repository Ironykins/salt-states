# Make sure deluge is configured to run over a specific interface.
# If the interface is not present/configured, deluge is forced to listen on 127.0.0.1

deluge-console_pkg:
  pkg.installed:
    - name: deluge-console

/var/lib/deluge/updateInterface.sh:
  file.managed:
    - source: salt://deluge-interface-bind/updateInterface.sh
    - user: deluge
    - group: deluge
    - mode: 755

updateJob:
  cron.present:
    - name: /var/lib/deluge/updateInterface.sh
    - user: deluge
    - hour: '*/1'
