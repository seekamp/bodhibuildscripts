#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/azy && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/azy ${BLD_E_PATH}/$1/azy-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/azy-$1.tar.gz azy-$1/

cd ${BLD_E_PATH}/$1/azy-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../azy-$1.tar.gz
cp ${BLD_E_PATH}/controlfiles/azy/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../azy*.deb
