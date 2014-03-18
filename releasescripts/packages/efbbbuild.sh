#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/efbb && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/efbb ${BLD_E_PATH}/$1/efbb-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efbb-$1.tar.gz efbb-$1/

cd ${BLD_E_PATH}/$1/efbb-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../efbb-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/efbb/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../efbb*.deb
