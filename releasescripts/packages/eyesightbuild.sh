#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/eyesight && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/eyesight ${BLD_E_PATH}/$1/eyesight_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/eyesight_$1.tar.gz eyesight_$1/

cd ${BLD_E_PATH}/$1/eyesight_$1
dh_make -p eyesight_$1 -e jeffhoogland@linux.com -f ../eyesight_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/eyesight/* debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../eyesight*.deb
