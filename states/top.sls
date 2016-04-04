#
# states/top.sls
# EugeneKay/salt
#
# Highstate file
#

{%  set roles = pillar['roles'] %}
base:
  '*':
    - system.cron
    - system.firewall
    - system.network
    - system.nrpe
    - system.ntp
    - system.salt
    - system.ssh
    - system.sudo
{%  if "dnetc" in roles %}
    - services.dnetc
{%  endif %}
{%  if "guacamole" in roles %}
    - services.guacamole
{%  endif %}
{%  if "subsonic" in roles %}
    - services.subsonic
{%  endif %}
{%  if "tomcat" in roles %}
    - services.tomcat
{%  endif %}


    - packages.python34
