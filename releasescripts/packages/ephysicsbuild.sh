#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/ephysics && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/ephysics ${BLD_E_PATH}/$1/ephysics-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/ephysics-$1.tar.gz ephysics-$1/

cd ${BLD_E_PATH}/$1/ephysics-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../ephysics-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/ephysics/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../ephysics*.deb
