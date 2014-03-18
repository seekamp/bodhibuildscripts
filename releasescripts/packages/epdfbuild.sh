#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/epdf && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/epdf ${BLD_E_PATH}/$1/epdf_$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/epdf_$1.tar.gz epdf_$1/

cd ${BLD_E_PATH}/$1/epdf_$1
dh_make -p epdf_$1 -e jeffhoogland@linux.com -f ../epdf_$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/epdf/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../epdf*.deb
