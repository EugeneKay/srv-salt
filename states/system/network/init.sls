#
# states/system/network/init.sls
# EugeneKay/srv-salt
#
# Networking
#

{%  set id = grains['id'] %}
{%  set hostname = id + ".kashpureff.org" %}

## Hostname
network-hostname:
  file.managed:
    - name: /etc/hostname
    - contents: {{ hostname }}
    - user: root
    - group: root
    - mode: 644
  cmd.wait:
    - watch:
      - file: network-hostname
    - name: "hostname -F /etc/hostname"

## Hosts file
network-hosts:
  file.managed:
    - name: /etc/hosts
    - source: salt://system/network/hosts
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        id: {{ id }}
        hostname: {{ hostname }}
