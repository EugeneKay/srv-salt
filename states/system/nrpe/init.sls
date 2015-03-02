#
# states/system/nrpe/init.sls
# EugeneKay/Salt
#
# Install & configure nrpe
#

## Base Daemon
nrpe:
  pkg.installed:
    - pkgs:
      - nrpe
      - nagios-common
      - nagios-plugins
      - nagios-plugins-load
      - nagios-plugins-ping
      - nagios-plugins-users
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
    - requires: nrpe.pkg
    - template: jinja
    - defaults:
        hostname: {{grains['localhost']}}

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
{%  if "ups" in pillar['hardware'] %}
nagios-check-apcupsd:
  file.managed:
    - name: /usr/lib64/nagios/plugins/check_apcupsd
    - source: salt://system/nrpe/files/check_apcupsd.sh
    - mode: 755
    - user: root
    - group: root
{%  endif %}
