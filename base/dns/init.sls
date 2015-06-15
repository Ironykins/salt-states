# Adapted from tutorial found here:
# http://prograssing.com/Android/2014/01/02/how-to-setup-a-debian-wheezy-mail-and-dns-server-using-saltstack-bind9/

dns-pkgs:
  pkg.installed:
    - pkgs:
      - bind9
      - dnsutils

/chroot/bind/etc/bind:
  file.directory:
    - user: root
    - group: root
    - makedirs: True
    - require:
      - pkg: dns-pkgs

bind:
  user.present:
    - require:
      - file: /chroot/bind/etc/bind

/etc/systemd/system/named-chroot.service:
  file.managed:
    - source: salt://dns/named-chroot.service
    - file_mode: 755

/chroot/bind/etc/bind/db.austhaus.com:
  file.managed:
    - user: root
    - group: bind
    - source: salt://dns/db.austhaus.com

cp -aR /etc/bind /chroot/bind/etc:
  cmd.run:
    - require: 
      - pkg: dns-pkgs
      - file: /chroot/bind/etc/bind

/chroot/bind/log:
  file.directory:
    - user: root
    - group: bind
    - mode: 775
    - makedirs: true
    - require:
      - cmd: cp -aR /etc/bind /chroot/bind/etc

/chroot/bind/dev:
  file.directory:
    - user: root
    - group: bind
    - makedirs: true
    - require:
      - cmd: cp -aR /etc/bind /chroot/bind/etc

mknod dev/null c 1 3 && mknod dev/zero c 1 5 && mknod dev/random c 1 8:
  cmd.run:
    - cwd: /chroot/bind
    - unless: test -e dev/null
    - require:
      - file: /chroot/bind/dev

/chroot/bind/etc/bind/named.conf.options:
  file.managed:
    - user: root
    - group: bind
    - mode: 640
    - source: salt://dns/named.conf.options
    - require:
      - cmd: cp -aR /etc/bind /chroot/bind/etc

named.conf:
  file.managed:
    - name: /chroot/bind/etc/bind/named.conf
    - user: root
    - group: bind
    - mode: 640
    - source: salt://dns/named.conf
    - require:
      - cmd: cp -aR /etc/bind /chroot/bind/etc

named-chroot:
  service.running:
    - enable: True
    - require:
      - pkg: dns-pkgs

bind9:
  service.dead:
    - enable: False
