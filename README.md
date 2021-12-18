auto_acme
===

## example

```yml
version: "3.0"
services:    
  acme:
    image: xxxsen/acme.sh:3.0.1
    restart: unless-stopped
    volumes:
      - ./cert:/acme.sh
    environment:
      - CF_Email=#your email here
      - CF_Key=#your key here
      - DOMAIN_LIST=xxx.com;aaa.xxx.com;bbb.xxx.com
```
