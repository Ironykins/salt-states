# Nothing special. Just copies the site into the correct location on the target system.

/var/www:
  file.recurse:
    - source: salt://apache-copysite/austhaus
    - include_empty: True
    - user: root
    - group: root
    - file_mode: 755
    - dir_mode: 755

