#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/everything-pidgin && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/everything-pidgin ${BLD_E_PATH}/$1/everything-pidgin_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/everything-pidgin_$1.tar.gz everything-pidgin_$1/

cd ${BLD_E_PATH}/$1/everything-pidgin_$1
dh_make --single --yes -p everything-pidgin_$1 -e jeffhoogland@linux.com -f ../everything-pidgin_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/everything-pidgin/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../everything-pidgin*.deb
