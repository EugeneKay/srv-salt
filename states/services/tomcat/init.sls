#
# states/services/tomcat/init.sls
# EugeneKay/Salt
#
# State for Tomcat
#

## Tomcat Servr
tomcat:
  pkg:
    - installed
  service:
    - running
    - enable: true
