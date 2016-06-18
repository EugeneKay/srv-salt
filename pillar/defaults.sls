#
# pillar/defaults.sls
# EugeneKay/srv-salt
#
# Pillar defaults
#


## Roles
roles:
  - None


## Hardware
hardware:
  - None

## System Settings
system:
  master: salt.kashpureff.org
  authentication:
    method: local
    domain: kashpureff.org
    pdc: tokitae
    dcs:
      - tokitae
      - oliver
    groups:
      - domain admins
