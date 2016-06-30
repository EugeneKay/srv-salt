#
# states/system/ntp/init.sls
# EugeneKay/srv-salt
#
# Time server
#

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
