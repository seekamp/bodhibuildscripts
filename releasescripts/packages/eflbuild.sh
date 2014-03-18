#!/bin/bash
. ../setenv.sh

cd ${SRC_E_PATH}/efl && make distclean
./autogen.sh
cp -R ${SRC_E_PATH}/efl ${BLD_E_PATH}/$1/efl-$1
cd ${BLD_E_PATH}/$1
tar czvf ${BLD_E_PATH}/$1/efl-$1.tar.gz efl-$1/

cd ${BLD_E_PATH}/$1/efl-$1
make distclean
dh_make --single --yes -e jeffhoogland@linux.com -f ../efl-$1.tar.gz

cp ${BLD_E_PATH}/controlfiles/efl/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../efl*.deb
