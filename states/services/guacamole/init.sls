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
