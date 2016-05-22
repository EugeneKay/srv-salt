#
# states/services/znc/init.sls
# EugeneKay/Salt
#
# ZNC IRC Bouncer
#
{%  set roles = pillar['roles'] %}

# Daemon
znc:
  pkg.installed:
    - name: znc
  service.running:
    - enable: true
    - watch:
      - file: znc-config
      - cmd: znc-cert
  file.symlink:
    - name: /var/lib/znc/.znc
    - target: /srv/znc


znc-data:
  file.directory:
    - name: /srv/znc
    - user: znc
    - group: znc
    - mode: 775

znc-config:
  file.managed:
    - name: /srv/znc/configs/znc.conf
    - source: salt://services/znc/files/znc.conf
    - user: znc
    - group: znc
    - mode: 600
    - replace: False
    - makedirs: True
    - template: jinja
    - context:
        hostname: {{grains['fqdn']}}
znc-pki:
  file.directory:
    - name: /etc/pki/znc
    - user: root
    - group: znc
    - mode: 750
znc-cert:
  cmd.run:
    - unless: test -s /etc/pki/znc/znc.pem
    - name: openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout /etc/pki/tls/private/znc.key -out /etc/pki/tls/certs/znc.crt -subj '/C=US/ST=WA/L=Seattle/O=Kashpureff Family/OU=Network Infrastructure/CN={{ grains['fqdn'] }}/emailAddress=systems@kashpureff.org'; cat /etc/pki/tls/certs/znc.crt /etc/pki/tls/private/znc.key > /etc/pki/znc/znc.pem
    - require:
      - file: znc-pki


## Firewall rules
{%  if "firewall" in roles %}
znc-iptables:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 6667
    - jump: ACCEPT
znc-ip6tables:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 6667
    - jump: ACCEPT
znc-iptables-ssl:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 6697
    - jump: ACCEPT
znc-ip6tables-ssl:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 6697
    - jump: ACCEPT
{%  endif %}

