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
  file.managed:
    - name: /etc/krb5.passwd
    - contents: {{ auth['otp'] }}
    - user: root
    - group: root
    - mode: 600
  cmd.run:
    - unless:
      - "test -f /etc/krb5.keytab"
    - name: realm join --one-time-password=$(cat /etc/krb5.passwd) {{ domain }}

## User lookup
auth_sssd:
  file.managed:
    - name: /etc/sssd/sssd.conf
    - source: salt://system/authentication/sssd.conf
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
    - source: salt://system/authentication/nsswitch.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

## Authentication
domain_krb5:
  file.managed:
    - name: /etc/krb5.conf
    - source: salt://system/authentication/krb5.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        domain: {{ domain }}
        dcs: {{ auth['dcs'] }}
        pdc: {{ auth['pdc'] }}
{%  endif %}
