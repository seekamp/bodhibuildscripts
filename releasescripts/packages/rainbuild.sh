#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/rain && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/rain ${BLD_E_PATH}/$1/rain-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/rain-$1.tar.gz rain-$1/

cd ${BLD_E_PATH}/$1/rain-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../rain-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/rain/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../rain*.deb
