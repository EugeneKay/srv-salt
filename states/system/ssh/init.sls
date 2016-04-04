#
# states/system/ssh/init.sls
# EugeneKay/salt
#

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
      - salt://system/ssh/files/sshd_config.conf
    - mode: 664
    - user: root
    - group: wheel
    - template: jinja
    - defaults:
        auth: keys
# Firewall rules
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

