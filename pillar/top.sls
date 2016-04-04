#
# pillar/top.sls
# EugeneKay/salt
#
# Pillar database start
#

{%  set id=grains['id'] %}

base:
  "*":
    - minion/default
    - minion/{{ id }}
    - ignore_missing: True
