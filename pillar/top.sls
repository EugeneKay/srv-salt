#
# pillar/top.sls
# EugeneKay/srv-salt
#
# Pillar database start
#

{%  set id=grains['id'] %}

base:
  "*":
    - defaults
    - minion/{{ id }}
    - ignore_missing: True
