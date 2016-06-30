#
# states/service/guacamole/init.sls
# EugeneKay/srv-salt
#
# Guacamole server
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
    - source: salt://service/guacamole/guacamole.properties
    - user: root
    - group: tomcat
    - mode: 640
    - template: jinja
