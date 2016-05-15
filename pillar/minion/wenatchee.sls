#
# pillar/machines/wenatchee.sls
# EugeneKay/salt
#


## Hardware properties
hardware:
  - physical
  - lvm
  - raid
  - temper
  - ups

## Roles
roles:
  - libresonic
  - tomcat
