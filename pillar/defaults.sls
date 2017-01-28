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
  banner: goatse
  master: salt.kashpureff.org
  authentication:
    method: domain
    domain: kashpureff.org
    pdc: tokitae
    dcs:
      - tokitae
      - oliver
      - yakima
    groups:
      - domain admins
    otp: Ch4ngeMe
