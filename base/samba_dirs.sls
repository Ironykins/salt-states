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
{% if 'samba' in details %}

/home/{{username}}/file:
  file.directory:
    - user: {{username}}
    - group: {{username}}
    - mode: 700

# If they're not samba users, turn them into samba users.
samba_{{username}}:
  cmd.run:
    - name: smbpasswd -a -n {{username}} 
    - onlyif: "[ $( pdbedit -L | grep -c ^{{username}}: ) -eq 0 ]"

{% endif %}
{% endfor %}

