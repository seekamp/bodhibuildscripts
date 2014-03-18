#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/expedite && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/expedite ${BLD_E_PATH}/$1/expedite-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/expedite-$1.tar.gz expedite-$1/

cd ${BLD_E_PATH}/$1/expedite-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../expedite-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/expedite/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../expedite*.deb
