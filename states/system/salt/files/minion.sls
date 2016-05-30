{#
# states/system/salt/files/minion.sls
# EugeneKay/srv-salt
-#}
# vim: ft=yaml
# /etc/salt/minion
#
# Salt Minion config file
#
# Note: this file is managed by Salt. Any changes you make WILL be overwritten.
#

## Include path
default_include: minion.d/*.conf
#include: /etc/salt/minion-local.conf

## Master info
master: salt.kashpureff.org
master_port: 4506
ipv6: True

## Wait between resolution attempts
retry_dns: 30

## User
user: root

## Runtime info
pidfile: /var/run/salt-minion.pid
sock_dir: /var/run/salt/minion
ipc_mode: ipc
root_dir: /
pki_dir: /etc/salt/pki/minion
cachedir: /var/cache/salt/minion

##  Minion info
id: {{id}}

## Variables
verify_env: True
cache_jobs: False
color: true
acceptance_wait_time: 10
loop_interval: 60
dns_check: True
