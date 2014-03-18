#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/envision && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/envision ${BLD_E_PATH}/$1/envision-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/envision-$1.tar.gz envision-$1/

cd ${BLD_E_PATH}/$1/envision-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../envision-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/envision/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../envision*.deb
