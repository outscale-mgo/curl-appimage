LIB_DST=curl.AppDir/usr/lib/
BIN_DST=curl.AppDir/usr/bin/

curl-x86_64.AppImage: appimagetool-x86_64.AppImage $(BIN_DST)/curl curl/src/.libs/curl curl/Makefile 
	rm -rvf curl.AppDir/usr/share/man/
	cp curl.desktop curl.AppDir/
	cp AppRun curl.AppDir/
	cp Curl-logo.svg curl.AppDir/
	./cp_other_lib.sh
	./appimagetool-x86_64.AppImage curl.AppDir


appimagetool-x86_64.AppImage:
	wget https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage
	chmod +x appimagetool-x86_64.AppImage

$(BIN_DST)/curl: curl/src/.libs/curl
	make -C curl install

curl/src/.libs/curl: curl/Makefile
	make -C curl

curl/Makefile:
	mkdir -p curl.AppDir/
	./clone_and_config_curl.sh

clean:
	rm -rvf curl appimagetool-x86_64.AppImage curl-x86_64.AppImage curl.AppDir

.PHONY: clean
