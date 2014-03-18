#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/enki && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/enki ${BLD_E_PATH}/$1/enki-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/enki-$1.tar.gz enki-$1/

cd ${BLD_E_PATH}/$1/enki-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../enki-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/enki/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../enki*.deb
