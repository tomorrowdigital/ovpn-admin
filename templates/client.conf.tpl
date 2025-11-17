# VPN Settings
{{- range $server := .Hosts }}
remote {{ $server.Host }} {{ $server.Port }} tcp4
{{- end }}
verb 4
client
nobind
dev tun
cipher AES-128-CBC
key-direction 1
redirect-gateway def1
tls-client
remote-cert-tls server

#disable ipv6
#https://community.openvpn.net/openvpn/ticket/849
pull-filter ignore "route-ipv6"
pull-filter ignore "ifconfig-ipv6"

<cert>
{{ .Cert -}}
</cert>
<key>
{{ .Key -}}
</key>
<ca>
{{ .CA -}}
</ca>
<tls-auth>
{{ .TLS -}}
</tls-auth>