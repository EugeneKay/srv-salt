#
# pillar/machines/jeeves.sls
# EugeneKay/srv-salt
#

## Roles
roles:
  - guacamole
  - salt
  - tomcat
  - nagios

## Nagios
include:
  - roles.nagios

## System settings
system:
  master: localhost
  authentication:
    method: domain
