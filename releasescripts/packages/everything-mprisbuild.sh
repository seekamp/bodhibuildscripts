#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/everything-mpris && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/everything-mpris ${BLD_E_PATH}/$1/everything-mpris_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/everything-mpris_$1.tar.gz everything-mpris_$1/


cd ${BLD_E_PATH}/$1/everything-mpris_$1
dh_make --single --yes -p everything-mpris_$1 -e jeffhoogland@linux.com -f ../everything-mpris_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/everything-mpris/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../everything-mpris*.deb
