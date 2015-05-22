figlet:
    pkg.installed: []

/usr/share/figlet:
  file.recurse:
    - source: salt://figlet/fonts
    - include_empty: True
