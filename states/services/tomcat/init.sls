#
# states/services/tomcat/init.sls
# EugeneKay/Salt
#
# Tomcat Server
#

tomcat:
  pkg:
    - installed
  service:
    - running
    - enable: true
