samba_sections:
  global:
    workgroup: WORKGROUP
    browsable: yes
    encrypt passwords: True
    netbios name: MYSERVER
    security: user
    unix password sync: yes
    invalid users: root
    writable: yes
    vfs objects: recycle
    wins support: yes
    domain master: yes
    preferred master: yes
    os level: 65
    recycle:repository: .trash
    recycle:keeptree: yes
    recycle:versions: yes
  
  homes:
    comment: Home Directories
    path: /home/%S/file
    browsable: no
    guest ok: no
    create mask: 700
    valid users: "%S"
    invalid users: guest
    force user: "%S"
  
  photos:
    comment: My Photos
    path: /home/nas/photos
    guest ok: yes
    writable: no
    write list: alice
    create mask: 755
    force user: nas
  
  videos:
    comment: My Videos
    path: /home/nas/videos
    guest ok: yes
    writable: yes
    create mask: 755
    force user: nas
  
