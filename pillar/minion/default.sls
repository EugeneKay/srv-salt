#
# pillar/machines/default.sls
# EugeneKay/Salt
#
# Default machine data
#

## Roles
roles:
  - none

## Hardware info
hardware:
  - virtual

## System settings
sshd:
  auth: "keys"

