#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/everything-wallpaper && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/everything-wallpaper ${BLD_E_PATH}/$1/everything-wallpaper_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/everything-wallpaper_$1.tar.gz everything-wallpaper_$1/

cd ${BLD_E_PATH}/$1/everything-wallpaper_$1
dh_make --single --yes -p everything-wallpaper_$1 -e jeffhoogland@linux.com -f ../everything-wallpaper_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/everything-wallpaper/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../everything-wallpaper*.deb
