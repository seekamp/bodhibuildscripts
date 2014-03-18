#!/bin/bash
. ../setenv.sh

cp -R ${SRC_E_PATH}/efm_path ${BLD_E_PATH}/$1/efm-path_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efm-path_$1.tar.gz efm-path_$1/


cd ${BLD_E_PATH}/$1/efm-path_$1
dh_make -p efm-path_$1 -e jeffhoogland@linux.com -f ../efm-path_$1.tar.gz
make distclean
./autogen.sh
cp ${BLD_E_PATH}/controlfiles/efm-path/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../efm-path*.deb
