#!/bin/bash
. ./setenv.sh

cd ${SRC_E_PATH}/$2/terminology-$2 && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/$2/terminology-$2 ${BLD_E_PATH}/$1/terminology-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/terminology-$1.tar.gz terminology-$1/


cd ${BLD_E_PATH}/$1/terminology-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../terminology-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/terminology/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../terminology*.deb
