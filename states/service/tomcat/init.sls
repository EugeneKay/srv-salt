#
# states/service/tomcat/init.sls
# EugeneKay/srv-salt
#
# Tomcat Server
#

tomcat:
  pkg:
    - installed
  service:
    - running
    - enable: true
