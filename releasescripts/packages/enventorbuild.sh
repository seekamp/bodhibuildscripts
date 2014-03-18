#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/enventor && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/enventor ${BLD_E_PATH}/$1/enventor-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/enventor-$1.tar.gz enventor-$1/

cd ${BLD_E_PATH}/$1/enventor-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../enventor-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/enventor/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../enventor*.deb
