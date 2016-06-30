#
# states/service/rtorrent/init.sls
# EugeneKay/srv-salt
#
# rtorrent
#

## State date
{%  set roles = pillar['roles'] %}
{%  set rtorrent = pillar['rtorrent'] %}

# Package
rtorrent-package:
  pkg.installed:
    - name: rtorrent

# User
rtorrent-user:
  user.present:
    - name: rtorrent
    - home: /srv/rtorrent
    - system: True

# Configuration
rtorrent-config:
  file.managed:
    - name: /etc/rtorrent.rc
    - source: salt://service/rtorrent/rtorrent.rc
    - user: rtorrent
    - group: rtorrent
    - mode: 640
    - template: jinja
    - context:
{%  for key in rtorrent %}
        {{key}}: {{rtorrent[key]}}
{%  endfor %}
rtorrent-rc:
  file.symlink:
    - name: /srv/rtorrent/.rtorrent.rc
    - target: /etc/rtorrent.rc

# Daemon
rtorrent-daemon:
  file.managed:
    - name: /usr/lib/systemd/system/rtorrent.service
    - source: salt://service/rtorrent/rtorrent.service
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: rtorrent
    - enable: True
    - watch:
      - file: rtorrent-config
