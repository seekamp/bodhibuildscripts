#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/enlil && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/enlil ${BLD_E_PATH}/$1/enlil-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/enlil-$1.tar.gz enlil-$1/

cd ${BLD_E_PATH}/$1/enlil-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../enlil-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/enlil/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../enlil*.deb
