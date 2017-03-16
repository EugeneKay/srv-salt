#
# states/system/ntp/init.sls
# EugeneKay/srv-salt
#
# Time server
#
{%  set roles = pillar['roles'] %}

## NTP Daemon
ntpd:
  pkg.installed:
    - name: ntp
  file.managed:
    - name: /etc/ntp.conf
    - source:
      - salt://system/ntp/ntp.conf
    - mode: 664
    - user: root
    - group: wheel
    - template: jinja
    - defaults:
        servers: ["0.pool.ntp.org", "1.pool.ntp.org", "2.pool.ntp.org", "3.pool.ntp.org"]
  service.running:
    - enable: True

## Firewall rules
{%  if "firewall" in roles %}
ntp-iptables:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: udp
    - dport: 123
    - source: 173.230.156.35,198.19.0.1
    - jump: ACCEPT
ntp-ip6tables:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: udp
    - dport: 123
    - source: 2600:3c01::14:7001,2600:3c01::14:70ff,2600:3c01:e001:2900::1
    - jump: ACCEPT
{%  endif %}
