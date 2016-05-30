
# states/service/firewall/init.sls
# EugeneKay/srv-salt
#
# Firewalling
#

## Package
iptables-services:
  pkg.installed

## Service Configuration
iptables:
  file.managed:
    - name: /etc/sysconfig/iptables-config
    - source: salt://service/firewall/files/iptables.config
    - user: root
    - group: root
    - mode: 600
    - template: jinja
  service.running:
    - name: iptables
    - enable: True
ip6tables:
  file.managed:
    - name: /etc/sysconfig/ip6tables-config
    - source: salt://service/firewall/files/ip6tables.config
    - user: root
    - group: root
    - mode: 600
    - template: jinja
  service.running:
    - name: ip6tables
    - enable: True

## INPUT chain
# Flush default rules
iptables-input-flush:
  iptables.flush:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - onlyif: egrep "^# sample configuration" /etc/sysconfig/iptables
    - watch_in:
      - service: iptables
ip6tables-input-flush:
  iptables.flush:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - onlyif: egrep "^# sample configuration" /etc/sysconfig/ip6tables
    - watch_in:
      - service: ip6tables
# Policy
iptables-input-policy:
  iptables.set_policy:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - policy: DROP
ip6tables-input-policy:
  iptables.set_policy:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - policy: DROP
# Existing connections
iptables-input-existing:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: RELATED,ESTABLISHED
    - jump: ACCEPT
ip6tables-input-existing:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: RELATED,ESTABLISHED
    - jump: ACCEPT
# Loopback
iptables-input-loopback:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - in-interface: lo
    - jump: ACCEPT
ip6tables-input-loopback:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - in-interface: lo
    - jump: ACCEPT
# ICMP
iptables-input-icmp:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: icmp
    - jump: ACCEPT
ip6tables-input-icmp:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: icmpv6
    - jump: ACCEPT
# Traceroute
iptables-input-traceroute:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: udp
    - dport: 33434:33523
    - jump: REJECT
ip6tables-input-traceroute:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: udp
    - dport: 33434:33523
    - jump: REJECT
# DHCP6
ip6tables-input-dhcp:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: udp
    - dport: 546
    - destination: fe80::/64
    - jump: ACCEPT

## FORWARD chain
# Policy
iptables-forward-policy:
  iptables.set_policy:
    - family: ipv4
    - table: filter
    - chain: FORWARD
    - policy: DROP
ip6tables-forward-policy:
  iptables.set_policy:
    - family: ipv6
    - table: filter
    - chain: FORWARD
    - policy: DROP

## OUTPUT chain
# Policy
iptables-output-policy:
  iptables.set_policy:
    - family: ipv4
    - table: filter
    - chain: OUTPUT
    - policy: ACCEPT
ip6tables-output-policy:
  iptables.set_policy:
    - family: ipv6
    - table: filter
    - chain: OUTPUT
    - policy: ACCEPT

