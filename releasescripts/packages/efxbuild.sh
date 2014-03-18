#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/efx && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/efx ${BLD_E_PATH}/$1/efx-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efx-$1.tar.gz efx-$1/

cd ${BLD_E_PATH}/$1/efx-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../efx-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/efx/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../efx*.deb
