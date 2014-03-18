#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/eruler && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/eruler ${BLD_E_PATH}/$1/eruler-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/eruler-$1.tar.gz eruler-$1/

cd ${BLD_E_PATH}/$1/eruler-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../eruler-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/eruler/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../eruler*.deb
