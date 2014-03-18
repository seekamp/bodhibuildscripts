#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/itask && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/itask ${BLD_E_PATH}/$1/itask-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/itask-$1.tar.gz itask-$1/

cd ${BLD_E_PATH}/$1/itask-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../itask-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/itask/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../itask*.deb
