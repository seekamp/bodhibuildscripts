#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/moon && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/moon ${BLD_E_PATH}/$1/moon-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/moon-$1.tar.gz moon-$1/

cd ${BLD_E_PATH}/$1/moon-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../moon-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/moon/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../moon*.deb
