#
# pillar/machines/wenatchee.sls
# EugeneKay/srv-salt
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
  - plex
  - rtorrent
  - tomcat

## rtorrent
#
# Settings for the rtorrent daemon.
#
rtorrent:
  directory: /data/rtorrent
  port_range: 6881-6881
  dht_port: 6881
  bind: 198.19.16.20

