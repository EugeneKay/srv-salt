#
# pillar/top.sls
# EugeneKay/salt
#
# Pillar database start
#

base:
  "*":
    - machines/default
    - machines/{{grains['id']}}
