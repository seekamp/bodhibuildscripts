#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/everything-places && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/everything-places ${BLD_E_PATH}/$1/everything-places_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/everything-places_$1.tar.gz everything-places_$1/

cd ${BLD_E_PATH}/$1/everything-places_$1
dh_make --single --yes -p everything-places_$1 -e jeffhoogland@linux.com -f ../everything-places_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/everything-places/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../everything-places*.deb
