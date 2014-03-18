#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/bodhi-close && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/bodhi-close ${BLD_E_PATH}/$1/bodhi-close_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/bodhi-close_$1.tar.gz bodhi-close_$1/


cd ${BLD_E_PATH}/$1/bodhi-close_$1
dh_make -p bodhi-close_$1 -e jeffhoogland@linux.com -f ../bodhi-close_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/bodhi-close/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../bodhi-close*.deb
