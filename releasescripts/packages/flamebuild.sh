#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/flame && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/flame ${BLD_E_PATH}/$1/flame-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/flame-$1.tar.gz flame-$1/

cd ${BLD_E_PATH}/$1/flame-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../flame-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/flame/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../flame*.deb
