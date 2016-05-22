#
# states/top.sls
# EugeneKay/salt
#
# Highstate definition
#

{%  set roles = pillar['roles'] %}
base:
  '*':
    - system.cron
    - system.network
    - system.nrpe
    - system.ntp
    - system.salt
    - system.ssh
    - system.sudo
{%  if "acme" in roles %}
    - service.acme
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
{%  if "tomcat" in roles %}
    - service.tomcat
{%  endif %}
{%  if "znc" in roles %}
    - service.znc
{%  endif %}
