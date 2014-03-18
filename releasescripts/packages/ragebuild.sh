#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/rage && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/rage ${BLD_E_PATH}/$1/rage-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/rage-$1.tar.gz rage-$1/

cd ${BLD_E_PATH}/$1/rage-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../rage-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/rage/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../rage*.deb
