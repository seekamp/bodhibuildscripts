#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/snow && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/snow ${BLD_E_PATH}/$1/snow-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/snow-$1.tar.gz snow-$1/

cd ${BLD_E_PATH}/$1/snow-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../snow-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/snow/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../snow*.deb
