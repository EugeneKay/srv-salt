#
# states/service/salt/init.sls
# EugeneKay/srv-salt
#
# Salt Master
#

## State data

# Package
salt-package:
  pkg.installed:
    - name: salt-master

# User
salt-user:
  user.present:
    - name: salt
    - home: /srv/salt
    - system: True

# Configuration
salt-config:
  file.managed:
    - name: /etc/salt/master
    - source: salt://service/salt/files/master.sls
    - user: root
    - group: root
    - mode: 644
    - template: jinja

# Data directories
salt-pki:
  file.directory:
    - name: /srv/salt/pki
    - user: salt
    - group: salt
    - mode: 770
salt-sock:
  file.directory:
    - name: /var/run/salt/master
    - user: salt
    - group: salt
    - mode: 750
salt-cache:
  file.directory:
    - name: /var/cache/salt/master
    - user: salt
    - group: salt
    - mode: 750

# Daemon
salt-daemon:
  service.running:
    - name: salt-master
    - enable: True
    - watch:
      - file: salt-config
