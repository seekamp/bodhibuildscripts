#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/ephoto && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/ephoto ${BLD_E_PATH}/$1/ephoto-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/ephoto-$1.tar.gz ephoto-$1/


cd ${BLD_E_PATH}/$1/ephoto-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../ephoto-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/ephoto/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../ephoto*.deb
