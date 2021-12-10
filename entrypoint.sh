#!/bin/sh

# https://gist.github.com/williamdes/a8f15c7acaa71cd4437c4a903784f0e1

if [ "${DOMAIN_LIST}" = "" ]; then
    echo "invalid domain list, try example.com;a.example.com;b.example.com"
    exit 1
fi

if [ "${ACME_ACCOUNT}" = "" ]; then
    echo "need an acme account...."
    exit 2
fi 	


names=$(echo ${DOMAIN_LIST}| awk -F";" '{ for(i=1; i<=NF; i++){ printf "-d "$i" -d *."$i" " } }')
echo "READ DOMAIN LIST:${names}"

cnt=$(cat /acme.sh/account.conf | grep SAVED | wc -l)

if [ "$cnt" = "0" ]; then
    echo "regist account:${ACME_ACCOUNT}"
    acme.sh  --register-account  -m ${ACME_ACCOUNT} --server zerossl    
    echo 'Asking for certificates'
    acme.sh --issue \
        ${names} \
        --dns dns_cf
fi

echo 'Listing certs'
acme.sh --list
# Make the container keep running
/entry.sh daemon
