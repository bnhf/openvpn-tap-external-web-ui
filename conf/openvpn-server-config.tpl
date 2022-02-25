management {{ .Management }}
dev {{ .Dev }}
proto {{ .Proto }}
port {{ .Port }}

ca {{ .Ca }}
cert {{ .Cert }}
key {{ .Key }}
dh {{ .Dh }}
ecdh-curve prime256v1

topology subnet
{{ .Server }}
ifconfig-pool-persist {{ .IfconfigPoolPersist }}
push "dhcp-option DNS {{ .DNSServerOne }}"
push "dhcp-option DNS {{ .DNSServerTwo }}"

keepalive {{ .Keepalive }}
remote-cert-tls client
tls-version-min 1.2
tls-crypt {{ .CCEncryption }}
cipher {{ .Cipher }}
keysize {{ .Keysize }}
auth {{ .Auth }}

comp-lzo
max-clients {{ .MaxClients }}
persist-key
persist-tun

log /etc/openvpn/openvpn.log
verb 3
mute 10

{{ .ExtraServerOptions }}