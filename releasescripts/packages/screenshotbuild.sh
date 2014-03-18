#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/screenshot && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/screenshot ${BLD_E_PATH}/$1/screenshot-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/screenshot-$1.tar.gz screenshot-$1/

cd ${BLD_E_PATH}/$1/screenshot-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../screenshot-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/screenshot/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../screenshot*.deb
