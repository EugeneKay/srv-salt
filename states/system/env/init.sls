#
# states/system/env/init.sls
# EugeneKay/srv-salt
#
# Environment variable hax
#

## SSH Daemon
# Package
env_hax:
  file.managed:
    - name: /etc/profile.d/0_env.sh
    - source: salt://system/env/env.sh
    - mode: 664
    - user: root
    - group: wheel
    - template: jinja
