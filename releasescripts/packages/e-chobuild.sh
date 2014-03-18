#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/e_cho && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/e_cho ${BLD_E_PATH}/$1/e-cho-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/e-cho-$1.tar.gz e-cho-$1/

cd ${BLD_E_PATH}/$1/e-cho-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../e-cho-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/e_cho/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../e-cho*.deb
