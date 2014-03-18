#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/photo && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/photo ${BLD_E_PATH}/$1/photo-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/photo-$1.tar.gz photo-$1/

cd ${BLD_E_PATH}/$1/photo-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../photo-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/photo/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../photo*.deb
