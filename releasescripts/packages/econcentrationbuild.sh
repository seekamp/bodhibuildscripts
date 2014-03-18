#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/econcentration && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/econcentration ${BLD_E_PATH}/$1/econcentration-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/econcentration-$1.tar.gz econcentration-$1/

cd ${BLD_E_PATH}/$1/econcentration-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../econcentration-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/econcentration/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../econcentration*.deb
