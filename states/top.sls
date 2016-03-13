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
    - system.nrpe
    - system.ntp
    - system.salt
    - system.ssh
    - system.sudo
{%  if "dnetc" in roles %}
    - services.dnetc
{%  endif %}
{%  if "subsonic" in roles %}
{%    if "tomcat" not in roles %}
    - services.tomcat
{%    endif %}
    - services.subsonic
{%  endif %}
{%  if "tomcat" in roles %}
    - services.tomcat
{%  endif %}


    - packages.python34
