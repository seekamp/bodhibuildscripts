#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/eobj && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/eobj ${BLD_E_PATH}/$1/eobj-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/eobj-$1.tar.gz eobj-$1/

cd ${BLD_E_PATH}/$1/eobj-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../eobj-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/eobj/* debian/
dpkg-buildpackage -rfakeroot 
dpkg -i ../eobj*.deb
