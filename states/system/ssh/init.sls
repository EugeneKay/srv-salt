#
# states/system/ssh/init.sls
# EugeneKay/srv-salt
#
{%  set roles = pillar['roles'] %}

## SSH Daemon
# Package
sshd:
  pkg.installed:
    - name: openssh-server
# Service
  service:
    - name: sshd
    - running
    - enable: True
    - watch:
      - file: sshd
# Config
  file.managed:
    - name: /etc/ssh/sshd_config
    - source:
      - salt://system/ssh/sshd_config.conf
    - mode: 664
    - user: root
    - group: wheel
    - template: jinja
ssh-banner:
  file.managed:
    - name: /etc/ssh/sshd_banner.txt
    - source:
      - salt://system/ssh/banner_{{ pillar['system']['banner'] }}.txt
      - salt://system/ssh/banner.txt
    - mode: 644
    - user: root
    - group: wheel
# Firewall rules
{%  if "firewall" in roles %}
ssh-iptables:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 22
    - jump: ACCEPT
ssh-ip6tables:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 22
    - jump: ACCEPT
{%  endif %}
