#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/ecomorph && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/ecomorph ${BLD_E_PATH}/$1/ecomorph-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/ecomorph-$1.tar.gz ecomorph-$1/

cd ${BLD_E_PATH}/$1/ecomorph-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../ecomorph-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/ecomorph/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../ecomorph*.deb
