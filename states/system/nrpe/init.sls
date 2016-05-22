#
# states/system/nrpe/init.sls
# EugeneKay/Salt
#
# Install & configure nrpe
#
{%  set roles = pillar['roles'] %}

## Base Daemon
nrpe:
  pkg.installed:
    - pkgs:
      - nrpe
      - nagios-common
      - nagios-plugins
      - nagios-plugins-disk
      - nagios-plugins-load
      - nagios-plugins-ping
      - nagios-plugins-users
      - nagios-plugins-uptime
      - nagios-plugins-check-updates
  service:
    - running
    - enable: True
    - watch:
      - file: nrpe
  file.managed:
    - name: /etc/nagios/nrpe.cfg
    - source:
      - salt://system/nrpe/files/nrpe.cfg
    - mode: 644
    - user: root
    - group: root
    - makedirs: True
    - template: jinja

## Firewall rules
{%  if "firewall" in roles %}
nrpe-iptables:
  iptables.append:
    - family: ipv4
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 5666
    - source: 173.230.156.35,198.19.0.1
    - jump: ACCEPT
nrpe-ip6tables:
  iptables.append:
    - family: ipv6
    - table: filter
    - chain: INPUT
    - proto: tcp
    - dport: 5666
    - source: 2600:3c01::14:7001,2600:3c01:e001:2900::1
    - jump: ACCEPT
{%  endif %}


## Sudoers config
sudoers-nrpe:
  file.managed:
    - name: /etc/sudoers.d/nrpe
    - source: salt://system/nrpe/files/sudoers.conf
    - mode: 640
    - user: root
    - group: root
    - requires: nrpe.pkg
    - template: jinja

## Custom Plugins
nagios-check-bandwidth:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_bandwidth
    - source:
      - salt://system/nrpe/files/check_bandwidth.sh
    - mode: 755
    - user: root
    - group: root

nagios-check-folder:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_folder
    - source:
      - salt://system/nrpe/files/check_folder.sh
    - mode: 755
    - user: root
    - group: root

nagios-check-io:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_io
    - source: salt://system/nrpe/files/check_io.sh
    - mode: 755
    - user: root
    - group: root

nagios-check-mem:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_mem
    - source:
      - salt://system/nrpe/files/check_mem.pl
    - mode: 755
    - user: root
    - group: root

nagios-check-transfer:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_transfer
    - source:
      - salt://system/nrpe/files/check_transfer.sh
    - mode: 755
    - user: root
    - group: root

{%  if "lvm" in pillar['hardware'] %}
nagios-check-volgroup:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_volgroup
    - source: salt://system/nrpe/files/check_volgroup.sh
    - mode: 755
    - user: root
    - group: root
{%  endif %}
{%  if "raid" in pillar['hardware'] %}
nagios-check-mdadm:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_mdadm
    - source: salt://system/nrpe/files/check_mdadm.sh
    - mode: 755
    - user: root
    - group: root
{%  endif %}
{%  if "temper" in pillar['hardware'] %}
nagios-check-temper:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_temper
    - source: salt://system/nrpe/files/check_temper.sh
    - mode: 755
    - user: root
    - group: root
  pip.installed:
    - name: temperusb
nagios-udev-thermometer:
  file.managed:
    - name: /etc/udev/rules.d/temper.rules
    - source: salt://system/nrpe/files/temper.rules
    - mode: 755
    - user: root
    - group: root
    - template: jinja

{%  endif %}
{%  if "ups" in pillar['hardware'] %}
nagios-check-apcupsd:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_apcupsd
    - source: salt://system/nrpe/files/check_apcupsd.sh
    - mode: 755
    - user: root
    - group: root
apcupsd:
  pkg.installed:
    - name: apcupsd
  service:
    - running
    - enable: True
{%  endif %}
