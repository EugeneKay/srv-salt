#
# states/system/salt/init.sls
# EugeneKay/srv-salt
#
# Salt Minion daemon

## Salt Minion
salt-minion:
# Package
  pkg.installed:
    - name: salt-minion
# Service
  service:
    - name: salt-minion
    - running
    - enable: true
    - watch:
      - file: salt-minion
# Config
  file.managed:
    - name: /etc/salt/minion
    - source:
      - salt://system/salt/files/minion.sls
    - mode: 664
    - user: root
    - group:  wheel
    - template: jinja
    - defaults:
        id: {{grains['id']}}
        master: {{pillar['system']['master']}}
        hardware: {{pillar['hardware']}}
