#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/shotgun && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/shotgun ${BLD_E_PATH}/$1/shotgun-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/shotgun-$1.tar.gz shotgun-$1/

cd ${BLD_E_PATH}/$1/shotgun-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../shotgun-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/shotgun/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../shotgun*.deb
