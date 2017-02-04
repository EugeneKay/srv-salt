Certbot State
-------------

After applying state, domains must be enrolled:

```
$ sudo certbot certonly --domains example.com,www.example.comm
```

Certificates will be created in /etc/letsencrypt/live/example.com/.
