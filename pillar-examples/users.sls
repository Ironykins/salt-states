users:
  konrad:
    fullname: Konrad Aust
    uid: 2000
    gid: 2000
    groups:
      - sudo
      - nas
    crypt: $password-hash-sha512-prefered
    homeshick_url: https://github.com/Ironykins/dotfiles
    homeshick_reponame: dotfiles
    samba: True #Make a Samba share for this user? (At ~/file/)

  alice:
    fullname: Alice Doe
    groups:
      - nas
    uid: 2001
    gid: 2001
    crypt: $password-hash-sha512-prefered
    samba: True

