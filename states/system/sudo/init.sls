#
# states/system/sudo/init.sls
# EugeneKay/salt
#
# System sudo
#

## Sudoers config
sudoers:
  file.managed:
    - name: /etc/sudoers
    - source:
      - salt://system/sudo/files/sudoers.conf
    - mode: 440
    - user: root
    - group: root
    - template: jinja
