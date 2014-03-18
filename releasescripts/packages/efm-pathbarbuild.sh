#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/ && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/efm_pathbar ${BLD_E_PATH}/$1/efm-pathbar_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efm-pathbar_$1.tar.gz efm-pathbar_$1/

cd ${BLD_E_PATH}/$1/efm-pathbar_$1
dh_make -p efm-pathbar_$1 -e jeffhoogland@linux.com -f ../efm-pathbar_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/efm-pathbar/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../efm-pathbar*.deb
