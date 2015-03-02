#
# pillar/machines/default.sls
# EugeneKay/Salt
#
# Default machine data
#

## Roles
roles:
  - basic

## Hardware info
hardware:
  - virtual

## System settings
sshd:
  auth: "keys"

