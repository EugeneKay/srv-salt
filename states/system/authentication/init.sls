#
# states/system/authentication/init.sls
# EugeneKay/srv-salt
#
# Authentication, via Domain
#

## State data
{%  set auth = pillar['system']['authentication'] %}
{%  set domain = auth['domain'] %}

{%  if auth['method'] == "domain" %}
## Requirements
auth_packages:
  pkg.installed:
    - names:
      - adcli
      - realmd
      - sssd
      - oddjob
      - oddjob-mkhomedir
      - samba-common

## Domain Join
auth_realm:
  cmd.run:
    - onlyif:
      - "[ -z $(realm list | grep {{ domain }} ) ]"
    - name: realm join --one-time-password={{ auth['otp'] }} {{ domain }}

## User lookup
auth_sssd:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://system/authentication/files/sssd.conf
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - context:
        domain: {{ domain }}
        groups: {{ auth['groups'] }}
  service.running:
    - name: sssd
    - enable: True
    - watch:
      - file: auth_sssd

## ID mapping
auth_nsswitch:
  file.managed:
    - name: /etc/nsswitch.conf
    - source: salt://system/authentication/files/nsswitch.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

## Authentication
domain_krb5:
  file.managed:
    - name: /etc/krb5.conf
    - source: salt://system/authentication/files/krb5.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        domain: {{ domain }}
        dcs: {{ auth['dcs'] }}
        pdc: {{ auth['pdc'] }}
{%  endif %}
