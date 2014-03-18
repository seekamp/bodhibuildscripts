#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/bodhi-shutdown && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/bodhi-shutdown ${BLD_E_PATH}/$1/bodhi-shutdown_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/bodhi-shutdown_$1.tar.gz bodhi-shutdown_$1/


cd ${BLD_E_PATH}/$1/bodhi-shutdown_$1
dh_make -p bodhi-shutdown_$1 -e jeffhoogland@linux.com -f ../bodhi-shutdown_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/bodhi-shutdown/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../bodhi-shutdown*.deb
