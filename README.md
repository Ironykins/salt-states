<pre>
 ____        _ _     ____  _        _            
/ ___|  __ _| | |_  / ___|| |_ __ _| |_ ___  ___ 
\___ \ / _` | | __| \___ \| __/ _` | __/ _ \/ __|
 ___) | (_| | | |_   ___) | || (_| | ||  __/\__ \
|____/ \__,_|_|\__| |____/ \__\__,_|\__\___||___/
                                                 
</pre>                                                 

Salt states for personal use! 

These are provided publicly in hopes that others attempting to use salt to set up services on their home computers can use them as a reference.

I use some premade saltstack formulas as found [here](https://github.com/saltstack-formulas).
The repositories for these formulas are submoduled, since masterless salt setups do not yet support gitfs.

I have not tested these states extensively. I'm currently using them to provision my home server, and plan to use them to manage all my computers. 

This repo is provided under the [wtf public license](http://www.wtfpl.net).

# TODO
* NFS Setup
* PXE Boot Server
* OpenSSH Key Management
* OpenVPN Server (Maybe)
* Linux Desktop Configuration (Maybe)

# DONE
* Apache Webserver
* BIND9 DNS Server
* OpenSSH Server
* Samba NAS
* User Management
* OpenVPN Client with split routing
* Deluge Torrent Client and Web Interface
* Tunnel Deluge traffic over a VPN
* [Homeshick](https://github.com/andsens/homeshick)
* Fortune (With additional databases of quotes from Discworld, Calvin and Hobbes, and Hitchhiker's Guide to the Galaxy)
* Figlet (With a large collection of extra fonts)
* A server MOTD, with a title generated from a grain called 'informal_name'
* Some frequently used packages (cowsay, ddate, gcc, ghc, git, htop, and vim)

