#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/trash && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/trash ${BLD_E_PATH}/$1/trash-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/trash-$1.tar.gz trash-$1/

cd ${BLD_E_PATH}/$1/trash-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../trash-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/trash/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../trash*.deb
