{# vim: ft=yaml
# states/service/salt/files/minion.sls
# EugeneKay/srv-salt
-#}
# vim: ft=yaml
# /etc/salt/master
#
# Salt Master configuration
#


## Daemon
user: root
pidfile: /var/run/salt-master.pid
root_dir: /
pki_dir: /srv/salt/pki
sock_dir: /var/run/salt/master
cachedir: /var/cache/salt/master
verify_env: False


## Networking
interface: '::'
ipv6: True
publish_port: 4505
ret_port: 4506


## Performance
worker_threads: 1
job_cache: True
minion_data_cache: True


## Output
state_verbose: True
state_output: changes


## Data
file_roots:
  base:
    - /srv/salt/states
pillar_roots:
  base:
    - /srv/salt/pillar
