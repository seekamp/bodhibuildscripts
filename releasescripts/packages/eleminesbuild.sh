#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/elemines && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/elemines ${BLD_E_PATH}/$1/elemines-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/elemines-$1.tar.gz elemines-$1/

cd ${BLD_E_PATH}/$1/elemines-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../elemines-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/elemines/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../elemines*.deb
