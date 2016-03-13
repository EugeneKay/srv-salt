#
# states/services/subsonic/init.sls
# EugeneKay/Salt
#
# Subsonic Server
#

# Package
subsonic-war:
  file.managed:
    - name: /var/lib/tomcat/webapps/subsonic.war
    - source: http://eugenekay.com/repo/subsonic.war
    - source_hash: http://eugenekay.com/repo/SHA512SUMS.txt
    - user: tomcat
    - group: tomcat
    - mode: 644
    - require:
      - pkg: tomcat

# Default data location....
subsonic-var:
  file.symlink:
    - name: /var/subsonic
    - target: /srv/subsonic
# ...Preferred data location
subsonic-data:
  file.directory:
      - name: /srv/subsonic
      - user: tomcat
      - group: tomcat
      - mode: 755
