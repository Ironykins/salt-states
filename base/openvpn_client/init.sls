# Add a second table to the iptables for vpn, if it's not already there.
echo 1 vpn >> /etc/iproute2/rt_tables:
  cmd.run:
    - unless: grep vpn /etc/iproute2/rt_tables

# Client config file. Mine includes a shared key and CA cert inline
/etc/openvpn/client.conf:
  file.managed:
    - source: salt://openvpn_client/client.conf
    - mode: 600
    - user: root
    - group: root

# Startup script for routing. Specified in client.conf
/etc/openvpn/upscript.sh:
  file.managed:
    - source: salt://openvpn_client/upscript.sh
    - mode: 700
    - user: root
    - group: root

# My VPN uses credentials. Store them in a file here.
/etc/openvpn/credentials:
  file.managed:
    - source: salt://openvpn_client/credentials
    - mode: 700
    - user: root
    - group: root

openvpn:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: openvpn
    - watch: 
      - file: /etc/openvpn/client.conf

