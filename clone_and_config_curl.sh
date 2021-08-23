#!/bin/sh

BRANCH=http_aws_sigv4_encoding

git clone https://github.com/outscale-dev/curl.git
cd curl
git checkout $BRANCH
./buildconf
./configure --with-openssl --prefix=$PWD/../curl.AppDir/usr/
