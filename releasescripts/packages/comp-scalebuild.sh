#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/comp-scale && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/comp-scale ${BLD_E_PATH}/$1/comp-scale_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/comp-scale_$1.tar.gz comp-scale_$1/


cd ${BLD_E_PATH}/$1/comp-scale_$1
dh_make --single --yes -p comp-scale_$1 -e jeffhoogland@linux.com -f ../comp-scale_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/comp-scale/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../comp-scale*.deb
