#
# states/service/dnetc/init.sls
# EugeneKay/srv-salt
#
# Tomcat Server
#

dnetc:
  pkg:
    - installed
  service:
    - running
    - enable: true
  file.managed:
    - name: /etc/dnetc.ini
    - source:
      - salt://service/dnetc/dnetc.ini
    - mode: 644
    - user: root
    - group: 644
    - template: jinja
    - context:
        threads: {{pillar['dnetc']['threads']}}
