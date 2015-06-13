# Ensure the NAS user is present, and owns the dirs. 
nas:
  user.present:
    - home: /home/nas
    - system: True
  group.present:
    - addusers:
        - nas

{% for sharename, details in pillar['samba_dirs'].iteritems() %}

{{sharename}}:
  file.directory:
    - name: {{ details['path'] }}
    - user: nas
    - group: nas
    - mode: {{ details['mode'] }}

{% endfor %}
