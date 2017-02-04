#
# states/service/certbot/init.sls
# EugeneKay/srv-salt
#
# Certbot
#

# Package
certbot-package:
  pkg.installed:
    - name: certbot

# Configuration
certbot-config:
  file.managed:
    - name: /etc/letsencrypt/cli.ini
    - source: salt://service/certbot/certbot.ini
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

# Webroot
certbot-webroot:
  file.directory:
    - name: /etc/letsencrypt/webroot
    - user: root
    - group: root
    - mode: 755

# Well-known
certbot-wellknown:
  file.managed:
    - name: /etc/nginx/well-known.conf
    - source: salt://service/certbot/well-known.conf
    - user: root
    - group: root
    - mode: 644

# Cron renewal
certbot-cron:
  file.managed:
    - name: /etc/cron.d/certbot
    - source: salt://service/certbot/certbot.cron
    - user: root
    - group: root
    - mode: 644
