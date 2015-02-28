#
# states/system/cron/init.sls
# EugeneKay/Salt

# State for cron jobs
#


cron-jobs-salt-minion:
  file.managed:
    - name: /etc/cron.d/salt-minion
    - source:
      - salt://system/cron/files/salt-minion.cron
    - mode: 644
    - user: root
    - group: root
    - defaults:
        hostname: {{grains['localhost']}}
