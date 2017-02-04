#
# pillar/example.sls
# EugeneKay/srv-salt
#
# Example Pillar data
#
# This file shows most supported options, and is useful for copy-pasting. Some
# options are not logically compatible with each other, but should be valid.
#
# You should assemble this data however works best for you. See the example
# pillar entries given under minion/ for some ideas.
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
  - plex
  - rtorrent
  - salt
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
  - raid
  - temper
  - ups


## System settings
#
# System knobs.
system:
  master: salt.example.com
  authentication:
    method: domain
    domain: example.com
    otp: Ch4ngeMe
# Prestage in Domain using: $ adcli preset-computer --login-user=Administrator --prompt-password --domain=example.com --os-name="CentOS" --os-version="7" --one-time-password Ch4ngeMe <NetBIOS name>
    pdc: dc1
    dcs:
      - dc1
      - dc2
      - dc3
    groups:
      - domain admins
      - domain users
#      - domain guests

## PKI
#
# Certificates, Keys, and related secrets to make available for service states.
#
include:
  - pki.www-example-com


## dnetc
#
# distributed.net client settings
#
## dnetc
dnetc:
  cores: 4

## rtorrent
#
# Settings for the rtorrent daemon.
#
rtorrent:
  directory: /srv/rtorrent
  port_range: 6881-6889
  dht_port: 6881
  bind: 0.0.0.0


## ZNC
#
# Settings for the ZNC service. The named certificate data must be included in
# the "PKI" section'.
#
znc:
  certificate: www-example-com
