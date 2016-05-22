# vim: ft=yaml
# pillar/pki/www-example-com.sls
# EugeneKay/srv-salt
#
# Example SSL certificate
#
# To format the PEM strings:
#
# $ tail -n+2 key.pem | head -n-1 | tr -d '\n'; echo
#

pki:
  www-example-com:
    key: KEYPEM
    cert: CERTPEM
    chain: CHAINPEM
