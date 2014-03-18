#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/eskiss && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/eskiss ${BLD_E_PATH}/$1/eskiss-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/eskiss-$1.tar.gz eskiss-$1/

cd ${BLD_E_PATH}/$1/eskiss-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../eskiss-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/eskiss/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../eskiss*.deb
