/etc/update-motd.d:
  file.recurse:
    - source: salt://motd/update-motd.d
    - file_mode: 755

/etc/motd.quotes:
  file.managed:
    - source: salt://motd/motd.quotes

/etc/motd:
  file.symlink:
    - target: /var/run/motd
    - force: True

{% set informal_name = salt['grains.get']('informal_name', '') %}

{% if informal_name %}
  
replace_motdname:
  cmd.run: 
    - name: sed -i -e 's/<<Placeholder>>/{{ salt['grains.get']('informal_name', '') }}/g' /etc/update-motd.d/00-header

#'node_type:{{ self }}':
#    - match: grain
#    - {{ self }}
{% endif %}

