#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/taskbar && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/taskbar ${BLD_E_PATH}/$1/taskbar-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/taskbar-$1.tar.gz taskbar-$1/

cd ${BLD_E_PATH}/$1/taskbar-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../taskbar-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/taskbar/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../taskbar*.deb
