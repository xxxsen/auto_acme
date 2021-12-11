FROM neilpang/acme.sh:3.0.1

# CloudFlare
ENV CF_Key=
ENV CF_Email=
# DNSPod
ENV DP_Id=
ENV DP_Key=
# CloudXNS
ENV CX_Key=
ENV CX_Secret=
# use to regist an account 
# see: https://github.com/acmesh-official/acme.sh/wiki/ZeroSSL.com-CA
# domain split with ';', exp: aaa.com;b.aaa.com;xx.aaa.com;*.aaa.com
ENV DOMAIN_LIST=

COPY ./entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

VOLUME /acme.sh

CMD ["/bin/sh", "./entrypoint.sh"] 
