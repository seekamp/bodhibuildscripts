#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/$2/e_dbus-$2 && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/$2/e_dbus-$2 ${BLD_E_PATH}/$1/edbus-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/edbus-$1.tar.gz edbus-$1/

cd ${BLD_E_PATH}/$1/edbus-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../edbus-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/edbus/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../edbus*.deb
