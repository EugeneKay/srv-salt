#
# pillar/roles/nagios.sls
# EugeneKay/srv-salt
#
# Load minion data for nagios state
#
{%  set minions=salt.saltutil.runner('mine.get', tgt='*', fun='test.ping', tgt_type='glob') %}

nagios:
  minions:
{%  for id in minions %}
    {{ id }}
{%  endfor %}
