{% for username, details in pillar['users'].iteritems() %}
{% if 'homeshick_url' in details %}
{% if 'homeshick_reponame' in details %}

install_{{username}}:
  git.latest:
    - name: git://github.com/andsens/homeshick.git
    - rev: master
    - target: /home/{{username}}/.homesick/repos/homeshick
    - require:
      - pkg: git
    - user: {{username}}

#clone_{{username}}:
#  cmd.run:
#    - name: '/home/{{username}}/.homesick/repos/homeshick/bin/homeshick clone {{ details['homeshick_url'] }} -b'
#    - unless: 'test -d /home/{{username}}/.homesick/repos/{{ details['homeshick_reponame'] }}'
#    - require:
#      - git: install_{{username}}
#    - user: {{username}}
#    - group: {{username}}
#
#pull_{{username}}:
#  cmd.run:
#    - name: '/home/{{username}}/.homesick/repos/homeshick/bin/homeshick pull {{ details['homeshick_reponame'] }} -b'
#    - unless: '/home/{{username}}/.homesick/repos/homeshick/bin/homeshick check {{ details['homeshick_reponame'] }}'
#    - require:
#      - git: install_{{username}}
#    - user: {{username}}
#    - group: {{username}}
#
#
#link_{{username}}:
#  cmd.wait:
#    - name: '/home/{{username}}/.homesick/repos/homeshick/bin/homeshick link {{ details['homeshick_reponame'] }} -f'
#    - watch:
#      - cmd: clone_{{username}}
#      - cmd: pull_{{username}}
#    - user: {{username}}
#    - group: {{username}}

{% endif %}
{% endif %}
{% endfor %}
