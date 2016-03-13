#
# states/system/ntp/init.sls
# EugeneKay/salt
#
# Time server
#

## NTP Daemon
ntpd:
# Package
  pkg.installed:
    - name: ntp
# Service
  service:
    - name: ntpd
    - running
    - enable: True
    - watch:
      - file: ntpd
# ntpd_config
  file.managed:
    - name: /etc/ntp.conf
    - source:
      - salt://system/ntp/files/ntp.conf
    - mode: 664
    - user: root
    - group: wheel
    - template: jinja
    - defaults:
        servers: ["0.pool.ntp.org", "1.pool.ntp.org", "2.pool.ntp.org", "3.pool.ntp.org"]
