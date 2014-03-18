#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/edbus && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/edbus ${BLD_E_PATH}/$1/edbus2-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/edbus2-$1.tar.gz edbus2-$1/

cd ${BLD_E_PATH}/$1/edbus2-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../edbus2-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/edbus2/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../edbus2*.deb
