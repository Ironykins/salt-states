fortune:
  pkg.installed: []

/usr/share/games/fortunes:
  file.recurse:
    - source: salt://fortune/fortunes
    - include_empty: True
