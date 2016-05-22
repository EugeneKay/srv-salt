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
{%  if "firewall" in roles %}
    - system.firewall
{%  endif %}
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
{%  if "libresonic" in roles %}
    - services.libresonic
{%  endif %}
{%  if "tomcat" in roles %}
    - services.tomcat
{%  endif %}
{%  if "znc" in roles %}
    - services.znc
{%  endif %}
