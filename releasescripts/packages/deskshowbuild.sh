#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/deskshow && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/deskshow ${BLD_E_PATH}/$1/deskshow-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/deskshow-$1.tar.gz deskshow-$1/

cd ${BLD_E_PATH}/$1/deskshow-$1
make distclean
yes | dh_make --single -e jeffhoogland@linux.com -f ../deskshow-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/deskshow/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../deskshow*.deb
