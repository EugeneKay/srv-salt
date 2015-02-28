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
        hostname: {{grains['localhost']}} 
        auth: keys
