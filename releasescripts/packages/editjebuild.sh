#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/editje && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/editje ${BLD_E_PATH}/$1/editje-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/editje-$1.tar.gz editje-$1/

cd ${BLD_E_PATH}/$1/editje-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../editje-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/editje/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../editje*.deb
