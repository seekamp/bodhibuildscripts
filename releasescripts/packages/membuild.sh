#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/mem && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/mem ${BLD_E_PATH}/$1/mem-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/mem-$1.tar.gz mem-$1/

cd ${BLD_E_PATH}/$1/mem-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../mem-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/mem/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../mem*.deb
