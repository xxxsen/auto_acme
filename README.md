auto_acme
===

## example

```yml
version: "3.0"
services:
  nginx:
    image: nginx:1.20.2
    volumes:
      - ./conf:/etc/nginx/conf.d/
      - ./nginx.conf:/etc/nginx/nginx.conf 
      - ./cert:/cert  
    network_mode: "host"
    restart: unless-stopped
  cron:
    restart: unless-stopped
    image: mcuadros/ofelia:v0.3.6
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock:ro"
      - "./cronjob.ini:/etc/ofelia/config.ini"          
  acme:
    image: xxxsen/acme.sh:3.0.1
    restart: unless-stopped
    volumes:
      - ./cert:/acme.sh
    environment:
      - CF_Email=#your email here
      - CF_Key=#your key here
      - ACME_ACCOUNT=#zerossl account 
      - DOMAIN_LIST=xxx.com;aaa.xxx.com;bbb.xxx.com
```
