#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/empower && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/empower ${BLD_E_PATH}/$1/empower-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/empower-$1.tar.gz empower-$1/

cd ${BLD_E_PATH}/$1/empower-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../empower-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/empower/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../empower*.deb
