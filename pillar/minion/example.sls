#
# pillar/machines/example.sls
# EugeneKay/Salt
#
# Example machine data
#
# This file shows most supported options, and is useful for copy-pasting. Some
# options are not logically compatible with each other, but should be valid.
#


## Roles
#
# Apps or services that a minion should provide. Data for roles is provided in
# role-specific keys
#
roles:
  - dnetc
  - guacamole
  - master
  - serve
  - subsonic
  - tomcat
  - znc


## Hardware info
#
# Set properties which match the hardware of a minion. Some combinations are
# logically impossible(eg, physical and virtual).
#
hardware:
  - lvm
  - physical
  - raid
  - temper
  - ups
  - virtual


## System settings
#
system:
  - none

## PKI
#
# Certificates, Keys, and related secrets to make available for service states.
include:
  - pki.www-example-com


## ZNC
#
# Settings for the ZNC service. The certificate must be in
#
znc:
  certificate: www-example-com
