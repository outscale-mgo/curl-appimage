#!/bin/sh

set -x

cp -v $(ldd curl.AppDir/usr/bin/curl | grep '=>' | cut -d ' ' -f 3 | grep -v  -e libm -e libc.so* -e libdl -e ld-linux-x86-64 -e libpthread -e libcurl -e librt) curl.AppDir/usr/lib/
cp -v $(ldd curl.AppDir/usr/lib/libssl.so* | grep '=>' | cut -d ' ' -f 3 | grep -v  -e libm -e libc.so* -e libdl -e ld-linux-x86-64 -e libpthread -e libcurl -e librt) curl.AppDir/usr/lib/
