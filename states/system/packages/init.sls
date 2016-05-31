#
# states/system/packages/init.sls
# EugeneKay/srv-salt
#
# System packages
#

packages:
#  pkg.uptodate
  cmd.run:
    - name: yum update -y
    - unless: yum check-update
