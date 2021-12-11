#!/bin/bash

VERSION=3.0.1
cp Dockerfile Dockerfile.tmp
sed -i "s/3.0.1/${VERSION}/g" ./Dockerfile.tmp
docker buildx build -f ./Dockerfile.tmp -t xxxsen/acme.sh:${VERSION} . --platform=linux/amd64,linux/arm64 --push
rm Dockerfile.tmp
