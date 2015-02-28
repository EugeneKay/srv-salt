#
# pillar/machines/default.sls
# EugeneKay/Salt
#
# Default machine data
#

## Roles
roles:
  - basic

## System settings
system:
  sshd:
    auth: "keys"
