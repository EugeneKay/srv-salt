#
# states/packages/python33/init.sls
# EugeneKay/Salt
#
# Install Python3.3
#

## Repo
{%  if grains['os'] == 'CentOS' and grains['osmajorrelease'] == '7' %}
python33-repo:
  pkg.installed:
    - name: rhscl-python33-epel-7-x86_64

python33-python:
  pkg.installed: []
  file.managed:
    - name: /etc/profile.d/python33.sh
    - source: salt://packages/python33/files/python33.sh
    - user: root
    - group: root
    - mode: 644
    - template: jinja

python33-pip:
  pkg.installed:
    - name: python33-python-setuptools
  cmd.wait:
    - name: "scl enable python33 -- easy_install-3.3 pip"
    - watch:
      - pkg: python33-pip
{%  endif %}
