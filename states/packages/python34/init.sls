#
# states/packages/python34/init.sls
# EugeneKay/Salt
#
# Python 3.4 support
#

## Repo
{%  if grains['os'] == 'CentOS' and grains['osmajorrelease'] == '7' %}
python34-repo:
  file.managed:
    - name: /etc/yum.repos.d/rhscl-python34.repo
    - source: salt://packages/python34/files/rhscl-rh-python34-el7-epel-7.repo
    - user: root
    - group: root
    - mode: 644

python34-python:
  pkg.installed:
    - pkgs:
      - rh-python34-python
      - rh-python34-python-pip
  file.managed:
    - name: /etc/profile.d/python34.sh
    - source: salt://packages/python34/files/python34.sh
    - user: root
    - group: root
    - mode: 644
    - template: jinja
{%  endif %}
