# Ensure the NAS user is present, and owns the dirs. 
nas:
  user.present:
    - home: /home/nas
    - system: True
  group.present:
    - addusers:
        - nas

# Make all the dirs.
{% for sharename, details in pillar['samba_dirs'].iteritems() %}

{{sharename}}:
  file.directory:
    - name: {{ details['path'] }}
    - user: nas
    - group: nas
    - mode: {{ details['mode'] }}

{% endfor %}

# Make personal samba dirs.
{% for username, details in pillar['users'].iteritems() %}

/home/{{username}}/file:
  file.directory:
    - user: {{username}}
    - group: {{username}}
    - mode: 700

{% endfor %}
