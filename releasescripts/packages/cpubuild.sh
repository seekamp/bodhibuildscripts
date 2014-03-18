#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/cpu && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/cpu ${BLD_E_PATH}/$1/cpu-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/cpu-$1.tar.gz cpu-$1/

cd ${BLD_E_PATH}/$1/cpu-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../cpu-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/cpu/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../cpu*.deb
