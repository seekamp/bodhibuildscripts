#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/net && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/net ${BLD_E_PATH}/$1/net-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/net-$1.tar.gz net-$1/

cd ${BLD_E_PATH}/$1/net-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../net-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/net/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../net*.deb
