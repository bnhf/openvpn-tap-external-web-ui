management {{ .Management }}

port {{ .Port }}
proto {{ .Proto }}

dev {{ .Dev }}

ca {{ .Ca }}
cert {{ .Cert }}
key {{ .Key }}

cipher {{ .Cipher }}
keysize {{ .Keysize }}
auth {{ .Auth }}
dh {{ .Dh }}

{{ .Server }}
ifconfig-pool-persist {{ .IfconfigPoolPersist }}
push "dhcp-option DNS {{ .DNSServerOne }}"
push "dhcp-option DNS {{ .DNSServerTwo }}"

keepalive {{ .Keepalive }}

comp-lzo
max-clients {{ .MaxClients }}

persist-key
persist-tun

log /etc/openvpn/openvpn.log
verb 3

mute 10

{{ .ExtraServerOptions }}