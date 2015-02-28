#
# states/top.sls
# EugeneKay/salt
#
# Highstate file
#

{%  set roles = [] %}
base:
  '*':
    - system.cron
    - system.nrpe
    - system.ntp
    - system.salt
    - system.ssh
    - system.sudo
{% if "dnetc" in roles %}
    - services.dnetc
{%  endif %}
