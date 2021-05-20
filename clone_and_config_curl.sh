#!/bin/sh

BRANCH=curl-7_76_1

git clone https://github.com/curl/curl.git
cd curl
git checkout $BRANCH
./buildconf
./configure --with-openssl --prefix=$PWD/../curl.AppDir/usr/
