#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/packagekit && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/packagekit ${BLD_E_PATH}/$1/packagekit-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/packagekit-$1.tar.gz packagekit-$1/

cd ${BLD_E_PATH}/$1/packagekit-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../packagekit-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/packagekit/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../packagekit*.deb
