; BIND Data for LAN computers.
$TTL	604800
@	IN	SOA	austhaus.com. admin.austhaus.com. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
	IN	NS	ns1.austhaus.com.
ns1.austhaus.com.	IN	A	192.168.1.10

; A Records
austhaus.com.	IN	A	192.168.1.10
router.austhaus.com.	IN	A	192.168.1.254
printer.austhaus.com.	IN	A	192.168.1.11
garage.austhaus.com.	IN	A	192.168.1.1
wintermute.austhaus.com.	IN	A	192.168.1.20

; CNAME Records
blog	IN	CNAME	domains.tumblr.com.
