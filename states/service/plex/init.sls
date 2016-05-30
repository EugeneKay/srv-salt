#
# states/service/plex/init.sls
# EugeneKay/Salt
#
# Plex Media Server
#

# Package
plex-package:
  pkg.installed:
    - name: plexmediaserver

# Default data location...
plex-var:
  file.symlink:
    - name: /var/lib/plexmediaserver
    - target: /srv/plex
# ...Preferred data location
plex-data:
  file.directory:
      - name: /srv/plex
      - user: plex
      - group: plex
      - mode: 755
