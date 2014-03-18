#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/entrance && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/entrance ${BLD_E_PATH}/$1/entrance-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/entrance-$1.tar.gz entrance-$1/

cd ${BLD_E_PATH}/$1/entrance-$1
make distclean
yes | dh_make --single -e jeffhoogland@linux.com -f ../entrance-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/entrance/* debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../entrance*.deb
