#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/notification && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/notification ${BLD_E_PATH}/$1/notification-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/notification-$1.tar.gz notification-$1/

cd ${BLD_E_PATH}/$1/notification-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../notification-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/notification/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../notification*.deb
