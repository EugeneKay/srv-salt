#
# states/service/znc/init.sls
# EugeneKay/srv-salt
#
# ZNC IRC Bouncer
#

## State options
{%  set roles = pillar['roles'] %}
{%  set pki = pillar['certs'][pillar['znc']['cert']] %}


## Daemon
znc:
  pkg.installed:
    - name: znc
  file.symlink:
    - name: /var/lib/znc/.znc
    - target: /srv/znc
  service.running:
    - enable: true
    - watch:
      - file: znc-config
      - file: znc-pki

# Configuration
znc-config:
  file.managed:
    - name: /srv/znc/configs/znc.conf
    - source: salt://service/znc/files/znc.conf
    - user: znc
    - group: znc
    - mode: 600
    - replace: False
    - makedirs: True
    - template: jinja
    - context:
        hostname: {{grains['fqdn']}}

# PKI
znc-pki:
  file.managed:
    - name: /etc/pki/znc/znc.pem
    - makedirs: True
    - user: root
    - group: znc
    - mode: 640
    - source: salt://certs/stacked.pem
    - template: jinja
    - context:
        key: {{pki['key']}}
        cert: {{pki['cert']}}
        chain: {{pki['chain']}}


## Data storage
znc-data:
  file.directory:
    - name: /srv/znc
    - user: znc
    - group: znc
    - mode: 775


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

