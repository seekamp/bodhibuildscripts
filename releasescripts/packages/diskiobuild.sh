#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/diskio && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/diskio ${BLD_E_PATH}/$1/diskio-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/diskio-$1.tar.gz diskio-$1/

cd ${BLD_E_PATH}/$1/diskio-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../diskio-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/diskio/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../diskio*.deb
