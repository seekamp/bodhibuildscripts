#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/enjoy && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/enjoy ${BLD_E_PATH}/$1/enjoy-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/enjoy-$1.tar.gz enjoy-$1/

cd ${BLD_E_PATH}/$1/enjoy-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../enjoy-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/enjoy/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../enjoy*.deb
