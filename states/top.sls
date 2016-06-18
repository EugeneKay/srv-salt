#
# states/top.sls
# EugeneKay/srv-salt
#
# Highstate definition
#

{%  set roles = pillar['roles'] %}
base:
  '*':
## Global
    - system.authentication
    - system.cron
    - system.network
    - system.nrpe
    - system.ntp
    - system.packages
    - system.salt
    - system.ssh
    - system.sudo

## Role-Based
{%  if "acme" in roles %}
    - service.acme
{%  endif %}
{%  if "dnetc" in roles %}
    - service.dnetc
{%  endif %}
{%  if "firewall" in roles %}
    - service.firewall
{%  endif %}
{%  if "guacamole" in roles %}
    - service.guacamole
{%  endif %}
{%  if "libresonic" in roles %}
    - service.libresonic
{%  endif %}
{%  if "plex" in roles %}
    - service.plex
{%  endif %}
{%  if "rtorrent" in roles %}
    - service.rtorrent
{%  endif %}
{%  if "salt" in roles %}
    - service.salt
{%  endif %}
{%  if "tomcat" in roles %}
    - service.tomcat
{%  endif %}
{%  if "znc" in roles %}
    - service.znc
{%  endif %}
