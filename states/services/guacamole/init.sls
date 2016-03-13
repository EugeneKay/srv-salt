#
# states/services/guacamole/init.sls
# EugeneKay/Salt
#
# State for Gacamole
#

guacamole:
  pkg.installed:
    - pkgs:
      - guacamole
      - guacamole-noauth
      - guacd
      - libguac
      - libguac-client-rdp
      - libguac-client-ssh
    - require:
      - pkg: tomcat
  service:
    - name: guacd
    - running
    - enable: true
  file.managed:
    - name: /etc/guacamole/guacamole.properties
    - source: salt://services/guacamole/files/guacamole.properties
    - user: root
    - group: tomcat
    - mode: 640
    - template: jinja
    - defaults:
        hostname: {{grains['localhost']}}
