#
# states/service/libresonic/init.sls
# EugeneKay/Salt
#
# Subsonic Server
#

# Package
libresonic-war:
  archive.extracted:
    - name: /var/lib/tomcat/webapps/libresonic/
    - source: http://libresonic.org/release/libresonic-develop.war
    - source_hash: http://libresonic.org/release/SHA512SUMS.txt
    - archive_format: zip
    - user: tomcat
    - group: tomcat
    - require:
      - pkg: tomcat

# Default data location....
libresonic-var:
  file.symlink:
    - name: /var/libresonic
    - target: /srv/libresonic
# ...Preferred data location
libresonic-data:
  file.directory:
      - name: /srv/libresonic
      - user: tomcat
      - group: tomcat
      - mode: 755
